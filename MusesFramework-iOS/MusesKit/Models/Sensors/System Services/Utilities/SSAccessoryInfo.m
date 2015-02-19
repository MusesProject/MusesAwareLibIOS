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

#import "SSAccessoryInfo.h"

@implementation SSAccessoryInfo

// Accessory Information

// Are any accessories attached?
+ (BOOL)accessoriesAttached {
    // Check if any accessories are connected
    @try {
        // Set up the accessory manger
        EAAccessoryManager *AccessoryManager = [EAAccessoryManager sharedAccessoryManager];
        // Get the number of accessories connected
        int NumberOfAccessoriesConnected = (int)[AccessoryManager.connectedAccessories count];
        // Check if there are any connected
        if (NumberOfAccessoriesConnected > 0) {
            // There are accessories connected
            return true;
        } else {
            // There are no accessories connected
            return false;
        }
    }
    @catch (NSException *exception) {
        // Error, return false
        return false;
    }
}

// Are headphone attached?
+ (BOOL)headphonesAttached {
    // Check if the headphones are connected
    @try {
        // Set up the variables
        CFStringRef outValue = nil;
        UInt32 propertySize = sizeof(outValue);
        AudioSessionGetProperty(kAudioSessionProperty_AudioRouteDescription, &propertySize, &outValue);
        NSString *routeStr;
        // Get the route
        if (outValue) {
            routeStr = [NSString stringWithUTF8String:(char *)outValue];
        }
        // Get the range
        NSRange headsetRange = [routeStr rangeOfString : @"Headset"];
        
        // Check if the headphones are plugged in
        if(headsetRange.location != NSNotFound) {
            // Headphones are found
            return true;
        } else {
            // Headphones are not found
            return false;
        }
    }
    @catch (NSException *exception) {
        // Error, return false
        return false;
    }
}

// Number of attached accessories
+ (NSInteger)numberAttachedAccessories {
    // Get the number of attached accessories
    @try {
        // Set up the accessory manger
        EAAccessoryManager *AccessoryManager = [EAAccessoryManager sharedAccessoryManager];
        // Get the number of accessories connected
        int NumberOfAccessoriesConnected = (int)[AccessoryManager.connectedAccessories count];
        // Return how many accessories are attached
        return NumberOfAccessoriesConnected;
    }
    @catch (NSException *exception) {
        // Error, return false
        return false;
    }
}

// Name of attached accessory/accessories (seperated by , comma's)
+ (NSString *)nameAttachedAccessories {
    // Get the name of the attached accessories
    @try {
        // Set up the accessory manger
        EAAccessoryManager *AccessoryManager = [EAAccessoryManager sharedAccessoryManager];
        // Set up an accessory (for later use)
        EAAccessory *Accessory;
        // Get the number of accessories connected
        int NumberOfAccessoriesConnected = (int)[AccessoryManager.connectedAccessories count];
        
        // Check to make sure there are accessories connected
        if (NumberOfAccessoriesConnected > 0) {
            // Set up a string for all the accessory names
            NSString *AllAccessoryNames = @"";
            // Set up a string for the accessory names
            NSString *AccessoryName;
            // Get the accessories
            NSArray *AccessoryArray = AccessoryManager.connectedAccessories;
            // Run through all the accessories
            for (int x = 0; x < NumberOfAccessoriesConnected; x++) {
                // Get the accessory at that index
                Accessory = [AccessoryArray objectAtIndex:x];
                // Get the name of it
                AccessoryName = [Accessory name];
                // Make sure there is a name
                if (AccessoryName == nil || AccessoryName.length == 0) {
                    // If there isn't, try and get the manufacturer name
                    AccessoryName = [Accessory manufacturer];
                }
                // Make sure there is a manufacturer name
                if (AccessoryName == nil || AccessoryName.length == 0) {
                    // If there isn't a manufacturer name still
                    AccessoryName = @"Unknown";
                }
                // Format that name
                AllAccessoryNames = [AllAccessoryNames stringByAppendingFormat:@"%@", AccessoryName];
                if (x < NumberOfAccessoriesConnected - 1) {
                    AllAccessoryNames = [AllAccessoryNames stringByAppendingFormat:@", "];
                }
            }
            // Return the name/s of the connected accessories
            return AllAccessoryNames;
        } else {
            // No accessories connected
            return nil;
        }
    }
    @catch (NSException *exception) {
        // Error, return false
        return nil;
    }
}

@end
