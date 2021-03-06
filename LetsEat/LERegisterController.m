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
#import "SVProgressHUD.h"

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
        [self.labelErrorName setHidden:YES];
        self.labelErrorName.font = [UIFont fontWithName:@"Dosis-ExtraBold" size:12];
        [self.labelErrorName setTextColor: [UIColor customErrorColor]];
        [self.labelErrorName setText:@""];
        
        if(self.textNameUser.text.length < 3){
            [self.labelErrorName setHidden:NO];
            self.labelErrorName.font = [UIFont fontWithName:@"Dosis-ExtraBold" size:12];
            [self.labelErrorName setTextColor: [UIColor customErrorColor]];
            [self.labelErrorName setText:@"El nombre de usuario debe tener una longitud minimo de 3."];
        } else {
            [self.labelErrorName setHidden:YES];
            self.labelErrorName.font = [UIFont fontWithName:@"Dosis-ExtraBold" size:12];
            [self.labelErrorName setTextColor: [UIColor customErrorColor]];
            [self.labelErrorName setText:@""];
        }
        if(self.textPwd.text.length < 6 || self.textRepeatPwd.text.length < 6){
            [self.labelErrorPwd setHidden:NO];
            self.labelErrorPwd.font = [UIFont fontWithName:@"Dosis-ExtraBold" size:12];
            [self.labelErrorPwd setTextColor: [UIColor customErrorColor]];
            [self.labelErrorPwd setText:@"La contraseña debe tener 6 o más caracteres."];
        }else if([self.textPwd.text isEqualToString:self.textRepeatPwd.text]){
            [self.labelErrorPwd setHidden:YES];
            self.labelErrorPwd.font = [UIFont fontWithName:@"Dosis-ExtraBold" size:12];
            [self.labelErrorPwd setTextColor: [UIColor customErrorColor]];
            [self.labelErrorPwd setText:@""];
        } else {
            [self.labelErrorPwd setHidden:NO];
            self.labelErrorPwd.font = [UIFont fontWithName:@"Dosis-ExtraBold" size:12];
            [self.labelErrorPwd setTextColor: [UIColor customErrorColor]];
            [self.labelErrorPwd setText:@"Las contraseñas no coinciden. Inténtelo de nuevo."];
        }
        if([self validateEmail:self.textEmail.text]){
            [self.labelErrorEmail setHidden:YES];
            self.labelErrorEmail.font = [UIFont fontWithName:@"Dosis-ExtraBold" size:12];
            [self.labelErrorEmail setTextColor: [UIColor customErrorColor]];
            [self.labelErrorEmail setText:@""];
        } else {
            [self.labelErrorEmail setHidden:NO];
            self.labelErrorEmail.font = [UIFont fontWithName:@"Dosis-ExtraBold" size:12];
            [self.labelErrorEmail setTextColor: [UIColor customErrorColor]];
            [self.labelErrorEmail setText:@"Formato email incorrecto. Inténtelo de nuevo."];
        }
        
        if([self.labelErrorPwd.text isEqualToString:@""] && [self.labelErrorEmail.text isEqualToString:@""] && [self.labelErrorName.text isEqualToString:@""])
        {
            [SVProgressHUD showWithStatus:@"Registrando..."];
            
            //Realizar llamada al servicio SIGNUP
            RegisterDTO *regis = [RegisterDTO alloc];
            regis.email = self.textEmail.text;
            regis.name = self.textNameUser.text;
            regis.pass = self.textPwd.text;
            
            SignUpRequestDTO *request = [SignUpRequestDTO new];
            request.request = (SignUpDTO *)regis;
            
            [SignUpActionTask signUpActionTaskForRequest:request showLoadingView:NO completed:^(NSInteger statusCode, SignUpResponseDTO *response) {
                [SVProgressHUD dismiss];
                if(response.desc == nil){
                    SCLAlertView *alert = [[SCLAlertView alloc] initWithNewWindow];
                    [alert showError:self title:@"ERROR"
                            subTitle:@"Fallo en la conexión. Compruebe que está conectado a una red e inténtelo de nuevo."
                    closeButtonTitle:@"Continuar" duration:0.0f];
                } else if([response.code isEqualToString:@"SU_OK"]){
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
                } else {
                    SCLAlertView *alert = [[SCLAlertView alloc] initWithNewWindow];
                    [alert showError:self title:@"ERROR"
                            subTitle:response.desc
                    closeButtonTitle:@"Continuar" duration:0.0f];
                }
            } error:^(NSError *error) {
                [SVProgressHUD dismiss];
                NSLog(@"Error: %@", error);
            }];
        } else {
            SCLAlertView *alert = [[SCLAlertView alloc] initWithNewWindow];
            [alert showWarning:self title:@"ATENCIÓN" subTitle:@"Existen fallos en el formulario, revíselo antes de volver a intentarlo." closeButtonTitle:@"Continuar" duration:0.0f];
        }
    } else {
        SCLAlertView *alert = [[SCLAlertView alloc] initWithNewWindow];
        [alert showWarning:self title:@"ATENCIÓN" subTitle:@"Existen campos sin rellenar, revíselo antes de volver a intentarlo." closeButtonTitle:@"Continuar" duration:0.0f];
        
        if(self.textNameUser.text.length == 0){
            [self.labelErrorName setHidden:NO];
            self.labelErrorName.font = [UIFont fontWithName:@"Dosis-ExtraBold" size:12];
            [self.labelErrorName setTextColor: [UIColor customErrorColor]];
            [self.labelErrorName setText:@"Campo obligatorio."];
        } else if(self.textNameUser.text.length < 3){
            [self.labelErrorName setHidden:NO];
            self.labelErrorName.font = [UIFont fontWithName:@"Dosis-ExtraBold" size:12];
            [self.labelErrorName setTextColor: [UIColor customErrorColor]];
            [self.labelErrorName setText:@"El nombre de usuario debe tener 3 o más caracteres."];
        } else if(self.textNameUser.text.length > 0){
            [self.labelErrorName setHidden:YES];
            self.labelErrorName.font = [UIFont fontWithName:@"Dosis-ExtraBold" size:12];
            [self.labelErrorName setTextColor: [UIColor customErrorColor]];
            [self.labelErrorName setText:@""];
        }
        if(self.textEmail.text.length == 0){
            [self.labelErrorEmail setHidden:NO];
            self.labelErrorEmail.font = [UIFont fontWithName:@"Dosis-ExtraBold" size:12];
            [self.labelErrorEmail setTextColor: [UIColor customErrorColor]];
            [self.labelErrorEmail setText:@"Campo obligatorio."];
        } else {
            if([self validateEmail:self.textEmail.text]){
                [self.labelErrorEmail setHidden:YES];
                self.labelErrorEmail.font = [UIFont fontWithName:@"Dosis-ExtraBold" size:12];
                [self.labelErrorEmail setTextColor: [UIColor customErrorColor]];
                [self.labelErrorEmail setText:@""];
            } else {
                [self.labelErrorEmail setHidden:NO];
                self.labelErrorEmail.font = [UIFont fontWithName:@"Dosis-ExtraBold" size:12];
                [self.labelErrorEmail setTextColor: [UIColor customErrorColor]];
                [self.labelErrorEmail setText:@"Formato email incorrecto. Inténtelo de nuevo."];
            }
        }
        if(self.textPwd.text.length == 0 || self.textRepeatPwd.text.length == 0){
            [self.labelErrorPwd setHidden:NO];
            self.labelErrorPwd.font = [UIFont fontWithName:@"Dosis-ExtraBold" size:12];
            [self.labelErrorPwd setTextColor: [UIColor customErrorColor]];
            [self.labelErrorPwd setText:@"Campo/s obligatorio/s."];
        } else if(self.textPwd.text.length < 6 || self.textRepeatPwd.text.length < 6){
            [self.labelErrorPwd setHidden:NO];
            self.labelErrorPwd.font = [UIFont fontWithName:@"Dosis-ExtraBold" size:12];
            [self.labelErrorPwd setTextColor: [UIColor customErrorColor]];
            [self.labelErrorPwd setText:@"La contraseña debe tener 6 o más caracteres."];
        } else {
            if([self.textPwd.text isEqualToString:self.textRepeatPwd.text]){
                [self.labelErrorPwd setHidden:YES];
                self.labelErrorPwd.font = [UIFont fontWithName:@"Dosis-ExtraBold" size:12];
                [self.labelErrorPwd setTextColor: [UIColor customErrorColor]];
                [self.labelErrorPwd setText:@""];
            } else {
                [self.labelErrorPwd setHidden:NO];
                self.labelErrorPwd.font = [UIFont fontWithName:@"Dosis-ExtraBold" size:12];
                [self.labelErrorPwd setTextColor: [UIColor customErrorColor]];
                [self.labelErrorPwd setText:@"Las contraseñas no coinciden. Inténtelo de nuevo."];
            }
        }
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
    self.labelNameUser.font = [UIFont fontWithName:@"Dosis-SemiBold" size:20];
    self.labelEmail.text = @"Correo electrónico";
    self.labelEmail.textColor = [UIColor customSecondColor];
    self.labelEmail.font = [UIFont fontWithName:@"Dosis-SemiBold" size:20];
    self.labelPwd.text = @"Contraseña";
    self.labelPwd.textColor = [UIColor customSecondColor];
    self.labelPwd.font = [UIFont fontWithName:@"Dosis-SemiBold" size:20];
    
    [self.labelErrorName setHidden:YES];
    self.labelErrorName.font = [UIFont fontWithName:@"Dosis-ExtraBold" size:12];
    [self.labelErrorName setTextColor: [UIColor customErrorColor]];
    [self.labelErrorName setText:@""];
    
    [self.labelErrorEmail setHidden:YES];
    self.labelErrorEmail.font = [UIFont fontWithName:@"Dosis-ExtraBold" size:12];
    [self.labelErrorEmail setTextColor: [UIColor customErrorColor]];
    [self.labelErrorEmail setText:@""];
    
    [self.labelErrorPwd setHidden:YES];
    self.labelErrorPwd.font = [UIFont fontWithName:@"Dosis-ExtraBold" size:12];
    [self.labelErrorPwd setTextColor: [UIColor customErrorColor]];
    [self.labelErrorPwd setText:@""];
    
    //Cadena para labelInfo
    self.labelInfo.text = @"Tu nombre de usuario te servirá para iniciar sesión juto con tu contraseña.";
    self.labelInfo.textColor = [UIColor customThirdColor];
    self.labelInfo.font = [UIFont fontWithName:@"Dosis-Bold" size:16];
    self.labelInfo2.text = @"Introduce un email válido, será útil para recuperar tu contraseña.";
    self.labelInfo2.textColor = [UIColor customThirdColor];
    self.labelInfo2.font = [UIFont fontWithName:@"Dosis-Bold" size:16];
    
    //Customizar textfield
    self.textNameUser.textColor = [UIColor customThirdColor];
    self.textNameUser.delegate = self;
    self.textNameUser.font = [UIFont fontWithName:@"Dosis-Medium" size:18];
    self.textEmail.textColor = [UIColor customThirdColor];
    self.textEmail.delegate = self;
    self.textEmail.font = [UIFont fontWithName:@"Dosis-Medium" size:18];
    self.textPwd.textColor = [UIColor customThirdColor];
    self.textPwd.delegate = self;
    self.textPwd.font = [UIFont fontWithName:@"Dosis-Medium" size:18];
    self.textRepeatPwd.textColor = [UIColor customThirdColor];
    self.textRepeatPwd.delegate = self;
    self.textRepeatPwd.font = [UIFont fontWithName:@"Dosis-Medium" size:18];
    
    //Button
    [self.buttonRegister setTitle:@"Continuar" forState:UIControlStateNormal];
    self.buttonRegister.backgroundColor = [UIColor customSecondColor];
    self.buttonRegister.titleLabel.font = [UIFont fontWithName:@"Dosis-SemiBold" size:22];
    [self.buttonRegister setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    //Lineas justo debajo de los textfield
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(20, 83, 335, 1)];
    lineView.backgroundColor = [UIColor customSecondColor];
    [self.view addSubview:lineView];
    
    UIView *lineView2 = [[UIView alloc] initWithFrame:CGRectMake(20, 193, 335, 1)];
    lineView2.backgroundColor = [UIColor customSecondColor];
    [self.view addSubview:lineView2];
    
    UIView *lineView3 = [[UIView alloc] initWithFrame:CGRectMake(20, 294, 335, 1)];
    lineView3.backgroundColor = [UIColor customSecondColor];
    [self.view addSubview:lineView3];
    
    UIView *lineView4 = [[UIView alloc] initWithFrame:CGRectMake(20, 334, 335, 1)];
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

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if(textField == self.textNameUser){
        NSUInteger newLength = [textField.text length] + [string length] - range.length;
        return (newLength > 15) ? NO : YES;
    } else if(textField == self.textEmail){
        NSUInteger newLength = [textField.text length] + [string length] - range.length;
        return (newLength > 30) ? NO : YES;
    } else {
        NSUInteger newLength = [textField.text length] + [string length] - range.length;
        return (newLength > 20) ? NO : YES;
    }
}

//Validar EMAIL
- (BOOL) validateEmail: (NSString *) candidate {
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,3}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:candidate];
}

@end
