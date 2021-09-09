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
        
        inputText.delegate = self
        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var inputText: UITextField!
    @IBOutlet weak var disMap: MKMapView!
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        if let searchKey = textField.text{
            print(searchKey)
            
            let geocoder = CLGeocoder()
            
            geocoder.geocodeAddressString(searchKey, completionHandler:{(placemarks, error)in
              
                guard let unwrapPlacemarks = placemarks else{ return }
                    
                guard let firstPlacemark = unwrapPlacemarks.first else { return}
                        
                guard let location = firstPlacemark.location else { return }
                            
                let targetCoordinate = location.coordinate
                            
                print(targetCoordinate)
                
                let pin = MKPointAnnotation()
                
                pin.coordinate = targetCoordinate
                
                pin.title = searchKey
                
                self.disMap.addAnnotation( pin )
                
                self.disMap.region = MKCoordinateRegion(center: targetCoordinate, latitudinalMeters: 500.0, longitudinalMeters: 500.0 )
            })
        }
        
        return true
    }
    
    @IBAction func changeMapButton(_ sender: Any) {
        
//        if disMap.mapType == .standard{
//            disMap.mapType == .satellite
//        }else if disMap.mapType == .satellite {
//            disMap.mapType = .hybrid
//        }else if disMap.mapType == .hybrid
    

}

}
