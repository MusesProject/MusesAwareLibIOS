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

/**
*  This class stores context events which are created by the sensors
*/
public class ContextEvent: NSObject {
    // MARK: Properties
    
    public let type: String
    public let timestamp: String
    public let properties: [String: String]
    
    // MARK: Initialization
    
    init(type: String, properties: [String: String], timestamp: NSTimeInterval = NSDate().timeIntervalSince1970) {
        self.type = type
        self.properties = properties
        self.timestamp = "\(timestamp)"
    }
}

// MARK: - Printable

extension ContextEvent: Printable {
    override public var description: String {
        return "ContextEvent [type=\(type), timestamp=\(timestamp), properties=\(properties)]"
    }
}

// MARK: - Hashable

extension ContextEvent: Hashable {
    override public var hashValue: Int {
        // TODO: Update Hash Value
        return timestamp.hashValue
    }
}

// MARK: - Equatable

public func ==(lhs: ContextEvent, rhs: ContextEvent) -> Bool {
    return lhs.hashValue == rhs.hashValue
}