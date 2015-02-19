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

public class AppSensor: Sensor {
    // MARK: Types
    
    private struct Constants {
        static let type = "CONTEXT_SENSOR_APP"
        
        struct PropertyKeys {
            static let installedApps = "installedapps";
        }
    }
    
    // MARK: Properties
    
    override public var type: String {
        return Constants.type
    }
    
    private var installedApps: String {
    AppDetection().detectAppDictionariesWithIncremental({ detectedApps in
            println(detectedApps.count)
        }, withSuccess: { detectedApps in
            println(detectedApps.count)
        }) { error in
            println(error.localizedDescription)
        }
        
        return ""
    }
    
    // MARK: Public API
    
    override public func updateDetection() {
        createNewContextEvent()
    }
    
//    iHasApp *detectionObject = [[iHasApp alloc] init];
//    [detectionObject detectAppDictionariesWithIncremental:^(NSArray *appDictionaries) {
//    NSLog(@"Incremental appDictionaries.count: %i", appDictionaries.count);
//    } withSuccess:^(NSArray *appDictionaries) {
//    NSLog(@"Successful appDictionaries.count: %i", appDictionaries.count);
//    } withFailure:^(NSError *error) {
//    NSLog(@"Failure: %@", error.localizedDescription);
//    }];
    
    // MARK: Methods
    
    private func createNewContextEvent() {
        var properties = [String: String]()
        
        let event = ContextEvent(type: type, properties: properties)
        contextEventHistory.append(event)
    }
}