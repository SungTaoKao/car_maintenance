//
//  LandingViewController.swift
//  car_maintenance
//
//  Created by Paul Kao on 2017-11-17.
//  Copyright © 2017 Paul Kao. All rights reserved.
//

import UIKit

class LandingViewController: UIViewController {
    @IBOutlet var neonCar: UIImageView!
    
    //MARK: properties
    @IBOutlet var presGif: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presGif.loadGif(name: "presstar3")
        neonCar.loadGif(name: "neoncar")
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.imageTapped(gesture:)))
        
        // add it to the image view;
        presGif.addGestureRecognizer(tapGesture)
        // make sure imageView can be interacted with by user
        presGif.isUserInteractionEnabled = true

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    @objc func goToRoot(){
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "tabRoot") as! UITabBarController
        self.present(nextViewController, animated:true, completion:nil)
    }
    
    @objc func imageTapped(gesture: UIGestureRecognizer) {
        // if the tapped view is a UIImageView then set it to imageview
        if (gesture.view as? UIImageView) != nil {
            goToRoot()
            //Here you can initiate your new ViewController
            
        }
    }

}
