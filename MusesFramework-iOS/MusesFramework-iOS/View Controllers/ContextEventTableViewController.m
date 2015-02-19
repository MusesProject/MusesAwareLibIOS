//
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

#import "ContextEventTableViewController.h"

@interface ContextEventTableViewController ()

@end

@implementation ContextEventTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 2;
    }
    else {
        return self.contextEvent.properties.count;
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return @"Identification";
    }
    else {
        return @"Properties";
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"contextEventProperty" forIndexPath:indexPath];
    NSString *text;
    NSString *detailText;
    
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            text = @"Type";
            detailText = self.contextEvent.type;
        }
        else {
            text = @"Timestamp";
            
            NSDateComponentsFormatter *dateComponentsFormatter = [[NSDateComponentsFormatter alloc] init];
            detailText= [dateComponentsFormatter stringFromTimeInterval:[self.contextEvent.timestamp doubleValue]];
        }
    }
    else {
        NSArray* keys = [self.contextEvent.properties allKeys];
        text = keys[indexPath.row];
        detailText = self.contextEvent.properties[keys[indexPath.row]];
    }
    
    cell.textLabel.text = text;
    cell.detailTextLabel.text = detailText;
    
    return cell;
}

@end
