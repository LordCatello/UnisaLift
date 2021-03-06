//
//  MapViewController.swift
//  UnisaLift
//
//  Created by Cafaro Davide on 19/02/2019.
//  Copyright © 2019 RottenApples. All rights reserved.
//

import UIKit
import MapKit

class MapPathViewController: UIViewController, MKMapViewDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    
    var locationToDisplay: CLLocation! // only useful as CLLocation if we want to display something other than source or destination - we could use a boolean value instead such as displaySource
    var source: CLLocation!
    var destination: CLLocation!
    
    var startDescription: String = ""
    var destDescription: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.mapView.delegate = self
        
        // Do any additional setup after loading the view.
    }
    
    
    
  
    
    // helper function which requests the path from source to dest to the apple servers
    func requestDirectionsTo(from source : CLLocation, to destination : CLLocation) {
        let request = MKDirections.Request()
        request.source = MKMapItem(placemark: MKPlacemark(coordinate: source.coordinate))
        request.destination = MKMapItem(placemark: MKPlacemark(coordinate: destination.coordinate))
        request.transportType = .automobile
        
        let directions = MKDirections(request: request)
        
        directions.calculate { (response, error) in
            if error == nil {
                
                if let r = response {
                    let route = r.routes[0]
                    self.mapView.addOverlay(route.polyline)
                }
                
                //                if let routes = response?.routes {
                //                    for route in routes {
                //                        print(route.distance)
                //                        self.mapView.addOverlay(route.polyline, level: MKOverlayLevel.aboveRoads)
                //                    }
                //                }
                
            } else {
                let alert = UIAlertController(title: "Check internet connection", message: "Error in calculating the directions. Please try again later.", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        }
        
    }
    
    // function called from the mapView as this is its delegate in order to render the directions
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        if let overlay = overlay as? MKPolyline {
            
            let polylineRenderer = MKPolylineRenderer(polyline: overlay)
            polylineRenderer.strokeColor = UIColor.init(red: 218/255, green: 83/255, blue: 18/255, alpha: 1.0)
            return polylineRenderer
        }
        else {
            return MKOverlayRenderer(overlay: overlay)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if locationToDisplay == nil {
            locationToDisplay = source
        }
        
        centerMapOnLocation(map: mapView, location: locationToDisplay)
        
        let sourcePoint = MKPointAnnotation()
        let destinationPoint = MKPointAnnotation()
        
        sourcePoint.coordinate = source.coordinate
        sourcePoint.title = NSLocalizedString("Starting point", comment: "English")
        setGeolocalizedDescription(pointToLabelize: sourcePoint)
        
        destinationPoint.coordinate = destination.coordinate
        destinationPoint.title = NSLocalizedString("Destination point", comment: "English")
        setGeolocalizedDescription(pointToLabelize: destinationPoint)
        
        self.mapView.addAnnotations([sourcePoint, destinationPoint])
        
        requestDirectionsTo(from: source, to: destination)
    }
    
    @IBAction func confirmButtonPressed(_ sender: UIButton) {
       
       performSegue(withIdentifier: "confirmPath", sender: self)
    }
    

    
    
    
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "confirmPath":
            let destinationView = segue.destination as! NewOfferViewController
            destinationView.startPointDesc = startDescription
            destinationView.endPointDesc = destDescription
            destinationView.startPointLocation = source
            destinationView.endPointLocation = destination
        default:
            return
        }
     }
    
    
}
