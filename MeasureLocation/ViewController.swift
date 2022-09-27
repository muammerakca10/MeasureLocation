//
//  ViewController.swift
//  MeasureLocation
//
//  Created by MAC on 26.09.2022.
//
import CoreLocation
import UIKit

class ViewController: UIViewController,CLLocationManagerDelegate {

    @IBOutlet var distanceReading: UILabel!
    var locationManager : CLLocationManager?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager = CLLocationManager()
        locationManager?.delegate = self
        locationManager?.requestAlwaysAuthorization()
        
        view.backgroundColor = .gray
    }
    
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        let status = CLAuthorizationStatus(rawValue: Int32())
        if status == CLAuthorizationStatus.authorizedAlways {
            if CLLocationManager.isMonitoringAvailable(for: CLBeaconRegion.self){
                if CLLocationManager.isRangingAvailable(){
                    //do stuff
                }
            }
        }
    }
    
    /*
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedAlways {
            if CLLocationManager.isMonitoringAvailable(for: CLBeaconRegion.self){
                if CLLocationManager.isRangingAvailable(){
                    
                }
            }
        }
    }
     */


}

