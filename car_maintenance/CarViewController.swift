//
//  CarViewController.swift
//  car_maintenance
//
//  Created by Paul Kao on 2017-11-10.
//  Copyright © 2017 Paul Kao. All rights reserved.
//

import UIKit
import UserNotifications


class CarViewController: UIViewController {
    
    @IBOutlet var carNavItem: UINavigationItem!
    
    let center = UNUserNotificationCenter.current()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        carNavItem.rightBarButtonItem = UIBarButtonItem(title: "New", style: .plain, target: self, action: #selector(addNewAlert))
        carNavItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(backAction))
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func addNewAlert(){
        
        
        let content = UNMutableNotificationContent()
        content.title = "I am an alert"
        content.body = "Your wheels need fixing"
        content.categoryIdentifier = "alarm"
        content.userInfo = ["customData": "fizzbuzz"]
        content.sound = UNNotificationSound.default()
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 10, repeats: false)
        
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        center.add(request)
        
        
        print("Alert Success")
    }
    
    func backAction(){
        self.dismiss(animated: true, completion: nil);
        print("backAction")
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
