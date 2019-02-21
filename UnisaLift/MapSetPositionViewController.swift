//
//  MapSetPositionViewController.swift
//  UnisaLift
//
//  Created by Cafaro Davide on 20/02/2019.
//  Copyright © 2019 RottenApples. All rights reserved.
//
import MapKit
import UIKit

class MapSetPositionViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate, UISearchBarDelegate {
    
    @IBOutlet weak var doneButton: UIButton!
    
    @IBOutlet weak var mapView: MKMapView!
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    var settingPoint = MKPointAnnotation()
    var settingPointTitle : String!
    
    let locationManager = CLLocationManager()
    
    var alreadyLocalized = false
    
    var locality = StringWrapper()
    
    var startPosition : CLLocation!
    
    var startDescription: String = ""
    var arrivalDescription: String = ""
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        searchBar.endEditing(true)
    }
    
    // this function updates the marked position on a touch
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let position: CGPoint = touch.location(in: view)
            
            mapView.removeAnnotation(settingPoint)
            
            settingPoint.coordinate = mapView.convert(position, toCoordinateFrom: self.view)
            settingPoint.title = settingPointTitle
            setGeolocalizedDescription(pointToLabelize: settingPoint, locality: locality)
            
            mapView.addAnnotation(settingPoint)
            mapView.selectAnnotation(settingPoint, animated: false)
            doneButton.isEnabled = true
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.delegate = self
        locationManager.delegate = self
        searchBar.delegate = self
        
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        locationManager.distanceFilter = 50
        locationManager.requestWhenInUseAuthorization()
        mapView.showsUserLocation = false // i only want to display a starting placemark, not showing the current placemark
        locationManager.startUpdatingLocation()
        
        // DEBUG: THE TITLE IS SUPPOSED TO BE PASSED BY THE PREPARE FUNCTION BEFORE THE SEGUE TO THIS MAP, BASING ON WHAT KIND OF POSITION YOU WANT TO SAVE (ex. start point, end point)
        if settingPointTitle == nil {
            settingPointTitle = "Starting point"
        }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.endEditing(true)
        if let search = searchBar.text {
            localSearch(query: search)
        }
        
    }
    
    // this function gets the user location if possible and updates the zooming on the map based on it - WORKS ONLY ONCE
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if !alreadyLocalized {
            alreadyLocalized = true
            guard let locValue: CLLocation = manager.location else { return }
            // DEBUG PRINT
            print("locations = \(locValue.coordinate.latitude) \(locValue.coordinate.longitude)")
            
            settingPoint.coordinate = locValue.coordinate
            settingPoint.title = settingPointTitle
            setGeolocalizedDescription(pointToLabelize: settingPoint, locality: locality)
            mapView.addAnnotation(settingPoint)
            mapView.selectAnnotation(settingPoint, animated: false)
            
            centerMapOnLocation(map: mapView, location: locValue)
            doneButton.isEnabled = true
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if mapView.annotations.isEmpty {
            doneButton.isEnabled = false
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    @IBAction func startDoneButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "showMapAgain", sender: nil)
    }
    
    @IBAction func endDoneButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "confirmingPath", sender: nil)
    }
    
    
    func localSearch(query: String) {
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = query
        request.region = mapView.region
        let search = MKLocalSearch(request: request)
        search.start { (response, error) in
            if error == nil {
                if let res = response {
                    let placemark = res.mapItems[0].placemark
                    self.mapView.removeAnnotation(self.settingPoint)
                    self.settingPoint.coordinate = placemark.coordinate
                    setGeolocalizedDescription(pointToLabelize: self.settingPoint, locality: self.locality)
                    self.mapView.addAnnotation(self.settingPoint)
                    centerMapOnLocation(map: self.mapView, location: placemark.location!)
                    self.mapView.selectAnnotation(self.settingPoint, animated: false)
                    self.doneButton.isEnabled = true
                }
            } }
    }
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        switch segue.identifier {
        case "showMapAgain":
            let destinationView = segue.destination as! MapSetPositionViewController
            
            if let subtitle = settingPoint.subtitle {
                destinationView.startDescription += subtitle
            }
            
            if let location = locality.string {
                if destinationView.startDescription != "" {
                    destinationView.startDescription += ", "
                }
                
                destinationView.startDescription += location
            }
            
            destinationView.settingPointTitle = "Arrival Point"
            destinationView.startPosition = CLLocation(latitude: settingPoint.coordinate.latitude, longitude: settingPoint.coordinate.longitude)
            
            
        case "confirmingPath":
            let destinationView = segue.destination as! MapPathViewController
            destinationView.destination = CLLocation(latitude: settingPoint.coordinate.latitude, longitude: settingPoint.coordinate.longitude)
            destinationView.source = startPosition
            destinationView.startDescription = startDescription
            
            if let subtitle = settingPoint.subtitle {
                destinationView.destDescription += subtitle
            }
            
            if let location = locality.string {
                if destinationView.destDescription != "" {
                    destinationView.destDescription += ", "
                }
                
                destinationView.destDescription += location
            }
            
            
        default:
            return
        }
    }
}


