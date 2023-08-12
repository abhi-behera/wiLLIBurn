//
//  ViewController.swift
//  Will I burn app
//
//  Created by Sritam on 11/06/23.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {

    var locationManager = CLLocationManager()
    
    @IBOutlet weak var skintypLable: UILabel!
    
    @IBOutlet weak var time: UILabel!
    
    var skintyp = " "
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization() //  this will call the below func.s
    }

    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        print (" Auth changed ")
        if manager.authorizationStatus == .authorizedWhenInUse{
            getLoc()
        }
        else{
            print("location denied")
            let alert = UIAlertController(title: "Hello !", message: "Pls enable location", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default,handler: nil))
            self.present(alert, animated: false,completion:  getLoc)
        }
    }

    func getLoc ()
    {
        
    }
    
    @IBAction func skintypChange(_ sender: Any) {
        
        let alert1 = UIAlertController(title: "Pick one!", message: "Pls choose your skin type", preferredStyle: .actionSheet)
        for s in SkinType().allSkinType(){
            alert1.addAction(UIAlertAction(title: s, style: .default, handler: {( action) in
                self.skintyp = s
                self.skintypeLableUpdfate()
            }))
        }
        self.present(alert1, animated: true)
        
    }
    
    @IBAction func setRemdBtn(_ sender: Any) {
        
        
    }
    
    func skintypeLableUpdfate(){
        skintypLable.text = skintyp
    }
    
    
    
}

