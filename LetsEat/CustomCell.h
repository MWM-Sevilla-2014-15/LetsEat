//
//  CustomCell.h
//  LetsEat
//
//  Created by Daniel Martin Jimenez on 8/7/15.
//  Copyright (c) 2015 Daniel Martin Jimenez. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *labelName;
@property (strong, nonatomic) IBOutlet UILabel *labelType;
@property (strong, nonatomic) IBOutlet UILabel *labelHour;
@property (strong, nonatomic) IBOutlet UILabel *labelTables;
@property (strong, nonatomic) IBOutlet UIImageView *imageRest;
@property (strong, nonatomic) IBOutlet UILabel *labelNumberTables;
@property (strong, nonatomic) IBOutlet UIView *customView;

@end
