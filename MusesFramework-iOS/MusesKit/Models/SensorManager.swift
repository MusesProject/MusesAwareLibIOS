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

@objc public protocol SensorManagerDelegate {
    func sensorManager(manager: SensorManager, didUpdateSensorResponses responses: [String: ContextEvent])
}

public class SensorManager: NSObject {
    // MARK: Properties
    
    public class var sharedInstance: SensorManager {
        struct Singleton {
            static let instance = SensorManager()
        }
        
        return Singleton.instance
    }
    
    private var sensors = [String: Sensor]()
    private (set) var isMonitoring = false
    public var lastSensorResponses = [String: ContextEvent]()
    public var delegate: SensorManagerDelegate?
    
    // MARK: Public API
    
    public func addSensor(sensor: Sensor) {
        sensor.delegate = self
        sensors[sensor.type] = sensor
    }
    
    public func addSensors(sensors: [Sensor]) {
        for sensor in sensors {
            addSensor(sensor)
        }
    }
    
    // MARK: Methods
    
    public func fetchSensorResponses() {
        for (_, sensor) in sensors {
            sensor.updateDetection()
        }
    }
}

// MARK: - SensorDelegate

extension SensorManager: SensorDelegate {
    func sensor(sensor: Sensor, didDetectNewContextEvent contextEvent: ContextEvent) {
        lastSensorResponses[sensor.type] = contextEvent
        delegate?.sensorManager(self, didUpdateSensorResponses: lastSensorResponses)
    }
}