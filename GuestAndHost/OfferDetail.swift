//
//  OfferDetail.swift
//  GuestAndHost
//
//  Created by Ayhem on 11/23/17.
//  Copyright © 2017 Ayhem. All rights reserved.
//

import UIKit

class OfferDetail: UIViewController {

    @IBOutlet weak var ColView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ColView.backgroundColor = UIColor.clear

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
