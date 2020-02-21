//
//  ViewController.swift
//  NMUIDeviceAPP
//
//  Created by Navid on 2/21/20.
//  Copyright © 2020 UnitedStar. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var deviceInfoList:[DeviceInfo] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadAllDeviceInfo()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return deviceInfoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let deviceInfo = deviceInfoList[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "deviceCell", for: indexPath) as! DeviceCell
        cell.deviceDescLabel.text = deviceInfo.deviceDesc
        cell.deviceValueLabel.text = deviceInfo.deviceValue
        return cell
    }
    
    func loadAllDeviceInfo(){
        //Getting the Shared Device Instance
        let nm = UIDevice()

        //Determining the Available Features
        deviceInfoList.append(DeviceInfo(
            deviceDesc: "A Boolean value indicating whether multitasking is supported on the current device.",
            deviceValue: String(nm.isMultitaskingSupported)))

//        //Identifying the Device and Operating System
//        print(nm.name)
//        print(nm.systemName)
//        print(nm.systemName)
//        print(nm.systemVersion)
//        print(nm.model)
//        print(nm.localizedModel)
//        print(nm.userInterfaceIdiom)
//        print(nm.identifierForVendor!)
//
//        //Tracking the Device Orientation
//        print(nm.orientation)
//        print(nm.isGeneratingDeviceOrientationNotifications)
//        print(nm.beginGeneratingDeviceOrientationNotifications())
//        print(nm.endGeneratingDeviceOrientationNotifications())

        //Getting the Device Battery State
        deviceInfoList.append(DeviceInfo(deviceDesc: "The battery charge level for the device.",
                                         deviceValue: String(nm.batteryLevel)))
        deviceInfoList.append(DeviceInfo(deviceDesc: "A Boolean value indicating whether battery monitoring is enabled (true) or not (false).",
                                         deviceValue: String(nm.isBatteryMonitoringEnabled)))
//        deviceInfoList.append(DeviceInfo(deviceDesc: "The battery state for the device.",
//                                         deviceValue: (nm.batteryState.rawValue)))

//        //Using the Proximity Sensor
//        print(nm.isProximityMonitoringEnabled)
//        print(nm.proximityState)
//
//        //Playing Input Clicks
//        print(nm.playInputClick())
//
//        //Notifications
//        print(nm.proximityState)
//        print(nm.proximityState)
//        print(nm.proximityState)
    }
    

}

