//
//  ViewController.swift
//  IOS-Swift-MapKitFlyover
//
//  Created by Pooya on 2018-07-26.
//  Copyright © 2018 Pooya. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    let distance: CLLocationDistance = 800
    let pitch: CGFloat = 400
    let heading = 45.0
    var camera: MKMapCamera?
    
    @IBOutlet weak var mapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.mapType = .satelliteFlyover
        
        // coordinates of Capitol
        let coordinate = CLLocationCoordinate2DMake(49.273376, -123.103834)  // Vancouver, Science World at TELUS World of Science
        //let coordinate = CLLocationCoordinate2DMake(49.221031, -122.812697)  // Vancouver, The Port Mann Bridge
        
        camera = MKMapCamera(lookingAtCenter: coordinate, fromDistance: distance, pitch: pitch, heading: heading)
        mapView.camera = camera!
    }

    @IBAction func rotateLeft(_ sender: Any) {
        UIView.animate(withDuration: 1.0, animations: {
            self.camera!.heading -= 10
            self.mapView.camera = self.camera!
        })
    }
    
    @IBAction func rotateRight(_ sender: Any) {
        UIView.animate(withDuration: 1.0, animations: {
            self.camera!.heading += 10
            self.mapView.camera = self.camera!
        })
    }
    
}

