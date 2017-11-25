//
//  Offers.swift
//  GuestAndHost
//
//  Created by Ayhem on 11/22/17.
//  Copyright © 2017 Ayhem. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import Alamofire_SwiftyJSON

public class Offers {
    
    var allOffers = [Offer]()
    var user = User()
    
    class func getAll(completion: @escaping (_ error: Error? , _ offers: [Offer]?)->Void){
        
        let URL = "http://localhost/MiniProjet/Offers/getAllOffers.php"
        Alamofire.request(URL,encoding: URLEncoding.default).responseJSON(completionHandler: {response in

            switch response.result {
                
            case .failure(let error):
                completion(error,nil)
                print(error)
                return
                
            case .success(let value):
                let json = JSON(value)
                guard let dataarray = json["offer"].array else {
                    completion(nil,nil)
                    return
                }
                
                let user = User()
                user.id = 1
                user.username="alaa"
                user.password="aaa"
                user.email="a"
                user.type="guest"
                user.age=18
                user.name="a"

                
                var offers = [Offer]()
                
                for data in dataarray{
                    
                    
                    guard let data = data.dictionary else {
                        return
                    }
                    
                    let offer = Offer()
                    offer.id = data["id"]?.intValue
                    offer.name=data["name"]?.stringValue
                    offer.location=data["location"]?.stringValue
                    offer.price=data["price"]?.floatValue
                    offer.bedrooms_nb=data["bedrooms_nb"]?.intValue
                    offer.beds_nb=data["beds_nb"]?.intValue
                    offer.baths_nb=data["baths_nb"]?.intValue
                    offer.description=data["description"]?.stringValue
                    offer.min_duration = data["min_duration"]?.intValue
                    offer.host=user
                    
                    /*let userid = (data["host"]?.intValue)!-1
                    Users.getUserById(id: userid){(error: Error?,user: User? ) in
                        if let user = user{
                            print("rrrrr")
                            print(user.id ?? 88)
                            offer.host = user
                            print(offer.host?.id ?? 00)
                        }
                    }*/
                    
                    offer.rating=data["rating"]?.floatValue
                    offer.voter_nb=data["voter_nb"]?.intValue
                    offers.append(offer)
                }
                
                completion(nil,offers)
            }
            
        })
        
    }
    
    
    
}
