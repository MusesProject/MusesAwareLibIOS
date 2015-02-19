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

#import "NSObject+PerformBlockAfterDelay.h"

@implementation NSObject (PerformBlockAfterDelay)

// Perform something after a slight delay
- (void)performBlock:(void (^)(void))block afterDelay:(NSTimeInterval)delay {
    // Copy the block
    block = [block copy];
    // Perform the block after a delay
    [self performSelector:@selector(fireBlockAfterDelay:) withObject:block afterDelay:delay];
}

// Do the block!
- (void)fireBlockAfterDelay:(void (^)(void))block {
    block();
}

@end
