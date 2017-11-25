//
//  RegisterController.swift
//  GuestAndHost
//
//  Created by Ayhem on 11/14/17.
//  Copyright © 2017 Ayhem. All rights reserved.
//

import Alamofire
import UIKit

class RegisterController: UIViewController {
    
    @IBOutlet weak var usernametf: UITextField!
    @IBOutlet weak var Email: UITextField!
    @IBOutlet weak var Passwordtf: UITextField!
    @IBOutlet weak var Nametf: UITextField!
    @IBOutlet weak var type: UISegmentedControl!
    @IBOutlet weak var agetf: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func BackToLogin(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    
    @IBAction func RegisterBtn(_ sender: Any) {
        
        //add condition for empty fields and integer age
        
        
        let URL = "http://localhost/MiniProjet/Register.php"
        
        var typeuser:String
        
        if (type.selectedSegmentIndex == 0) {
            typeuser = "guest"
        }else{
            typeuser = "host"
        }
        print(typeuser)
        
        let parameters: Parameters=[
            "username":usernametf.text!,
            "email":Email.text!,
            "password":Passwordtf.text!,
            "name":Nametf.text!,
            "age":agetf.text!,
            "type":typeuser
        ]
        
        Alamofire.request(URL, parameters: parameters).responseString{
            response in
            
            if(response.result.isSuccess){
                let alert = UIAlertController(title: "success", message: "Account created successfully", preferredStyle: .actionSheet)
                alert.addAction(UIAlertAction(title: "Back to login", style: .default) { action in
                    self.dismiss(animated: true)
                })
                self.present(alert, animated: true)
            }else {
                let alert = UIAlertController(title: "Failed", message: "Failed to create your account", preferredStyle: .actionSheet)
                alert.addAction(UIAlertAction(title: "try again", style: .default) { action in
                })
                self.present(alert, animated: true)
            
            }
        }
    }
}
