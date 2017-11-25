//
//  Users.swift
//  GuestAndHost
//
//  Created by Ayhem on 11/22/17.
//  Copyright © 2017 Ayhem. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import Alamofire_SwiftyJSON

public class Users {
    
    
    class func getUserById(id:Int,completion: @escaping (_ error: Error? , _ user: User?)->Void){
        
        let URL = "http://localhost/MiniProjet/Users/getUserById.php?id=\(id)"
        
        Alamofire.request(URL,encoding: URLEncoding.default).responseJSON(completionHandler: {response in
            
            
            switch response.result {
                
            case .failure(let error):
                completion(error,nil)
                print(error)
                return
                
            case .success(let value):
                let json = JSON(value)
                guard let dataarray = json["user"].array else {
                    print(id)
                    print("lkzefoziepfijziejf")
                    completion(nil,nil)
                    return
                }
                
                let user = User()
                for data in dataarray{
                    guard let data = data.dictionary else {
                        return
                    }
                    
                    user.id = data["id"]?.intValue
                    user.username=data["username"]?.stringValue
                    user.email=data["email"]?.stringValue
                    user.password=data["password"]?.stringValue
                    user.name=data["name"]?.stringValue
                    user.age=data["age"]?.intValue
                    user.type=data["type"]?.stringValue
                    print("jizoefzioj"+user.name!)
                    
                }
                
                completion(nil,user)
            }
            
        })
        
    }
    
    
    
}
