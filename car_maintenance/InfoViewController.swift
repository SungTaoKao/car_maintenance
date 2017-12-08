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
    var ownerFirstName = "owner_first_name"
    var ownerLastName = "owner_last_name"
    var ownerNumber = "1234567890"
    var address = "address"
    
    var name = "default_name"
    var make = "default_make"
    var model = "default_model"
    var year = "1990"
    var licensePlate = "AAA000"
    
    var transmission = "default_transmission"
    var engine = "default_engine"
    var oilType = "default_oilType"
    var coolantType = "default_coolantType"
    var gasType = "default_gasType"
    var wheels = "default_wheels"
    var brakes = "default_brakes"
}

class InfoViewController: FormViewController {
    
    var carinfo = carInfo()

    override func viewDidLoad() {
        super.viewDidLoad()
        loadFormEmpty()

        // Do any additional setup after loading the view.
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadFormEmpty(){
        form +++ Section("Basic User Information")
            <<< TextRow(){ row in
                row.title = "First Name"
                row.placeholder = "enter first name"
                row.onChange(self.updateOwnerfname)
        }
            <<< TextRow(){ row in
                row.title = "Last Name"
                row.placeholder = "enter last name"
                row.onChange(self.updateOwnerlname)
        }
            <<< PhoneRow(){ row in
                row.title = "Phone number"
                row.placeholder = "enter phone number"
                row.onChange(self.updatePhoneNumber)
            }
            <<< TextRow(){ row in
                row.title = "Address"
                row.placeholder = "enter address"
                row.onChange(self.updateAddress)
        }
        
        form +++ Section("Basic Car information")
            <<< TextRow(){ row in
                row.title = "Car name"
                row.placeholder = "enter car name"
                row.onChange(self.updateCarName)
        }
            <<< TextRow(){ row in
                row.title = "Make"
                row.placeholder = "enter make"
                row.onChange(self.updateMake)
        }
            <<< TextRow(){ row in
                row.title = "Model"
                row.placeholder = "enter model"
                row.onChange(self.updateModel)
        }
            <<< PhoneRow(){ row in
                row.title = "Year"
                row.placeholder = "enter year"
                row.onChange(self.updateYear)
        }
            <<< TextRow(){ row in
                row.title = "License Plate"
                row.placeholder = "enter license plate"
                row.onChange(self.updateLicense)
        }
        
        form +++ Section("Car Details")
            <<< TextRow(){ row in
                row.title = "Transmission"
                row.placeholder = "default"
                row.onChange(self.updateTransmission)
        }
            <<< TextRow(){ row in
                row.title = "engine"
                row.placeholder = "default"
                row.onChange(self.updateEngine)
        }
            <<< TextRow(){ row in
                row.title = "Oil"
                row.placeholder = "default"
                row.onChange(self.updateOil)
        }
            <<< TextRow(){ row in
                row.title = "Coolant"
                row.placeholder = "default"
                row.onChange(self.updateCoolant)
        }
            <<< TextRow(){ row in
                row.title = "Gas"
                row.placeholder = "default"
                row.onChange(self.updateGas)
        }
            <<< TextRow(){ row in
                row.title = "Wheels"
                row.placeholder = "default"
                row.onChange(self.updateWheel)
        }
            <<< TextRow(){ row in
                row.title = "Brakes"
                row.placeholder = "default"
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
    
    func saveButtonPressed(cell: ButtonCellOf<String>, row: ButtonRow) {
        
    }
    
    func cancelButtonPressed(cell: ButtonCellOf<String>, row: ButtonRow) {
        self.dismiss(animated: true, completion: nil);
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
