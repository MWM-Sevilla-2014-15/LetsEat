//
//  LERecoverController.m
//  LetsEat
//
//  Created by Daniel Martin Jimenez on 6/7/15.
//  Copyright (c) 2015 Daniel Martin Jimenez. All rights reserved.
//

#import "LERecoverController.h"
#import "UIColor+MyColor.h"
#import "SCLAlertView.h"

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
    
    [self.labelError setHidden:YES];
    self.labelError.font = [UIFont fontWithName:@"Helvetica" size:12];
    [self.labelError setTextColor: [UIColor customErrorColor]];
    [self.labelError setText:@""];
    
    //Init button
    [self.buttonSend setTitle:@"Enviar" forState:UIControlStateNormal];
    self.buttonSend.titleLabel.font = [UIFont fontWithName:@"Helvetica" size:14];
    [self.buttonSend setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.buttonSend.backgroundColor = [UIColor customSecondColor];
    
    //Init textfield
    self.textEmail.textColor = [UIColor customThirdColor];
}

-(IBAction)backToLogin
{
    [self.textEmail resignFirstResponder];
    if(self.textEmail.text.length > 0){
        if([self validateEmail:self.textEmail.text]){
            
            [self.labelError setHidden:YES];
            self.labelError.font = [UIFont fontWithName:@"Helvetica" size:12];
            [self.labelError setTextColor: [UIColor customErrorColor]];
            [self.labelError setText:@""];
            
            self.textEmail.layer.borderWidth = 1.0;
            self.textEmail.layer.cornerRadius = 7.0;
            self.textEmail.layer.borderColor = [UIColor clearColor].CGColor;
            
            SCLAlertView *alert = [[SCLAlertView alloc] initWithNewWindow];
            SCLButton *button = [alert addButton:@"Continuar" target:self selector:@selector(successButton)];
            button.buttonFormatBlock = ^NSDictionary* (void)
            {
                NSMutableDictionary *buttonConfig = [[NSMutableDictionary alloc] init];
                buttonConfig[@"backgroundColor"] = [UIColor customSuccessColor];
                buttonConfig[@"textColor"] = [UIColor whiteColor];
                return buttonConfig;
            };
            [alert showSuccess:@"Email Enviado" subTitle:@"Se ha enviado un email a su dirección de correo." closeButtonTitle:nil duration:0.0f];
        } else {
            SCLAlertView *alert = [[SCLAlertView alloc] initWithNewWindow];
            [alert showWarning:self title:@"ATENCIÓN" subTitle:@"Existen fallos en el formulario, revíselo antes de volver a intentarlo." closeButtonTitle:@"Continuar" duration:0.0f];
            
            [self.labelError setHidden:NO];
            self.labelError.font = [UIFont fontWithName:@"Helvetica" size:12];
            [self.labelError setTextColor: [UIColor customErrorColor]];
            [self.labelError setText:@"Formato email incorrecto. Inténtelo de nuevo."];
            
            self.textEmail.layer.borderWidth = 1.0;
            self.textEmail.layer.cornerRadius = 7.0;
            self.textEmail.layer.borderColor = [UIColor customErrorColor].CGColor;
        }
    } else {
        SCLAlertView *alert = [[SCLAlertView alloc] init];
        [alert showWarning:self title:@"ATENCIÓN" subTitle:@"Debe rellenar el campo de email, revíselo antes de volver a intentarlo." closeButtonTitle:@"Continuar" duration:0.0f];
        
        [self.labelError setHidden:NO];
        self.labelError.font = [UIFont fontWithName:@"Helvetica" size:12];
        [self.labelError setTextColor: [UIColor customErrorColor]];
        [self.labelError setText:@"Campo obligatorio."];
        
        self.textEmail.layer.borderWidth = 1.0;
        self.textEmail.layer.cornerRadius = 7.0;
        self.textEmail.layer.borderColor = [UIColor customErrorColor].CGColor;
    }
}

- (void)successButton
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

//Validar EMAIL
- (BOOL) validateEmail: (NSString *) candidate {
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,3}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:candidate];
}

@end
