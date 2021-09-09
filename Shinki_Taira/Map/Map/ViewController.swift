//
//  ViewController.swift
//  Map
//
//  Created by fuller on 2021/09/08.
//

import UIKit
import MapKit

class ViewController: UIViewController, UITextFieldDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        inputText.delegate = self
    }

    @IBOutlet weak var inputText: UITextField!
    
    @IBOutlet weak var dispMap: MKMapView!
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        if let searchKey = textField.text{
            print(searchKey)
            
            let geocoder = CLGeocoder()
            
            geocoder.geocodeAddressString(searchKey , completionHandler: {(placemarks,error) in
                
                guard let unwrapPlacemark = placemarks else {return}
                    
                guard let firstPlacemark = unwrapPlacemark.first else {return}
                        
                guard let location = firstPlacemark.location else {return}
                            
                let targetCoordinate = location.coordinate
                            
                print(targetCoordinate)
                            
                let pin = MKPointAnnotation()
                            
                pin.coordinate = targetCoordinate
                            
                pin.title = searchKey
                            
                self.dispMap.addAnnotation(pin)
                            
                self.dispMap.region = MKCoordinateRegion(center: targetCoordinate, latitudinalMeters: 500.0, longitudinalMeters: 500.0)
                            
                        
                        
                    
                
            })
        }
        
        return true
    }
    
    
    @IBAction func changeMapButton(_ sender: Any) {
    }
}

