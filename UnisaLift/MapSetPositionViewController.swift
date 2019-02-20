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
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.delegate = self
        locationManager.delegate = self
        
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        locationManager.distanceFilter = 50
        locationManager.requestWhenInUseAuthorization()
        mapView.showsUserLocation = true
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
