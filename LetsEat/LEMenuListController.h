//
//  LEMenuListController.h
//  LetsGoEat
//
//  Created by Daniel Martin Jimenez on 10/7/15.
//  Copyright (c) 2015 Daniel Martin Jimenez. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LEMenuListController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) IBOutlet UIView *customView;

@end
