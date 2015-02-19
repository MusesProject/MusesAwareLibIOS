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

#import "SSCarrierInfo.h"

@implementation SSCarrierInfo

// Carrier Information

// Carrier Name
+ (NSString *)carrierName {
    // Get the carrier name
    @try {
        // Get the Telephony Network Info
        CTTelephonyNetworkInfo *TelephonyInfo = [[CTTelephonyNetworkInfo alloc] init];
        // Get the carrier
        CTCarrier *Carrier = [TelephonyInfo subscriberCellularProvider];
        // Get the carrier name
        NSString *CarrierName = [Carrier carrierName];
        
        // Check to make sure it's valid
        if (CarrierName == nil || CarrierName.length <= 0) {
            // Return unknown
            return nil;
        }
        
        // Return the name
        return CarrierName;
    }
    @catch (NSException *exception) {
        // Error finding the name
        return nil;
    }
}

// Carrier Country
+ (NSString *)carrierCountry {
    // Get the country that the carrier is located in
    @try {
        // Get the locale
        NSLocale *CurrentCountry = [NSLocale currentLocale];
        // Get the country Code
        NSString *Country = [CurrentCountry objectForKey:NSLocaleCountryCode];
        // Check if it returned anything
        if (Country == nil || Country.length <= 0) {
            // No country found
            return nil;
        }
        // Return the country
        return Country;
    }
    @catch (NSException *exception) {
        // Failed, return nil
        return nil;
    }
}

// Carrier Mobile Country Code
+ (NSString *)carrierMobileCountryCode {
    // Get the carrier mobile country code
    @try {
        // Get the Telephony Network Info
        CTTelephonyNetworkInfo *TelephonyInfo = [[CTTelephonyNetworkInfo alloc] init];
        // Get the carrier
        CTCarrier *Carrier = [TelephonyInfo subscriberCellularProvider];
        // Get the carrier mobile country code
        NSString *CarrierCode = [Carrier mobileCountryCode];
        
        // Check to make sure it's valid
        if (CarrierCode == nil || CarrierCode.length <= 0) {
            // Return unknown
            return nil;
        }
        
        // Return the name
        return CarrierCode;
    }
    @catch (NSException *exception) {
        // Error finding the name
        return nil;
    }
}

// Carrier ISO Country Code
+ (NSString *)carrierISOCountryCode {
    // Get the carrier ISO country code
    @try {
        // Get the Telephony Network Info
        CTTelephonyNetworkInfo *TelephonyInfo = [[CTTelephonyNetworkInfo alloc] init];
        // Get the carrier
        CTCarrier *Carrier = [TelephonyInfo subscriberCellularProvider];
        // Get the carrier ISO country code
        NSString *CarrierCode = [Carrier isoCountryCode];
        
        // Check to make sure it's valid
        if (CarrierCode == nil || CarrierCode.length <= 0) {
            // Return unknown
            return nil;
        }
        
        // Return the name
        return CarrierCode;
    }
    @catch (NSException *exception) {
        // Error finding the name
        return nil;
    }
}

// Carrier Mobile Network Code
+ (NSString *)carrierMobileNetworkCode {
    // Get the carrier mobile network code
    @try {
        // Get the Telephony Network Info
        CTTelephonyNetworkInfo *TelephonyInfo = [[CTTelephonyNetworkInfo alloc] init];
        // Get the carrier
        CTCarrier *Carrier = [TelephonyInfo subscriberCellularProvider];
        // Get the carrier mobile network code
        NSString *CarrierCode = [Carrier mobileNetworkCode];
        
        // Check to make sure it's valid
        if (CarrierCode == nil || CarrierCode.length <= 0) {
            // Return unknown
            return nil;
        }
        
        // Return the name
        return CarrierCode;
    }
    @catch (NSException *exception) {
        // Error finding the name
        return nil;
    }
}

// Carrier Allows VOIP
+ (BOOL)carrierAllowsVOIP {
    // Check if the carrier allows VOIP
    @try {
        // Get the Telephony Network Info
        CTTelephonyNetworkInfo *TelephonyInfo = [[CTTelephonyNetworkInfo alloc] init];
        // Get the carrier
        CTCarrier *Carrier = [TelephonyInfo subscriberCellularProvider];
        // Get the carrier VOIP Status
        BOOL CarrierVOIP = [Carrier allowsVOIP];
        
        // Return the VOIP Status
        return CarrierVOIP;
    }
    @catch (NSException *exception) {
        // Error finding the VOIP Status
        return false;
    }
}

@end
