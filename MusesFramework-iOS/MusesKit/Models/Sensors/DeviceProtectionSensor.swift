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

import UIKit

public class DeviceProtectionSensor: Sensor {
    // MARK: Types
    
    private struct Constants {
        static let type = "CONTEXT_SENSOR_DEVICE_PROTECTION"
        
        struct PropertyKeys {
            static let isRooted = "isrooted";
            static let passwordProtected = "ispasswordprotected";
            static let trustedAntivirusInstalled = "istrustedantivirusinstalled";
            static let muesesDatabaseExists = "musesdatabaseexists";
            static let accessibilityEnabled = "accessibilityenabled";
        }
    }
    
    // MARK: Properties
    
    override public var type: String {
        return Constants.type
    }
    
    private var isRooted: String {
        return NSFileManager.defaultManager().fileExistsAtPath("/Applications/Cydia.app") ? "true" : "false"
    }
    
    private var passwordProtected: String {
        switch UIDevice.currentDevice().passcodeStatus {
        case .Unknown, .Disabled:
            return "false"
        case .Enabled:
            return "true"
        }
    }
    
    private var accessibilityEnabled: String {
        var enabled = false
        
        if UIAccessibilityIsVoiceOverRunning() || UIAccessibilityIsClosedCaptioningEnabled() ||
        UIAccessibilityIsGuidedAccessEnabled() || UIAccessibilityIsInvertColorsEnabled() ||
        UIAccessibilityIsMonoAudioEnabled() {
            enabled = true
        }
        
        return enabled ? "true" : "false"
    }
    
    // MARK: Public API
    
    override public func updateDetection() {
        createNewContextEvent()
    }
    
    // MARK: Methods
    
    private func createNewContextEvent() {
        var properties = [String: String]()
        
        properties[Constants.PropertyKeys.isRooted] = isRooted
        properties[Constants.PropertyKeys.passwordProtected] = passwordProtected
        properties[Constants.PropertyKeys.accessibilityEnabled] = accessibilityEnabled

        let event = ContextEvent(type: type, properties: properties)
        contextEventHistory.append(event)
    }
}