//
//  CarViewController.swift
//  car_maintenance
//
//  Created by Paul Kao on 2017-11-10.
//  Copyright © 2017 Paul Kao. All rights reserved.
//

import UIKit


class CarViewController: UIViewController {
    
    @IBOutlet var carNavItem: UINavigationItem!
    
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
        
    }
    
    func backAction(){
        _ = UIViewController?.popViewController(animated: true)
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
