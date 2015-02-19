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

import Foundation

public class SettingsSensor: Sensor {
    // MARK: Types
    
    private struct Constants {
        static let type = "CONTEXT_SENSOR_SETTINGS"
        
        struct PropertyKeys {
            static let osVersion = "osversion"
            static let IMEI = "imei"
            static let deviceType = "devicetype"
            static let deviceModel = "devicemodel"
            static let hostName = "hostname"
            static let deviceName = "devicename"
            static let processorCount = "processorcount"
            static let physicalMemory = "physicalmemory"
            static let multitaskingEnabled = "multitaskingenabled"
            static let pluggedIn = "pluggedin"
            static let systemsUptime = "systemsuptime"
        }
    }
    
    // MARK: Properties
    
    override public var type: String {
        return Constants.type
    }
    
    private var iOSVersion: String {
        return NSProcessInfo.processInfo().operatingSystemVersionString
    }
    
    private var IMEI: String {
        return UIDevice.currentDevice().identifierForVendor.UUIDString
    }
    
    private var deviceType: String {
        return SystemServices.sharedServices().deviceModel
    }
    
    private var deviceModel: String {
        return SystemServices.sharedServices().systemDeviceTypeFormatted
    }
    
    private var hostName: String {
        return NSProcessInfo.processInfo().hostName
    }
    
    private var deviceName: String {
        return SystemServices.sharedServices().deviceName
    }
    
    private var processorCount: String {
        return String(NSProcessInfo.processInfo().processorCount)
    }
    
    private var physicalMemory: String {
        return String(NSProcessInfo.processInfo().physicalMemory)
    }
    
    private var multitaskingEnabled: String {
        return SystemServices.sharedServices().multitaskingEnabled! ? "true" : "false"
    }
    
    private var pluggedIn: String {
        return SystemServices.sharedServices().pluggedIn! ? "true" : "false"
    }
    
    private var systemsUptime: String {
        return SystemServices.sharedServices().systemsUptime
    }
    
    // MARK: Public API
    
    override public func updateDetection() {
        createNewContextEvent()
    }
    
    // MARK: Methods
    
    private func createNewContextEvent() {
        var properties = [String: String]()
        
        properties[Constants.PropertyKeys.osVersion] = iOSVersion
        properties[Constants.PropertyKeys.IMEI] = IMEI
        properties[Constants.PropertyKeys.deviceType] = deviceType
        properties[Constants.PropertyKeys.deviceModel] = deviceModel
        properties[Constants.PropertyKeys.hostName] = hostName
        properties[Constants.PropertyKeys.deviceName] = deviceName
        properties[Constants.PropertyKeys.processorCount] = processorCount
        properties[Constants.PropertyKeys.physicalMemory] = physicalMemory
        properties[Constants.PropertyKeys.multitaskingEnabled] = multitaskingEnabled
        properties[Constants.PropertyKeys.pluggedIn] = pluggedIn
        properties[Constants.PropertyKeys.systemsUptime] = systemsUptime
        
        let event = ContextEvent(type: type, properties: properties)
        contextEventHistory.append(event)
    }
}