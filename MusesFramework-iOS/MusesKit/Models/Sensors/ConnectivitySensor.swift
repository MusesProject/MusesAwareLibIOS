/*
* #%L
* musesclient
* %%
* Copyright (C) 2013 - 2014 HITEC
* %%
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*      http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
* #L%
*/

public class ConnectivitySensor: Sensor {
    // MARK: Types
    
    private struct Constants {
        static let type = "CONTEXT_SENSOR_CONNECTIVITY"
        
        struct PropertyKeys {
            static let mobileConnected = "mobileconnected"
            static let wifiConnected = "wificonnected"
            static let wifiNeighbors = "wifineighbors"
            static let BSSID = "bssid"
            static let networkID = "networkid"
            static let IPAddress = "ipaddress"
            static let carrierName = "carriername"
            static let carrierCountry = "carriercountry"
            static let bluetoothConnected = "bluetoothconnected"
            static let wifiEncryption = "wifiencryption"
        }
    }
    
    // MARK: Properties
    
    override public var type: String {
        return Constants.type
    }
    
    private var mobileConnected: String {
        return SystemServices.sharedServices().connectedToCellNetwork! ? "true" : "false"
    }
    
    private var wifiConnected: String {
        println(SystemServices.sharedServices().wiFiBSSID)
        return SystemServices.sharedServices().connectedToWiFi! ? "true" : "false"
    }
    
    private var BSSID: String {
        return SystemServices.sharedServices().wiFiBSSID
    }
    
    private var networkID: String {
        return SystemServices.sharedServices().wiFiBroadcastAddress
    }
    
    private var IPAddress: String {
        return SystemServices.sharedServices().currentIPAddress
    }
    
    private var carrierName: String? {
        if SystemServices.sharedServices().carrierName != nil  {
            return SystemServices.sharedServices().carrierName
        }
        else {
            return "no carrier"
        }
    }
    
    private var carrierCountry: String {
        return SystemServices.sharedServices().carrierCountry
    }
    
    // MARK: Public API
    
    override public func updateDetection() {
        createNewContextEvent()
    }
    
    // MARK: Methods
    
    private func createNewContextEvent() {
        var properties = [String: String]()
        
        properties[Constants.PropertyKeys.mobileConnected] = mobileConnected 
        properties[Constants.PropertyKeys.wifiConnected] = wifiConnected
        properties[Constants.PropertyKeys.BSSID] = BSSID
        properties[Constants.PropertyKeys.networkID] = networkID
        properties[Constants.PropertyKeys.IPAddress] = IPAddress
        properties[Constants.PropertyKeys.carrierName] = carrierName
        properties[Constants.PropertyKeys.carrierCountry] = carrierCountry
        
        let event = ContextEvent(type: type, properties: properties)
        contextEventHistory.append(event)
    }
}