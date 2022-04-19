//
//  ContentModel.swift
//  City Sights
//
//  Created by Ekkehard Koch on 2022.04.19.
//

import Foundation
import CoreLocation

class ContentModel: NSObject, CLLocationManagerDelegate, ObservableObject {
    var locationManager = CLLocationManager()
    override init() {
        // Call init method of NSObject
        super.init()
        // Set content model as the delegate of the location manager
        locationManager.delegate = self
        // Request permission from the user
        locationManager.requestWhenInUseAuthorization()
    }
    // MARK - Location Manager Delegate Methods
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        if locationManager.authorizationStatus == .authorizedAlways || locationManager.authorizationStatus == .authorizedWhenInUse {
            // We have permission to track user's location
            // Start geolocating the user after we get permission
            locationManager.startUpdatingLocation()
        }
        else if locationManager.authorizationStatus == .denied {
            // We do not have permission to track location
        }
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        // Gives us the the location of the user
        print(locations.first ?? "no location")
        // Stop requestion the location after we get it once
        locationManager.stopUpdatingLocation()
        //TODO: If we have the coordinates of the user send into Yelp API
    }
}
