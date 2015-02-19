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

#import "SSApplicationInfo.h"

@implementation SSApplicationInfo

// Application Information

// Application Version
+ (NSString *)applicationVersion {
    // Get the Application Version Number
    @try {
        // Query the plist for the version
        NSString *Version = [[NSBundle mainBundle] objectForInfoDictionaryKey:(NSString *)kCFBundleVersionKey];
        // Validate the Version
        if (Version == nil || Version.length <= 0) {
            // Invalid Version number
            return nil;
        }
        // Successful
        return Version;
    }
    @catch (NSException *exception) {
        // Error
        return nil;
    }
}

// Clipboard Content
+ (NSString *)clipboardContent {
    // Get the string content of the clipboard (copy, paste)
    @try {
        // Get the Pasteboard
        UIPasteboard *PasteBoard = [UIPasteboard generalPasteboard];
        // Get the string value of the pasteboard
        NSString *ClipboardContent = [PasteBoard string];
        // Check for validity
        if (ClipboardContent == nil || ClipboardContent.length <= 0) {
            // Error, invalid pasteboard
            return nil;
        }
        // Successful
        return ClipboardContent;
    }
    @catch (NSException *exception) {
        // Error
        return nil;
    }
}

@end
