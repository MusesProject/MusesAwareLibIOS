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

@interface SSDiskInfo : NSObject

// Disk Information

// Total Disk Space
+ (NSString *)diskSpace;

// Total Free Disk Space
+ (NSString *)freeDiskSpace:(BOOL)inPercent;

// Total Used Disk Space
+ (NSString *)usedDiskSpace:(BOOL)inPercent;

// Get the total disk space in long format
+ (long long)longDiskSpace;

// Get the total free disk space in long format
+ (long long)longFreeDiskSpace;

@end
