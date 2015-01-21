//
//  ViewController.swift
//  crumbsTest
//
//  Created by Christopher Trevino on 1/21/15.
//  Copyright (c) 2015 Christopher Trevino. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation;

class ViewController: UIViewController, CLLocationManagerDelegate {
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        userLocation 
        // Ask for Authorisation from the User.
       

        super.viewDidLoad()
        locationManager.requestWhenInUseAuthorization();
        
        if CLLocationManager.locationServicesEnabled(){
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
            
        }
        else{
            println("Location service disabled");
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        var locValue:CLLocationCoordinate2D = manager.location.coordinate
        println("locations = \(locValue.latitude) \(locValue.longitude)")
    }


}

