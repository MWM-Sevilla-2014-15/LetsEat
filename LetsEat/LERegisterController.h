//
//  LERegisterController.h
//  LetsEat
//
//  Created by Daniel Martin Jimenez on 6/7/15.
//  Copyright (c) 2015 Daniel Martin Jimenez. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LERegisterController : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *labelNameUser;
@property (strong, nonatomic) IBOutlet UILabel *labelEmail;
@property (strong, nonatomic) IBOutlet UILabel *labelPwd;
@property (strong, nonatomic) IBOutlet UILabel *labelInfo;
@property (strong, nonatomic) IBOutlet UILabel *labelInfo2;
@property (strong, nonatomic) IBOutlet UITextField *textNameUser;
@property (strong, nonatomic) IBOutlet UITextField *textEmail;
@property (strong, nonatomic) IBOutlet UITextField *textPwd;
@property (strong, nonatomic) IBOutlet UITextField *textRepeatPwd;
@property (strong, nonatomic) IBOutlet UIButton *buttonRegister;

@end
