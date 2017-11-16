//
//  UserAlertViewController.swift
//  car_maintenance
//
//  Created by Paul Kao on 2017-11-10.
//  Copyright © 2017 Paul Kao. All rights reserved.
//

import UIKit
import UserNotifications

class UserAlertViewController: UIViewController {
    
    let center = UNUserNotificationCenter.current()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func addNewAlert(title: String, message: String)  {
        
        let content = UNMutableNotificationContent()
        content.title = title
        content.body = message
        content.categoryIdentifier = "alarm"
        content.userInfo = ["customData": "fizzbuzz"]
        content.sound = UNNotificationSound.default()
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 10, repeats: false)
        
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        center.add(request)
        
    }
    
    @objc func deleteAlert(id: String, key: String) -> Bool {
        let userDefaults = UserDefaults.standard
        if(userDefaults.object(forKey: key) != nil){
            let alertList : NSMutableArray = userDefaults.object(forKey: key) as! NSMutableArray
            if(alertList.contains(id)){
                //to do: delete alert
                alertList.remove(id)
                return true
            } else {
                return false
            }
        } else {
            return false
        }
    }
    
    @objc func updateAlertList(id: String, key: String) -> Bool {
        let userDefaults = UserDefaults.standard
        
        if(userDefaults.object(forKey: key) != nil){
            let alertList : NSMutableArray = userDefaults.object(forKey: key) as! NSMutableArray
            alertList.adding(id)
            userDefaults.set(alertList, forKey: key)
            if(userDefaults.synchronize()){
                return true
            } else {
                return false
            }
        } else {
            let alertList = [id] as NSArray
            userDefaults.set(alertList, forKey: key)
            if(userDefaults.synchronize()){
                return true
            } else {
                return false
            }
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
