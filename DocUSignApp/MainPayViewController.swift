//
//  MainPayViewController.swift
//  DocUSignApp
//
//  Created by Zaid Alrakabi on 10/13/18.
//  Copyright © 2018 Zaid Alrakabi. All rights reserved.
//

import UIKit

class MainPayViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    let data = ["Eric Bachman", "Zaid Diaz", "Morgan Stanley"]

    var currentName:String?

    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func NextTapped(_ sender: UIButton) {
        if let nextString = currentName{
            print("The name selected is: \(nextString)")
        }
        else{
            print("Error no name selected")
        }
        
    }
    
    override func viewDidLoad() {
            super.viewDidLoad()
            
            tableView.dataSource = self
            tableView.delegate = self
        }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "com.codepath.CustomTableViewCell", for: indexPath) as! CustomTableViewCell
        let dataEntry = data[indexPath.row]
        
        cell.customLabel.text = dataEntry
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        
        currentName = data[indexPath.row]
        
        
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        
        tableView.cellForRow(at: indexPath)?.accessoryType = .none
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showPersonalPayControllerSegue"{
            let cell = sender as! UITableViewCell
            
            if let indexPath = tableView.indexPath(for: cell){
                let personalpayController = segue.destination as! PersonalPayViewController
                
                personalpayController.fullName = data[indexPath.row]
                tableView.deselectRow(at: indexPath, animated: true)
            }
            
        }
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
