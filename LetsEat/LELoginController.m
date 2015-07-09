//
//  LELoginController.m
//  LetsEat
//
//  Created by Daniel Martin Jimenez on 3/7/15.
//  Copyright (c) 2015 Daniel Martin Jimenez. All rights reserved.
//

#import "LELoginController.h"
#import "UIColor+MyColor.h"
#import "SCLAlertView.h"

@interface LELoginController ()

@end

@implementation LELoginController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    
    self.title = @"Bienvenido";
    [self createView];
}

-(IBAction)doLogin
{
    if(self.textUser.text.length > 0 && self.textPwd.text.length > 0){
        [self performSegueWithIdentifier:@"openMain" sender:nil];
    } else {
        SCLAlertView *alert = [[SCLAlertView alloc] init];
        [alert showWarning:self title:@"ATENCIÓN" subTitle:@"Existen campos sin rellenar, revíselo antes de volver a intentarlo." closeButtonTitle:@"Continuar" duration:0.0f];
    }
}

-(IBAction)openRecover
{
    [self performSegueWithIdentifier:@"openRecover" sender:nil];
}

-(IBAction)openRegister
{
    [self performSegueWithIdentifier:@"openRegister" sender:nil];
}

- (void)createView
{
    //Label recuperar contraseña
    [self.buttonRecover setTitle:@"¿Olvidaste tu contraseña o nombre de usuario?" forState:UIControlStateNormal];
    [self.buttonRecover setTitleColor:[UIColor customThirdColor] forState:UIControlStateNormal];
    self.buttonRecover.titleLabel.font = [UIFont fontWithName:@"Helvetica-Light" size:14];
    
    //Linea entre user y pwd
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 54, self.view.bounds.size.width, 2)];
    lineView.backgroundColor = [UIColor whiteColor];
    [self.viewForm addSubview:lineView];
    
    //Customizar los botones
    self.buttonLog.backgroundColor = [UIColor customSecondColor];
    [self.buttonLog setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.buttonLog setTitle:@"Iniciar sesión" forState:UIControlStateNormal];
    
    self.buttonRegister.backgroundColor = [UIColor customThirdColor];
    [self.buttonRegister setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.buttonRegister setTitle:@"¿Eres nuevo? Registrate" forState:UIControlStateNormal];
    
    //Customizar textfield
    self.textUser.textColor = [UIColor customThirdColor];
    self.textPwd.textColor = [UIColor customThirdColor];
}

//MODIFICA EL COMPORTAMIENTO DEL BOTON CUANDO SE PULSA Y SE DEJA DE PULSAR
-(IBAction) buttonTouchDown:(id)sender {
    if(sender == self.buttonLog){
        self.buttonLog.backgroundColor = [UIColor customSecondColorPress];
        [self.buttonLog setTitleColor:[UIColor customSecondColor] forState:UIControlStateHighlighted & UIControlStateSelected];
    } else {
        self.buttonRegister.backgroundColor = [UIColor customThirdColorPress];
        [self.buttonRegister setTitleColor:[UIColor customThirdColor] forState:UIControlStateHighlighted & UIControlStateSelected];
    }
}

-(IBAction) buttonTouchUpOutside:(id)sender {
    if(sender == self.buttonLog){
        self.buttonLog.backgroundColor = [UIColor customSecondColor];
        [self.buttonLog setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted & UIControlStateSelected];
    } else {
        self.buttonRegister.backgroundColor = [UIColor customThirdColor];
        [self.buttonRegister setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted & UIControlStateSelected];
    }
}

-(IBAction) buttonTouchUpInside:(id)sender {
    if(sender == self.buttonLog){
        self.buttonLog.backgroundColor = [UIColor customSecondColor];
        [self.buttonLog setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted & UIControlStateSelected];
    } else {
        self.buttonRegister.backgroundColor = [UIColor customThirdColor];
        [self.buttonRegister setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted & UIControlStateSelected];
    }
}

-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.textPwd resignFirstResponder];
    [self.textUser resignFirstResponder];
}

@end
