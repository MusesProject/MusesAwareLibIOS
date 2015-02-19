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

@interface SSAccelerometerInfo : NSObject {
    CMMotionManager *motionManager;
    
    NSOperationQueue *deviceMotionQueue;
    NSOperationQueue *accelQueue;
    NSOperationQueue *gyroQueue;
}

// Accelerometer Information

// Device Orientation
+ (UIInterfaceOrientation)deviceOrientation;

// Attitude
@property (nonatomic, readonly) NSString *attitudeString;

// Gravity
@property (nonatomic, readonly) NSString *gravityString;

// Magnetic Field
@property (nonatomic, readonly) NSString *magneticFieldString;

// Rotation Rate
@property (nonatomic, readonly) NSString *rotationRateString;

// User Acceleration
@property (nonatomic, readonly) NSString *userAccelerationString;

// Raw Gyroscope
@property (nonatomic, readonly) NSString *rawGyroscopeString;

// Raw Accelerometer
@property (nonatomic, readonly) NSString *rawAccelerometerString;

/**
 * startLoggingMotionData
 *
 * This method uses the boolean instance variables to tell the CMMotionManager what
 * to do. The three main types of IMU capture each have their own NSOperationQueue.
 * A queue will only be utilized if its respective motion type is going to be logged.
 *
 */
- (void)startLoggingMotionData;

/**
 * stopLoggingMotionDataAndSave
 *
 * Tells the CMMotionManager to stop the motion updates and calls the writeDataToDisk
 * method. The only gotchya is that we wait for the NSOperationQueues to finish
 * what they are doing first so that we're not accessing the same resource from
 * different points in the program.
 */
- (void)stopLoggingMotionData;

@end
