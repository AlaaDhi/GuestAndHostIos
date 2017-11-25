//
//  GuestMainTVCell.swift
//  GuestAndHost
//
//  Created by Ayhem on 11/22/17.
//  Copyright © 2017 Ayhem. All rights reserved.
//

import UIKit

class GuestMainTVCell: UITableViewCell {

    @IBOutlet fileprivate weak var OffersCV: UICollectionView!
}

extension GuestMainTVCell {
    
    func setCollectionViewDataSourceDelegate<D: UICollectionViewDataSource & UICollectionViewDelegate>(_ dataSourceDelegate: D, forRow row: Int) {
        
        OffersCV.delegate = dataSourceDelegate
        OffersCV.dataSource = dataSourceDelegate
        OffersCV.backgroundColor = UIColor.clear
        OffersCV.tag = row
        OffersCV.setContentOffset(OffersCV.contentOffset, animated:false) // Stops collection view if it was scrolling.
        OffersCV.reloadData()
    }
    
    var OffersCVOffset: CGFloat {
        set { OffersCV.contentOffset.x = newValue }
        get { return OffersCV.contentOffset.x }
    }
}

