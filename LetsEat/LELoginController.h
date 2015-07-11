//
//  LELoginController.h
//  LetsEat
//
//  Created by Daniel Martin Jimenez on 3/7/15.
//  Copyright (c) 2015 Daniel Martin Jimenez. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LELoginController : UIViewController

@property (strong, nonatomic) IBOutlet UIView *contentView;

@property (strong, nonatomic) NSUserDefaults *userData;

@property (weak, nonatomic) IBOutlet UIView *viewForm;
@property (weak, nonatomic) IBOutlet UITextField *textUser;
@property (weak, nonatomic) IBOutlet UITextField *textPwd;
@property (weak, nonatomic) IBOutlet UIButton *buttonLog;
@property (weak, nonatomic) IBOutlet UIButton *buttonRegister;
@property (weak, nonatomic) IBOutlet UIButton *buttonRecover;

@end
