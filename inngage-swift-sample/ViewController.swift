//
//  ViewController.swift
//  inngage-swift-sample
//
//  Created by Vinicius de Paula on 25/07/16.
//  Copyright © 2016 inngage.me. All rights reserved.
//

import UIKit
import CoreLocation
import PushNotificationManager


class ViewController: UIViewController, CLLocationManagerDelegate {
    
    let locationManager = CLLocationManager()
    let status = CLLocationManager.authorizationStatus()
    var manager:CLLocationManager!

    override func viewDidLoad() {
        super.viewDidLoad()
        if(status == CLAuthorizationStatus.NotDetermined) {
            self.locationManager.requestAlwaysAuthorization();
        }
        else {
            manager = CLLocationManager()
            manager.delegate = self
            manager.desiredAccuracy = kCLLocationAccuracyBest
            manager.startUpdatingLocation()
            PushNotificationManager.sharedInstance.handleUpdateLocations(manager)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}