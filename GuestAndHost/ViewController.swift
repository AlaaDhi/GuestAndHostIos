//
//  ViewController.swift
//  GuestAndHost
//
//  Created by Ayhem on 11/14/17.
//  Copyright © 2017 Ayhem. All rights reserved.
//

import Alamofire
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var usernametf: UITextField!
    @IBOutlet weak var passwordtf: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func loginBtn(_ sender: Any) {
        let URL = "http://localhost/MiniProjet/login.php?username="+usernametf.text!+"&password="+passwordtf.text!
        Alamofire.request(URL).responseString(completionHandler: {response in
            print("Success: \(response.result.isSuccess)")
            print("Response String: \(String(describing: response.result.value!))")
            
            if(response.result.value! == "guest"){
                print("gueest")
                self.performSegue(withIdentifier: "fromLoginToGuestMain",sender: self)
                //let guestMainController = GuestMainController()
                //self.navigationController?.pushViewController(guestMainController, animated: true)
            }else if(response.result.value == "host"){
                print("the user is a host")
            }
            else{
                print("failed")
            }
        })
    }
}

