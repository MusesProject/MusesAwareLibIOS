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

#import "SystemServicesConstants.h"

@interface SSNetworkInfo : NSObject

// Network Information

// Get Current IP Address
+ (NSString *)currentIPAddress;

// Get Current MAC Address
+ (NSString *)currentMACAddress;

// Get the External IP Address
+ (NSString *)externalIPAddress;

// Get Cell IP Address
+ (NSString *)cellIPAddress;

// Get Cell MAC Address
+ (NSString *)cellMACAddress;

// Get Cell Netmask Address
+ (NSString *)cellNetmaskAddress;

// Get Cell Broadcast Address
+ (NSString *)cellBroadcastAddress;

// Get WiFi IP Address
+ (NSString *)wiFiIPAddress;

// Get WiFi MAC Address
+ (NSString *)wiFiMACAddress;

// Get WiFi SSID Address
+ (NSString *)wiFiBSSID;

// Get WiFi Netmask Address
+ (NSString *)wiFiNetmaskAddress;

// Get WiFi Broadcast Address
+ (NSString *)wiFiBroadcastAddress;

// Get WiFi Router Address
+ (NSString *)wiFiRouterAddress;

// Connected to WiFi?
+ (BOOL)connectedToWiFi;

// Connected to Cellular Network?
+ (BOOL)connectedToCellNetwork;

@end
