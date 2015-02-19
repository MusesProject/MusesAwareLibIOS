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

#import "SensorResponsesTableViewController.h"
#import "ContextEventTableViewController.h"
@import MusesKit;

@interface SensorResponsesTableViewController () <SensorManagerDelegate>
@property (nonatomic, readonly) SensorManager *sensorManager;
@property (nonatomic) NSArray *sensorsWithResponse;
@end

@implementation SensorResponsesTableViewController
#pragma mark - Properties

- (SensorManager *)sensorManager {
    return [SensorManager sharedInstance];
}

#pragma mark - View Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.sensorsWithResponse = [NSMutableArray new];
    
    // Add sensor for testing
    NSArray *sensors = @[[[SettingsSensor alloc] init], [[DeviceProtectionSensor alloc] init], [[ConnectivitySensor alloc] init], [[AppSensor alloc] init]];
    [self.sensorManager addSensors:sensors];
    self.sensorManager.delegate = self;
    
}

#pragma mark - IBActions

- (IBAction)refreshSensorResponses:(UIBarButtonItem *)sender {
    [self.sensorManager fetchSensorResponses];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.sensorsWithResponse.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"sensorCell" forIndexPath:indexPath];
    
    cell.textLabel.text = self.sensorsWithResponse[indexPath.row];
    
    return cell;
}

#pragma mark - SensorManagerDelegate

- (void)sensorManager:(SensorManager *)manager didUpdateSensorResponses:(NSDictionary *)responses {
    self.sensorsWithResponse = responses.allKeys;
    [self.tableView reloadData];
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"showSensorDetail"]) {
        if ([segue.destinationViewController isKindOfClass:[ContextEventTableViewController class]]) {
            ContextEventTableViewController *contextEventTVC = segue.destinationViewController;
            NSString *selectedSensorType = self.sensorsWithResponse[[self.tableView indexPathForSelectedRow].row];
            contextEventTVC.contextEvent = self.sensorManager.lastSensorResponses[selectedSensorType];
        }
    }
}

@end
