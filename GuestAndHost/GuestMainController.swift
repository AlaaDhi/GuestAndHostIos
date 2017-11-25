//
//  GuestMainController.swift
//  GuestAndHost
//
//  Created by Ayhem on 11/22/17.
//  Copyright © 2017 Ayhem. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class GuestMainController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet weak var tv: UITableView!
    
    let model = generateRandomData()
    var storedOffsets = [Int: CGFloat]()
    var alloffers = [Offer]()
    var stateOffers = [Offer]()
    let testlist = ["0","1","2","3","4","5","6","7","8","9","10","11","12","13","14","15"]
    let statesList = ["Ariana","Beja","Ben Arous","Bizerte","Gabes","Gafsa","Jendouba","Kairouan","Kasserine","Kebili","Kef","Mahdia","Manouba","Medenine","Monastir","Nabeul","Sfax","Sidi Bouzid","Siliana","Sousse","Tataouine","Tozeur","Tunis","Zaghouan"]
    
    
    override func viewDidLoad() {
        tv.backgroundColor = UIColor.clear
        super.viewDidLoad()
        Offers.getAll { (error: Error?, offers: [Offer]?) in
            if let  offers = offers {
                self.alloffers = offers
                self.tv.reloadData()
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return statesList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let lbl:UILabel = cell.viewWithTag(-10) as! UILabel
        
        //cell.layer.backgroundColor = UIColor.clear.cgColor
        cell.backgroundColor = UIColor.clear
        lbl.text = statesList[indexPath.item]
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        guard let tableViewCell = cell as? GuestMainTVCell else { return }
        
        tableViewCell.setCollectionViewDataSourceDelegate(self, forRow: indexPath.row)
        tableViewCell.OffersCVOffset = storedOffsets[indexPath.row] ?? 0
    }
    
    func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        guard let tableViewCell = cell as? GuestMainTVCell else { return }
        
        storedOffsets[indexPath.row] = tableViewCell.OffersCVOffset
    }
    
    
    
    
    
    
    
}

extension GuestMainController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        stateOffers.removeAll()
        
        for oo in alloffers{
            if(oo.location == statesList[collectionView.tag]){
                stateOffers.append(oo)
            }
        }
        return stateOffers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        
        cell.contentView.backgroundColor = UIColor.clear
        
        
        //let img:UIImageView = cell.viewWithTag(-1) as! UIImageView
        
       /* Alamofire.request("hhttp://localhost/MiniProjet/Images/img.jpeg").responseImage { response in
            if let image = response.result.value {
                print("image downloaded: \(image)")
                img.image = image
            }
        }*/
        
        
        cell.backgroundColor = UIColor.clear
        
        let lblname:UILabel = cell.viewWithTag(-2) as! UILabel
        lblname.text = stateOffers[indexPath.item].name
        
        let lblprice:UILabel = cell.viewWithTag(-3) as! UILabel
        lblprice.text = (stateOffers[indexPath.item].price?.description)! + "DT"
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Collection view at row \(collectionView.tag) selected index path \(indexPath)")
        let destination = OfferDetail()
        navigationController?.pushViewController(destination, animated: true)
        
    }
}

