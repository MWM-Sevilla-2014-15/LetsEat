//
//  LERegisterController.m
//  LetsEat
//
//  Created by Daniel Martin Jimenez on 6/7/15.
//  Copyright (c) 2015 Daniel Martin Jimenez. All rights reserved.
//

#import "LERegisterController.h"
#import "UIColor+MyColor.h"
#import "SCLAlertView.h"

#import "RegisterDTO.h"
#import "SignUpRequestDTO.h"
#import "SignUpActionTask.h"

@interface LERegisterController ()

@end

@implementation LERegisterController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"Registro";
    [self createView];
}

- (IBAction)doRegister
{
    if(self.textEmail.text.length > 0 && self.textNameUser.text.length > 0 && self.textPwd.text.length > 0 && self.textRepeatPwd.text.length > 0)
    {
        
        //Realizar llamada al servicio SIGNUP
        RegisterDTO *regis = [RegisterDTO alloc];
        regis.email = self.textEmail.text;
        regis.name = self.textNameUser.text;
        regis.pass = self.textPwd.text;
        
        SignUpRequestDTO *request = [SignUpRequestDTO new];
        request.request = (SignUpDTO *)regis;
        
        [SignUpActionTask signUpActionTaskForRequest:request showLoadingView:YES completed:^(NSInteger statusCode, SignUpResponseDTO *response) {
            SCLAlertView *alert = [[SCLAlertView alloc] initWithNewWindow];
            SCLButton *button = [alert addButton:@"Continuar" target:self selector:@selector(successButton)];
            button.buttonFormatBlock = ^NSDictionary* (void)
            {
                NSMutableDictionary *buttonConfig = [[NSMutableDictionary alloc] init];
                buttonConfig[@"backgroundColor"] = [UIColor customSuccessColor];
                buttonConfig[@"textColor"] = [UIColor whiteColor];
                return buttonConfig;
            };
            [alert showSuccess:@"Registro Completado" subTitle:@"Registro realizado correctamente" closeButtonTitle:nil duration:0.0f];

        } error:^(NSError *error) {
            NSLog(@"Error: %@", error);
        }];
    } else {
        SCLAlertView *alert = [[SCLAlertView alloc] initWithNewWindow];
        [alert showWarning:self title:@"ATENCIÓN" subTitle:@"Existen campos sin rellenar, revíselo antes de volver a intentarlo." closeButtonTitle:@"Continuar" duration:0.0f];
    }
}

- (void)successButton
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)createView
{
    //Labels
    self.labelNameUser.text = @"Nombre de usuario";
    self.labelNameUser.textColor = [UIColor customSecondColor];
    self.labelEmail.text = @"Correo electrónico";
    self.labelEmail.textColor = [UIColor customSecondColor];
    self.labelPwd.text = @"Contraseña";
    self.labelPwd.textColor = [UIColor customSecondColor];
    
    //Cadena para labelInfo
    self.labelInfo.text = @"Tu nombre de usuario te servirá para iniciar sesión juto con tu contraseña.";
    self.labelInfo.textColor = [UIColor customThirdColor];
    self.labelInfo.font = [UIFont fontWithName:@"Helvetica-Bold" size:13];
    self.labelInfo2.text = @"Introduce un email válido, será útil para recuperar tu contraseña.";
    self.labelInfo2.textColor = [UIColor customThirdColor];
    self.labelInfo2.font = [UIFont fontWithName:@"Helvetica-Bold" size:13];
    
    //Customizar textfield
    self.textNameUser.textColor = [UIColor customThirdColor];
    self.textEmail.textColor = [UIColor customThirdColor];
    self.textPwd.textColor = [UIColor customThirdColor];
    self.textRepeatPwd.textColor = [UIColor customThirdColor];
    
    //Button
    [self.buttonRegister setTitle:@"Continuar" forState:UIControlStateNormal];
    self.buttonRegister.backgroundColor = [UIColor customSecondColor];
    [self.buttonRegister setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    //Lineas justo debajo de los textfield
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(20, 147, 335, 1)];
    lineView.backgroundColor = [UIColor customSecondColor];
    [self.view addSubview:lineView];
    
    UIView *lineView2 = [[UIView alloc] initWithFrame:CGRectMake(20, 257, 335, 1)];
    lineView2.backgroundColor = [UIColor customSecondColor];
    [self.view addSubview:lineView2];
    
    UIView *lineView3 = [[UIView alloc] initWithFrame:CGRectMake(20, 358, 335, 1)];
    lineView3.backgroundColor = [UIColor customSecondColor];
    [self.view addSubview:lineView3];
    
    UIView *lineView4 = [[UIView alloc] initWithFrame:CGRectMake(20, 398, 335, 1)];
    lineView4.backgroundColor = [UIColor customSecondColor];
    [self.view addSubview:lineView4];
}

//MODIFICA EL COMPORTAMIENTO DEL BOTON CUANDO SE PULSA Y SE DEJA DE PULSAR
-(IBAction) buttonTouchDown:(id)sender {
    self.buttonRegister.backgroundColor = [UIColor customSecondColorPress];
    [self.buttonRegister setTitleColor:[UIColor customSecondColor] forState:UIControlStateHighlighted & UIControlStateSelected];
}

-(IBAction) buttonTouchUpOutside:(id)sender {
    self.buttonRegister.backgroundColor = [UIColor customSecondColor];
    [self.buttonRegister setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted & UIControlStateSelected];
}

-(IBAction) buttonTouchUpInside:(id)sender {
    self.buttonRegister.backgroundColor = [UIColor customSecondColor];
    [self.buttonRegister setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted & UIControlStateSelected];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.textNameUser resignFirstResponder];
    [self.textEmail resignFirstResponder];
    [self.textPwd resignFirstResponder];
    [self.textRepeatPwd resignFirstResponder];
}

@end
