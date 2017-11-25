//
//  OfferDetail.swift
//  GuestAndHost
//
//  Created by Ayhem on 11/23/17.
//  Copyright © 2017 Ayhem. All rights reserved.
//

import UIKit
import MapKit

class OfferDetail: UIViewController,MKMapViewDelegate {

    @IBOutlet weak var ColView: UICollectionView!
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ColView.backgroundColor = UIColor.clear
        mapView.showsUserLocation = true
        
        /*let userLocation = mapView.userLocation
        let region = MKCoordinateRegionMakeWithDistance(
            userLocation.location!.coordinate, 2000, 2000)
        
        mapView.setRegion(region, animated: true)
        */
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func Back(_ sender: Any) {
        self.dismiss(animated: true , completion: nil)
    }
    

}
