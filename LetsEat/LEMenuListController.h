//
//  LEMenuListController.h
//  LetsGoEat
//
//  Created by Daniel Martin Jimenez on 10/7/15.
//  Copyright (c) 2015 Daniel Martin Jimenez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PopMenu.h"

@interface LEMenuListController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) NSUserDefaults *userData;
@property (nonatomic, strong) PopMenu *popMenu;

@end
