//
//  MapSetPositionViewController.swift
//  UnisaLift
//
//  Created by Cafaro Davide on 20/02/2019.
//  Copyright © 2019 RottenApples. All rights reserved.
//
import MapKit
import UIKit


class MapSetPositionViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet weak var doneButton: UIButton!
    
    @IBOutlet weak var mapView: MKMapView!
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    var settingPoint = MKPointAnnotation()
    var settingPointTitle : String!
    
    let locationManager = CLLocationManager()
    
    // this function updates the marked position on a touch
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let position: CGPoint = touch.location(in: view)
            
            mapView.removeAnnotation(settingPoint)
            
            settingPoint.coordinate = mapView.convert(position, toCoordinateFrom: self.view)
            settingPoint.title = settingPointTitle
            setGeolocalizedDescription(pointToLabelize: settingPoint)
            
            mapView.addAnnotation(settingPoint)
            mapView.selectAnnotation(settingPoint, animated: false)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.delegate = self
        locationManager.delegate = self
        
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        locationManager.distanceFilter = 50
        locationManager.requestWhenInUseAuthorization()
        mapView.showsUserLocation = false // i only want to display a starting placemark, not showing the current placemark
        locationManager.startUpdatingLocation()
        
        // DEBUG: THE TITLE IS SUPPOSED TO BE PASSED BY THE PREPARE FUNCTION BEFORE THE SEGUE TO THIS MAP, BASING ON WHAT KIND OF POSITION YOU WANT TO SAVE (ex. start point, end point)
        settingPointTitle = "Starting point"
    }
    
    // this function gets the user location if possible and updates the zooming on the map based on it
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let locValue: CLLocation = manager.location else { return }
        // DEBUG PRINT
        print("locations = \(locValue.coordinate.latitude) \(locValue.coordinate.longitude)")
        
        settingPoint.coordinate = locValue.coordinate
        settingPoint.title = settingPointTitle
        setGeolocalizedDescription(pointToLabelize: settingPoint)
        mapView.addAnnotation(settingPoint)
        mapView.selectAnnotation(settingPoint, animated: false)
        
        centerMapOnLocation(map: mapView, location: locValue)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        
        
    }
    
    @IBAction func showUserLocation(_ sender: AnyObject) {
        mapView.showsUserLocation = !mapView.isUserLocationVisible
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
