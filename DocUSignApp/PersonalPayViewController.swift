//
//  PersonalPayViewController.swift
//  DocUSignApp
//
//  Created by Zaid Alrakabi on 10/14/18.
//  Copyright © 2018 Zaid Alrakabi. All rights reserved.
//

import UIKit
import Alamofire



class PersonalPayViewController: UIViewController {
    


    @IBOutlet weak var receiverName: UILabel!
    
    @IBOutlet weak var sendAmount: UITextField!
    
    @IBOutlet weak var reason: UITextView!
    
    @IBAction func nextTapped(_ sender: UIButton) {
        
        let parameters = [
            "templateId" : "d1fa3c27-27cc-4cdc-af9f-a0956cc0523a"
        ]
        
        let headers = [
            "Authorization": "Bearer eyJ0eXAiOiJNVCIsImFsZyI6IlJTMjU2Iiwia2lkIjoiNjgxODVmZjEtNGU1MS00Y2U5LWFmMWMtNjg5ODEyMjAzMzE3In0.AQkAAAABAAUABwAA6HqY5DHWSAgAACiepicy1kgCAJNMGM8t9dhBuECLw1g3whcVAAEAAAAYAAEAAAAFAAAADQAkAAAAZjBmMjdmMGUtODU3ZC00YTcxLWE0ZGEtMzJjZWNhZTNhOTc4EgABAAAACwAAAGludGVyYWN0aXZlMACAUeKX5DHWSA.2adVMd1LAD30Z_RuzfGDpU1780BcDgWRZFLymr8w0dXieNc4a-OugjxLCuB2BWEvatxBtQsxQY_9xPpnLlVBXT3-rQ0_ZSFgMVDVVbhQIArU8csMcGqyREna3IO4Xgbx2GBJ1O74HE5VcI2C0rPZDKauBQvSgBLynVrwS6iIXnky4B_iCZIovkmez7fc67KOQVLapL2R_upAY9gMqeiLF2gakKf85RSozv7ePlv-sw7jopWn_z9D7GcyygRSzAACZmnz_4DxbCBGL3XcLGb3DQ7uQpZBhHfBfVbmhfz_jeyAOpEXAZGMTrEniRYGW9Yg414ACA6ytRdkLmyfYJawyA",
            "Content-Type": "application/json"
        ]
        
        Alamofire.request("https://demo.docusign.net/restapi/v2/accounts/6811305/powerforms",method: .post, parameters: parameters, headers: headers).responseJSON { response in
            if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
                print("Data: \(utf8Text)")
            }
        }
    }
    
    var fullName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let fullName = self.fullName{
            receiverName.text = fullName
        }
        // Do any additional setup after loading the view.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        sendAmount.resignFirstResponder()
        return true;
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with: UIEvent?){
        reason.resignFirstResponder()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
