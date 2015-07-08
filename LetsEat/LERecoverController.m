//
//  LERecoverController.m
//  LetsEat
//
//  Created by Daniel Martin Jimenez on 6/7/15.
//  Copyright (c) 2015 Daniel Martin Jimenez. All rights reserved.
//

#import "LERecoverController.h"
#import "UIColor+MyColor.h"

@interface LERecoverController ()

@end

@implementation LERecoverController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"Recuperar datos";
    
    [self createView];
}

-(void)createView
{
    //Label de info
    self.labelInfo.text = @"Introduce tu correo electrónico y te enviaremos información sobre tu usuario y contraseña.";
    self.labelInfo.textColor = [UIColor customThirdColor];
    
    //Init button
    [self.buttonSend setTitle:@"Enviar" forState:UIControlStateNormal];
    self.buttonSend.titleLabel.font = [UIFont fontWithName:@"Helvetica-Light" size:14];
    [self.buttonSend setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.buttonSend.backgroundColor = [UIColor customSecondColor];
    
    //Init textfield
    self.textEmail.textColor = [UIColor customThirdColor];
}

-(IBAction)backToLogin
{
    [self.textEmail resignFirstResponder];
    [self.navigationController popViewControllerAnimated:YES];
}

//MODIFICA EL COMPORTAMIENTO DEL BOTON CUANDO SE PULSA Y SE DEJA DE PULSAR
-(IBAction) buttonTouchDown:(id)sender {
    self.buttonSend.backgroundColor = [UIColor customSecondColorPress];
    [self.buttonSend setTitleColor:[UIColor customSecondColor] forState:UIControlStateHighlighted & UIControlStateSelected];
}

-(IBAction) buttonTouchUpOutside:(id)sender {
    self.buttonSend.backgroundColor = [UIColor customSecondColor];
    [self.buttonSend setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted & UIControlStateSelected];
}

-(IBAction) buttonTouchUpInside:(id)sender {
    self.buttonSend.backgroundColor = [UIColor customSecondColor];
    [self.buttonSend setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted & UIControlStateSelected];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.textEmail resignFirstResponder];
}

@end
