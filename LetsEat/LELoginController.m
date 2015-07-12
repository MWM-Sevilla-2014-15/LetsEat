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
#import "SVProgressHUD.h"

#import "SignInRequestDTO.h"
#import "SignInActionTask.h"
#import "LoginDTO.h"

@interface LELoginController ()

@end

@implementation LELoginController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    self.navigationItem.hidesBackButton = YES;
        
    self.title = @"Bienvenido";
    [self createView];
    
    self.userData = [NSUserDefaults standardUserDefaults];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
}

-(IBAction)doLogin
{
    [self.textUser resignFirstResponder];
    [self.textPwd resignFirstResponder];
    
    if(self.textUser.text.length > 0 && self.textPwd.text.length > 0){
        [SVProgressHUD showWithStatus:@"Entrando..."];

        [self.labelErrorUsr setHidden:YES];
        self.labelErrorUsr.font = [UIFont fontWithName:@"Helvetica" size:12];
        [self.labelErrorUsr setTextColor: [UIColor customErrorColor]];
        [self.labelErrorUsr setText:@""];
        [self.labelErrorPwd setHidden:YES];
        self.labelErrorPwd.font = [UIFont fontWithName:@"Helvetica" size:12];
        [self.labelErrorPwd setTextColor: [UIColor customErrorColor]];
        [self.labelErrorPwd setText:@""];
        
        LoginDTO *login = [LoginDTO alloc];
        login.name = self.textUser.text;
        login.pass = self.textPwd.text;
        
        SignInRequestDTO *request = [SignInRequestDTO new];
        request.request = (SignInDTO *)login;
        
        [SignInActionTask signInActionTaskForRequest:request showLoadingView:NO completed:^(NSInteger statusCode, SignInResponseDTO *response) {
            [SVProgressHUD dismiss];
            if([response.code isEqualToString:@"SI_OK"]){
                [self.userData setObject:self.textUser.text forKey:@"User"];
                [self.userData setObject:self.textPwd.text forKey:@"Password"];
                [self.userData synchronize];
                [self performSegueWithIdentifier:@"openMain" sender:nil];
            } else if(response.desc == nil){
                SCLAlertView *alert = [[SCLAlertView alloc] init];
                [alert showError:self title:@"ERROR"
                        subTitle:@"Fallo en la conexión. Compruebe que está conectado a una red e inténtelo de nuevo."
                closeButtonTitle:@"Continuar" duration:0.0f];
            } else {
                SCLAlertView *alert = [[SCLAlertView alloc] init];
                [alert showError:self title:@"ERROR"
                        subTitle:response.desc
                closeButtonTitle:@"Continuar" duration:0.0f];
            }
        } error:^(NSError *error) {
            [SVProgressHUD dismiss];
            NSLog(@"Error: %@", error);
        }];
    } else {
        SCLAlertView *alert = [[SCLAlertView alloc] init];
        [alert showWarning:self title:@"ATENCIÓN" subTitle:@"Existen campos sin rellenar, revíselo antes de volver a intentarlo." closeButtonTitle:@"Continuar" duration:0.0f];
        
        if(self.textUser.text.length == 0){
            [self.labelErrorUsr setHidden:NO];
            self.labelErrorUsr.font = [UIFont fontWithName:@"Helvetica" size:12];
            [self.labelErrorUsr setTextColor: [UIColor customErrorColor]];
            [self.labelErrorUsr setText:@"Campo obligatorio."];
        } else if(self.textUser.text.length > 0){
            [self.labelErrorUsr setHidden:YES];
            self.labelErrorUsr.font = [UIFont fontWithName:@"Helvetica" size:12];
            [self.labelErrorUsr setTextColor: [UIColor customErrorColor]];
            [self.labelErrorUsr setText:@""];
        }
        if(self.textPwd.text.length == 0){
            [self.labelErrorPwd setHidden:NO];
            self.labelErrorPwd.font = [UIFont fontWithName:@"Helvetica" size:12];
            [self.labelErrorPwd setTextColor: [UIColor customErrorColor]];
            [self.labelErrorPwd setText:@"Campo obligatorio."];
        } else if(self.textPwd.text.length > 0){
            [self.labelErrorPwd setHidden:YES];
            self.labelErrorPwd.font = [UIFont fontWithName:@"Helvetica" size:12];
            [self.labelErrorPwd setTextColor: [UIColor customErrorColor]];
            [self.labelErrorPwd setText:@""];
        }
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
    //Customizar labels
    [self.labelErrorUsr setHidden:YES];
    self.labelErrorUsr.font = [UIFont fontWithName:@"Helvetica" size:12];
    [self.labelErrorUsr setTextColor: [UIColor customErrorColor]];
    [self.labelErrorUsr setText:@""];
    
    [self.labelErrorPwd setHidden:YES];
    self.labelErrorPwd.font = [UIFont fontWithName:@"Helvetica" size:12];
    [self.labelErrorPwd setTextColor: [UIColor customErrorColor]];
    [self.labelErrorPwd setText:@""];
    
    //Button recuperar contraseña
    [self.buttonRecover setTitle:@"¿Olvidaste tu contraseña o nombre de usuario?" forState:UIControlStateNormal];
    [self.buttonRecover setTitleColor:[UIColor customThirdColor] forState:UIControlStateNormal];
    self.buttonRecover.titleLabel.font = [UIFont fontWithName:@"Helvetica-Light" size:14];
    
    //Linea entre user y pwd
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 53, self.view.bounds.size.width, 18)];
    lineView.backgroundColor = [UIColor whiteColor];
    [self.viewForm addSubview:lineView];
    
    //Customizar los botones
    self.buttonLog.backgroundColor = [UIColor customSecondColor];
    [self.buttonLog setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.buttonLog setTitle:@"Iniciar sesión" forState:UIControlStateNormal];
    
    self.buttonRegister.backgroundColor = [UIColor customThirdColor];
    [self.buttonRegister setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.buttonRegister setTitle:@"¿Eres nuevo? Regístrate" forState:UIControlStateNormal];
    
    //Customizar textfield
    self.textUser.textColor = [UIColor customThirdColor];
    self.textUser.delegate = self;
    self.textPwd.textColor = [UIColor customThirdColor];
    self.textPwd.delegate = self;
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

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if(textField == self.textUser){
        NSUInteger newLength = [textField.text length] + [string length] - range.length;
        return (newLength > 15) ? NO : YES;
    } else {
        NSUInteger newLength = [textField.text length] + [string length] - range.length;
        return (newLength > 20) ? NO : YES;
    }
}

@end
