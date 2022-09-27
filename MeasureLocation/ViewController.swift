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
    
    
    
    //Deprecated version
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
    //Deprecated version
    func startScanning() {
        let uuid = UUID(uuidString: "5A4BCFCE-174E-4BAC-A814-092E77F6B7E5")!
        let beaconRegion = CLBeaconRegion(proximityUUID: uuid, major: 123, minor: 456, identifier: "MyBeacon")

        locationManager?.startMonitoring(for: beaconRegion)
        locationManager?.startRangingBeacons(in: beaconRegion)
    }
    
    //Not deprecated version trying
    /*
    func startScanning() {
        
        let uuid = UUID(uuidString: "5A4BCFCE-174E-4BAC-A814-092E77F6B7E5")!
        //let beaconRegion = CLBeaconRegion(proximityUUID: uuid, major: 123, minor: 456, identifier: "MyBeacon")
        let beaconRegion = CLBeaconRegion(uuid: uuid, major: 123, minor: 456, identifier: "myBeacon")
        let beaconIdentity = CLBeaconIdentityConstraint(uuid: uuid, major: 123, minor: 456)
        locationManager?.startMonitoring(for: beaconRegion)
        //locationManager?.startRangingBeacons(in: beaconRegion)
        locationManager?.startRangingBeacons(satisfying: beaconIdentity)
    }
     */
    

}

