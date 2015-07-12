//
//  LERecoverController.h
//  LetsEat
//
//  Created by Daniel Martin Jimenez on 6/7/15.
//  Copyright (c) 2015 Daniel Martin Jimenez. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LERecoverController : UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *textEmail;
@property (weak, nonatomic) IBOutlet UIButton *buttonSend;
@property (weak, nonatomic) IBOutlet UILabel *labelInfo;
@property (weak, nonatomic) IBOutlet UILabel *labelError;

@end
