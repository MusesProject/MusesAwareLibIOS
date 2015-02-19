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

protocol SensorDelegate {
    func sensor(sensor: Sensor, didDetectNewContextEvent contextEvent: ContextEvent)
}

/**
*  Abstract base class for sensors
*/
public class Sensor: NSObject {
    // MARK: Types
    
    private struct Constants {
        static let type = "ABSTRACT_SENSOR"
        static let contextEventHistorySize = 2
    }
    
    // MARK: Properties
    
    public var type: String {
        return Constants.type
    }
    
    var delegate: SensorDelegate?
    
    public var contextEventHistory: [ContextEvent] = [ContextEvent]() {
        didSet {
            if contextEventHistory.count > Constants.contextEventHistorySize {
                contextEventHistory.removeAtIndex(0)
            }
            if contextEventHistory.last != oldValue.last {
                if let contextEvent = contextEventHistory.last {
                    delegate?.sensor(self, didDetectNewContextEvent: contextEvent)
                }
            }
        }
    }
    
    public var latestContextEvent: ContextEvent? {
        return contextEventHistory.last
    }
    
    // MARK: Public API
    
    /**
    Updatest the state of the sensor and creates a new context event
    */
    public func updateDetection() {
        fatalError("This method must be overridden")
    }
}