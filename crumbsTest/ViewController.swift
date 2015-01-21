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
    @IBOutlet weak var map: MKMapView!
    
    override func viewDidLoad() {
        
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
        
        
        let sfGiantsStadiumLocation = CLLocationCoordinate2D(latitude: 37.77831, longitude: -122.38758)
        //set a span to be used by the MKCoordinateRegion structure
        var span = MKCoordinateSpanMake(0.01, 0.01)
        //create MKCoordinateRegion structure
        var coordinateRegion = MKCoordinateRegion(center: sfGiantsStadiumLocation, span: span)
        //set the region of the MKMapView object
        map.setRegion(coordinateRegion, animated: true)
        
        //create an MKPointAnnotation object
        let sfGiantsStadiumAnnotation = MKPointAnnotation()
        //set properties of the MKPointAnnotation object
        sfGiantsStadiumAnnotation.setCoordinate(sfGiantsStadiumLocation)
        sfGiantsStadiumAnnotation.title = "AT & T Park"
        sfGiantsStadiumAnnotation.subtitle = "Home of the San Francisco Giants"
        
        //add the annotation to the map
        map.addAnnotation(sfGiantsStadiumAnnotation)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        var locValue:CLLocationCoordinate2D = manager.location.coordinate
        println("locations = \(locValue.latitude) \(locValue.longitude)")
    }

    class CustomPointAnnotation: MKPointAnnotation {
        var imageName: String!
    }
    

    
}




