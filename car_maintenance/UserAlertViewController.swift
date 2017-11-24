//
//  UserAlertViewController.swift
//  car_maintenance
//
//  Created by Paul Kao on 2017-11-10.
//  Copyright © 2017 Paul Kao. All rights reserved.
//

import UIKit
import UserNotifications
import Eureka

class UserAlertViewController: FormViewController {
    
    let center = UNUserNotificationCenter.current()
    struct alertObject{
        var type = String()
        var mechName = String()
        var mechNumber = String()
        var mechAddress = String()
        var checkupDate = Date()
        var message = String()
    }
    
    var type = ""
    var mechName = ""
    var mechNumber = ""
    var mechAddress = ""
    var checkupDate = Date.init()
    var message = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        loadForm()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func loadForm(){
        form +++ Section("Reminder")
            <<< ActionSheetRow<String>() {
                $0.title = "Type"
                $0.selectorTitle = "Choose a type"
                $0.options = ["Tune-up","Wheel Rotation","Oil change", "Brakes", "Batteries", "General"]
                $0.value = "Not Selected"    // Default Value
                $0.onChange(self.updateType)
            }
            +++ Section("Mechanic")
            <<< TextRow() {
                $0.title = "Name"
                $0.placeholder = "No Input"
                $0.onChange(self.updateMechName)
            }
            <<< PhoneRow(){
                $0.title = "Phone number"
                $0.placeholder = "Add Phone Number"
                $0.onChange(self.updateNumber)
            }
            <<< TextRow() {
                $0.title = "Address"
                $0.placeholder = "Add Address"
                $0.onChange(self.updateAddress)
            }
            +++ Section("Details")
            <<< DateTimeRow(){
                $0.title = "Set Date"
                $0.value = Date.init()
                $0.onChange(self.updateDate)
            }
            <<< TextRow(){
                $0.title = "Message"
                $0.placeholder = "Default"
                $0.onChange(self.updateMessage)
            }
        
            +++ Section("Confirmation")
            <<< ButtonRow(){
                $0.title = "Add Alert"
                $0.onCellSelection(self.alertButtonPressed)
            }
            <<< ButtonRow(){
                $0.title = "Cancel"
                $0.onCellSelection(self.cancelButtonPressed)
            }
        }
    func updateType(cell: ActionSheetRow<String>){
        self.type = cell.value!
    }
    func updateMechName(cell: TextRow){
        if(cell.value == nil){
            self.mechName = ""
        } else {
            self.mechName = cell.value!
        }
    }
    func updateNumber(cell: PhoneRow){
        if(cell.value == nil) {
            self.mechNumber = ""
        } else {
            self.mechNumber = cell.value!
        }
    }
    func updateAddress(cell: TextRow){
        if(cell.value == nil) {
            self.mechAddress = ""
        } else {
            self.mechAddress = cell.value!
        }
    }
    func updateDate(cell: DateTimeRow){
        
        self.checkupDate = cell.value!
    }
    func updateMessage(cell: TextRow){
        if(cell.value == nil){
            self.message = ""
        } else {
            self.message = cell.value!
        }
    }
    
    func displayWarning(message: String){
        let message = message
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        self.present(alert, animated: true)
        
        // duration in seconds
        let duration: Double = 3
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + duration) {
            alert.dismiss(animated: true)
        }
    }
    
    func alertButtonPressed(cell: ButtonCellOf<String>, row: ButtonRow) {
        if(self.checkupDate.timeIntervalSinceNow < 0) {
            displayWarning(message: "Invalid Date. No time traveling to the past allowed")
            return
        } else if(self.message == "" && self.title == ""){
            addNewAlert(title: "Reminder", message: "Time for a checkup!", date: self.checkupDate)
        } else if (self.message == "") {
            addNewAlert(title: self.type + " Reminder", message: "Time for a checkup!", date: self.checkupDate)
        } else if (self.title == "") {
            addNewAlert(title: "Reminder", message: self.message, date: self.checkupDate)
        } else {
            addNewAlert(title: self.type + " Reminder", message: self.message, date: self.checkupDate)
        }
        let alertID = self.type + ":" + String(self.checkupDate.timeIntervalSinceNow)
        self.updateAlertList(id: alertID , key: "alertArray")
        self.saveAlertDetails(id: alertID, key: "detailsDictionary")
        self.dismiss(animated: true, completion: nil);
    }
    
    func cancelButtonPressed(cell: ButtonCellOf<String>, row: ButtonRow) {
        self.dismiss(animated: true, completion: nil);
    }
    
    @objc func saveAlertDetails(id: String, key: String) {
        let userDefaults = UserDefaults.standard
        let tempAlert = alertObject(type: self.type, mechName: self.mechName, mechNumber: self.mechNumber, mechAddress: self.mechAddress, checkupDate: self.checkupDate, message: self.message)
      
        if(userDefaults.object(forKey: key) != nil){
            let alertDictionary : NSMutableDictionary = userDefaults.object(forKey: key) as! NSMutableDictionary
            alertDictionary.setValue(tempAlert, forKey: id)
            userDefaults.set(alertDictionary, forKey: key)
            print("notnil")
        } else {
            print("nil")
            let alertDictionary = [id : tempAlert]
            userDefaults.set(alertDictionary, forKey: key)
        }
        
        
        
    }
    
    @objc func addNewAlert(title: String, message: String, date: Date)  {
        
        let content = UNMutableNotificationContent()
        content.title = title
        content.body = message
        content.categoryIdentifier = "alarm"
        content.userInfo = ["customData": "fizzbuzz"]
        content.sound = UNNotificationSound.default()
        
        print(date.timeIntervalSinceNow)
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: date.timeIntervalSinceNow, repeats: false)
        
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
    
    @objc func updateAlertList(id: String, key: String){
        let userDefaults = UserDefaults.standard
        
        if(userDefaults.object(forKey: key) != nil){
            let alertList : NSMutableArray = userDefaults.object(forKey: key) as! NSMutableArray
            alertList.adding(id)
            userDefaults.set(alertList, forKey: key)
            print("notnil")
        } else {
            print("nil")
            let alertList = [id] as NSArray
            userDefaults.set(alertList, forKey: key)
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
