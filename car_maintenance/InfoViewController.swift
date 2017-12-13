//
//  InfoViewController.swift
//  car_maintenance
//
//  Created by Paul Kao on 2017-12-08.
//  Copyright © 2017 Paul Kao. All rights reserved.
//

import UIKit
import Eureka

struct carInfo{
    var ownerFirstName = ""
    var ownerLastName = ""
    var ownerNumber = ""
    var address = ""
    
    var name = ""
    var make = ""
    var model = ""
    var year = ""
    var licensePlate = ""
    
    var transmission = ""
    var engine = ""
    var oilType = ""
    var coolantType = ""
    var gasType = ""
    var wheels = ""
    var brakes = ""
}

class InfoViewController: FormViewController {
    
    var carinfo = carInfo()
    @IBOutlet var infoNavItem: UINavigationItem!
    
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.validateDefaults()
        loadForm()
        
        infoNavItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(backAction))
        
        
        

        // Do any additional setup after loading the view.
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func backAction(){
        
        self.dismiss(animated: true, completion: nil);
    }
    
    func saveButtonPressed(cell: ButtonCellOf<String>, row: ButtonRow) {
        self.defaults.set(carinfo.ownerFirstName, forKey: "ownerFirstName")
        self.defaults.set(carinfo.ownerLastName, forKey: "ownerLastName")
        self.defaults.set(carinfo.ownerNumber, forKey: "ownerNumber")
        self.defaults.set(carinfo.address, forKey: "address")
        self.defaults.set(carinfo.name, forKey: "name")
        self.defaults.set(carinfo.make, forKey: "make")
        self.defaults.set(carinfo.model, forKey: "model")
        self.defaults.set(carinfo.year, forKey: "year")
        self.defaults.set(carinfo.licensePlate, forKey: "licensePlate")
        self.defaults.set(carinfo.transmission, forKey: "transmission")
        self.defaults.set(carinfo.engine, forKey: "engine")
        self.defaults.set(carinfo.oilType, forKey: "oilType")
        self.defaults.set(carinfo.coolantType, forKey: "coolantType")
        self.defaults.set(carinfo.gasType, forKey: "gasType")
        self.defaults.set(carinfo.wheels, forKey: "wheels")
        self.defaults.set(carinfo.brakes, forKey: "brakes")
        
        tabBarController?.selectedIndex = 0
        
    }
    
    func cancelButtonPressed(cell: ButtonCellOf<String>, row: ButtonRow) {
        tabBarController?.selectedIndex = 0
    }
    
    func validateDefaults(){
        if let oFN = defaults.string(forKey: "ownerFirstName"){
            carinfo.ownerFirstName = oFN
        }
        if let oLN = defaults.string(forKey: "ownerLastName"){
            carinfo.ownerLastName = oLN
        }
        if let oN = defaults.string(forKey: "ownerNumber"){
            carinfo.ownerNumber = oN
        }
        if let add = defaults.string(forKey: "address") {
            carinfo.address = add
        }
        if let name  = defaults.string(forKey: "name"){
            carinfo.name = name
        }
        if let make = defaults.string(forKey: "make"){
            carinfo.make = make
        }
        if let model = defaults.string(forKey: "model"){
            carinfo.model = model
        }
        if let year = defaults.string(forKey: "year"){
            carinfo.year = year
        }
        if let licensePlate = defaults.string(forKey: "licensePlate"){
            carinfo.licensePlate = licensePlate
        }
        if let transmission = defaults.string(forKey: "transmission"){
            carinfo.transmission = transmission
        }
        if let engine = defaults.string(forKey: "engine"){
            carinfo.engine = engine
        }
        if let oil = defaults.string(forKey: "oilType") {
            carinfo.oilType = oil
        }
        if let coolant = defaults.string(forKey: "coolantType"){
            carinfo.coolantType = coolant
        }
        if let gas = defaults.string(forKey: "gasType"){
            carinfo.gasType = gas
        }
        if let wheels = defaults.string(forKey: "wheels") {
            carinfo.wheels = wheels
        }
        if let brakes = defaults.string(forKey: "brakes"){
            carinfo.brakes = brakes
        }
    }
    
    func loadForm(){
        
        form +++ Section("Basic User Information")
            <<< TextRow(){ row in
                row.title = "First Name"
                if(carinfo.ownerFirstName == ""){
                    row.placeholder = "enter first name"
                } else {
                    row.value = carinfo.ownerFirstName
                }
                
                row.onChange(self.updateOwnerfname)
        }
            <<< TextRow(){ row in
                row.title = "Last Name"
                if(carinfo.ownerLastName == ""){
                    row.placeholder = "enter last name"
                } else {
                    row.value = carinfo.ownerLastName
                }
                row.onChange(self.updateOwnerlname)
        }
            <<< PhoneRow(){ row in
                row.title = "Phone number"
                if(carinfo.ownerNumber == ""){
                    row.placeholder = "enter phone number"
                } else {
                    row.value = carinfo.ownerNumber
                }
                row.onChange(self.updatePhoneNumber)
            }
            <<< TextRow(){ row in
                row.title = "Address"
                if(carinfo.address == ""){
                    row.placeholder = "enter address"
                } else {
                    row.value = carinfo.address
                }
                row.onChange(self.updateAddress)
        }
        
        form +++ Section("Basic Car information")
            <<< TextRow(){ row in
                row.title = "Car name"
                if(carinfo.name == ""){
                    row.placeholder = "enter car name"
                } else {
                    row.value = carinfo.name
                }
                row.onChange(self.updateCarName)
        }
            <<< TextRow(){ row in
                row.title = "Make"
                if(carinfo.make == ""){
                    row.placeholder = "enter make"
                } else {
                    row.value = carinfo.make
                }
                row.onChange(self.updateMake)
        }
            <<< TextRow(){ row in
                row.title = "Model"
                if(carinfo.model == ""){
                    row.placeholder = "enter model"
                } else {
                    row.value = carinfo.model
                }
                row.onChange(self.updateModel)
        }
            <<< PhoneRow(){ row in
                row.title = "Year"
                if(carinfo.year == ""){
                    row.placeholder = "enter year"
                } else {
                    row.value = carinfo.year
                }
                row.onChange(self.updateYear)
        }
            <<< TextRow(){ row in
                row.title = "License Plate"
                if(carinfo.licensePlate == ""){
                    row.placeholder = "enter license plate"
                } else {
                    row.value = carinfo.licensePlate
                }
                row.onChange(self.updateLicense)
        }
        
        form +++ Section("Car Details")
            <<< TextRow(){ row in
                row.title = "Transmission"
                if(carinfo.transmission == ""){
                    row.placeholder = "default"
                } else {
                    row.value = carinfo.transmission
                }
                row.onChange(self.updateTransmission)
        }
            <<< TextRow(){ row in
                row.title = "engine"
                if(carinfo.engine == ""){
                    row.placeholder = "default"
                } else {
                    row.value = carinfo.engine
                }
                row.onChange(self.updateEngine)
        }
            <<< TextRow(){ row in
                row.title = "Oil"
                if(carinfo.oilType == ""){
                    row.placeholder = "default"
                } else {
                    row.value = carinfo.oilType
                }
                row.onChange(self.updateOil)
        }
            <<< TextRow(){ row in
                row.title = "Coolant"
                if(carinfo.coolantType == ""){
                    row.placeholder = "default"
                } else {
                    row.value = carinfo.coolantType
                }
                row.onChange(self.updateCoolant)
        }
            <<< TextRow(){ row in
                row.title = "Gas"
                if(carinfo.gasType == ""){
                    row.placeholder = "default"
                } else {
                    row.value = carinfo.gasType
                }
                row.onChange(self.updateGas)
        }
            <<< TextRow(){ row in
                row.title = "Wheels"
                if(carinfo.wheels == ""){
                    row.placeholder = "default"
                } else {
                    row.value = carinfo.wheels
                }
                row.onChange(self.updateWheel)
        }
            <<< TextRow(){ row in
                row.title = "Brakes"
                if(carinfo.brakes == ""){
                    row.placeholder = "default"
                } else {
                    row.value = carinfo.brakes
                }
                row.onChange(self.updateBrake)
        }
        
        +++ Section("Confirmation")
            <<< ButtonRow(){
                $0.title = "Save"
                $0.onCellSelection(self.saveButtonPressed)
            }
            <<< ButtonRow(){
                $0.title = "Cancel"
                $0.onCellSelection(self.cancelButtonPressed)
            }
    }
    
    func updateOwnerfname(cell: TextRow){
        if(cell.value == nil){
            carinfo.ownerFirstName = ""
        } else {
            carinfo.ownerFirstName = cell.value!
        }
    }
    func updateOwnerlname(cell: TextRow){
        if(cell.value == nil){
            carinfo.ownerLastName = ""
        } else {
            carinfo.ownerLastName = cell.value!
        }
    }
    
    func updatePhoneNumber(cell: PhoneRow){
        if(cell.value == nil){
            carinfo.ownerNumber = ""
        } else {
            carinfo.ownerNumber = cell.value!
        }
    }
    
    func updateAddress(cell: TextRow){
        if(cell.value == nil){
            carinfo.address = ""
        } else {
            carinfo.address = cell.value!
        }
    }
    
    func updateCarName(cell: TextRow){
        if(cell.value == nil){
            carinfo.name = ""
        } else {
            carinfo.name = cell.value!
        }
    }
    
    func updateMake(cell: TextRow){
        if(cell.value == nil){
            carinfo.make = ""
        } else {
            carinfo.make = cell.value!
        }
    }
    
    func updateModel(cell: TextRow){
        if(cell.value == nil){
            carinfo.model = ""
        } else {
            carinfo.model = cell.value!
        }
    }
    
    func updateYear(cell: PhoneRow){
        if(cell.value == nil){
            carinfo.year = ""
        } else {
            carinfo.year = cell.value!
        }
    }
    
    func updateLicense(cell: TextRow){
        if(cell.value == nil){
            carinfo.licensePlate = ""
        } else {
            carinfo.licensePlate = cell.value!
        }
    }
    
    func updateTransmission(cell: TextRow){
        if(cell.value == nil){
            carinfo.transmission = ""
        } else {
            carinfo.transmission = cell.value!
        }
    }
    
    func updateEngine(cell: TextRow){
        if(cell.value == nil){
            carinfo.engine = ""
        } else {
            carinfo.engine = cell.value!
        }
    }
    
    func updateOil(cell: TextRow){
        if(cell.value == nil){
            carinfo.oilType = ""
        } else {
            carinfo.oilType = cell.value!
        }
    }
    
    func updateCoolant(cell: TextRow){
        if(cell.value == nil){
            carinfo.coolantType = ""
        } else {
            carinfo.coolantType = cell.value!
        }
    }
    
    func updateGas(cell: TextRow){
        if(cell.value == nil){
            carinfo.gasType = ""
        } else {
            carinfo.gasType = cell.value!
        }
    }
    
    func updateWheel(cell: TextRow){
        if(cell.value == nil){
            carinfo.wheels = ""
        } else {
            carinfo.wheels = cell.value!
        }
    }
    
    func updateBrake(cell: TextRow){
        if(cell.value == nil){
            carinfo.brakes = ""
        } else {
            carinfo.brakes = cell.value!
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
