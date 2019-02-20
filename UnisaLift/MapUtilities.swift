//
//  MapUtilities.swift
//  UnisaLift
//
//  Created by Cafaro Davide on 20/02/2019.
//  Copyright © 2019 RottenApples. All rights reserved.
//

import Foundation
import MapKit



// helper function which centers the view zooming with a neat animation based on regionRadius
func centerMapOnLocation(map mapView: MKMapView, location: CLLocation) {
    let regionRadius: CLLocationDistance = 1000 // zooming distance
    let coordinateRegion = MKCoordinateRegion(center: location.coordinate,
                                              latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
    mapView.setRegion(coordinateRegion, animated: true)
}

// helper function to make descriptions for the Annotation Points
func setGeolocalizedDescription(pointToLabelize: MKPointAnnotation) {
    
    CLGeocoder().reverseGeocodeLocation(CLLocation(latitude: pointToLabelize.coordinate.latitude, longitude: pointToLabelize.coordinate.longitude), completionHandler: { (placemarks, error) in
        if let error = error {
            print("Error while geocoding: ", error.localizedDescription)
            pointToLabelize.subtitle = NSLocalizedString("Street not found - try again later", comment: "Error in geocoding, english")
            return
        }
        pointToLabelize.subtitle = placemarks?[0].thoroughfare
    })
    
}

func setGeolocalizedDescription(pointToLabelize: MKPointAnnotation, locality: StringWrapper) {
    
    CLGeocoder().reverseGeocodeLocation(CLLocation(latitude: pointToLabelize.coordinate.latitude, longitude: pointToLabelize.coordinate.longitude), completionHandler: { (placemarks, error) in
        if let error = error {
            print("Error while geocoding: ", error.localizedDescription)
            pointToLabelize.subtitle = NSLocalizedString("Street not found - try again later", comment: "Error in geocoding, english")
            return
        }
        locality.string = placemarks?[0].locality
        pointToLabelize.subtitle = placemarks?[0].thoroughfare
    })
    
}
