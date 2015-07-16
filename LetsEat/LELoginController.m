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
#import <SMPageControl/SMPageControl.h>

#import "SignInRequestDTO.h"
#import "SignInActionTask.h"
#import "LoginDTO.h"

static NSString * const sampleDescription1 = @"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.";
static NSString * const sampleDescription2 = @"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore.";
static NSString * const sampleDescription3 = @"Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem.";
static NSString * const sampleDescription4 = @"Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit.";

@interface LELoginController ()

@property (strong, nonatomic) UIView *rootView;
@property int value;

@end

@implementation LELoginController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    self.navigationItem.hidesBackButton = YES;
        
    self.title = @"Bienvenido";
    
    self.rootView = self.navigationController.view;
    self.userData = [NSUserDefaults standardUserDefaults];
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    if([self.userData objectForKey:@"Constant"] == nil){
        [self createIntroView];
        self.value = 1;
        [self.userData setInteger:self.value forKey:@"Constant"];
        [self.userData synchronize];
    }
    [self createView];
}

-(IBAction)doLogin
{
    [self.textUser resignFirstResponder];
    [self.textPwd resignFirstResponder];
    
    if(self.textUser.text.length > 0 && self.textPwd.text.length > 0){
        [SVProgressHUD showWithStatus:@"Entrando..."];

        [self.labelErrorUsr setHidden:YES];
        self.labelErrorUsr.font = [UIFont fontWithName:@"Dosis-ExtraBold" size:12];
        [self.labelErrorUsr setTextColor: [UIColor customErrorColor]];
        [self.labelErrorUsr setText:@""];
        [self.labelErrorPwd setHidden:YES];
        self.labelErrorPwd.font = [UIFont fontWithName:@"Dosis-ExtraBold" size:12];
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
            self.labelErrorUsr.font = [UIFont fontWithName:@"Dosis-ExtraBold" size:12];
            [self.labelErrorUsr setTextColor: [UIColor customErrorColor]];
            [self.labelErrorUsr setText:@"Campo obligatorio."];
        } else if(self.textUser.text.length > 0){
            [self.labelErrorUsr setHidden:YES];
            self.labelErrorUsr.font = [UIFont fontWithName:@"Dosis-ExtraBold" size:12];
            [self.labelErrorUsr setTextColor: [UIColor customErrorColor]];
            [self.labelErrorUsr setText:@""];
        }
        if(self.textPwd.text.length == 0){
            [self.labelErrorPwd setHidden:NO];
            self.labelErrorPwd.font = [UIFont fontWithName:@"Dosis-ExtraBold" size:12];
            [self.labelErrorPwd setTextColor: [UIColor customErrorColor]];
            [self.labelErrorPwd setText:@"Campo obligatorio."];
        } else if(self.textPwd.text.length > 0){
            [self.labelErrorPwd setHidden:YES];
            self.labelErrorPwd.font = [UIFont fontWithName:@"Dosis-ExtraBold" size:12];
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
    self.labelErrorUsr.font = [UIFont fontWithName:@"Dosis-ExtraBold" size:12];
    [self.labelErrorUsr setTextColor: [UIColor customErrorColor]];
    [self.labelErrorUsr setText:@""];
    
    [self.labelErrorPwd setHidden:YES];
    self.labelErrorPwd.font = [UIFont fontWithName:@"Dosis-ExtraBold" size:12];
    [self.labelErrorPwd setTextColor: [UIColor customErrorColor]];
    [self.labelErrorPwd setText:@""];
    
    //Button recuperar contraseña
    [self.buttonRecover setTitle:@"¿Olvidaste tu contraseña o nombre de usuario?" forState:UIControlStateNormal];
    self.buttonRecover.titleLabel.font = [UIFont fontWithName:@"Dosis-Light" size:17];
    [self.buttonRecover setTitleColor:[UIColor customThirdColor] forState:UIControlStateNormal];
    
    //Linea entre user y pwd
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 53, self.view.bounds.size.width, 18)];
    lineView.backgroundColor = [UIColor whiteColor];
    [self.viewForm addSubview:lineView];
    
    //Customizar los botones
    self.buttonLog.backgroundColor = [UIColor customSecondColor];
    self.buttonLog.titleLabel.font = [UIFont fontWithName:@"Dosis-SemiBold" size:22];
    [self.buttonLog setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.buttonLog setTitle:@"Iniciar sesión" forState:UIControlStateNormal];
    
    self.buttonRegister.backgroundColor = [UIColor customThirdColor];
    self.buttonRegister.titleLabel.font = [UIFont fontWithName:@"Dosis-SemiBold" size:22];
    [self.buttonRegister setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.buttonRegister setTitle:@"¿Eres nuevo? Regístrate" forState:UIControlStateNormal];
    
    //Customizar textfield
    self.textUser.textColor = [UIColor customThirdColor];
    self.textUser.font = [UIFont fontWithName:@"Dosis-Medium" size:18];
    self.textUser.delegate = self;
    self.textPwd.textColor = [UIColor customThirdColor];
    self.textPwd.font = [UIFont fontWithName:@"Dosis-Medium" size:18];
    self.textPwd.delegate = self;
}

- (void)createIntroView
{
    [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationFade];
    
    EAIntroPage *page1 = [EAIntroPage page];
    page1.title = @"Hello world";
    page1.pageView.backgroundColor = [UIColor customMainColor];
    page1.titleColor = [UIColor customMainColor];
    page1.desc = sampleDescription1;
    page1.descColor = [UIColor customMainColor];
    page1.bgColor = [UIColor whiteColor];
    page1.titleIconView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"title1"]];
    
    EAIntroPage *page2 = [EAIntroPage page];
    page2.title = @"This is page 2";
    page2.titleColor = [UIColor customMainColor];
    page2.desc = sampleDescription2;
    page2.descColor = [UIColor customMainColor];
    page2.bgColor = [UIColor whiteColor];
    page2.titleIconView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"title2"]];
    
    EAIntroPage *page3 = [EAIntroPage page];
    page3.title = @"This is page 3";
    page3.titleColor = [UIColor customMainColor];
    page3.desc = sampleDescription3;
    page3.descColor = [UIColor customMainColor];
    page3.bgColor = [UIColor whiteColor];
    page3.titleIconView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"title3"]];
    
    EAIntroPage *page4 = [EAIntroPage page];
    page4.title = @"This is page 4";
    page4.titleColor = [UIColor customMainColor];
    page4.desc = sampleDescription4;
    page4.descColor = [UIColor customMainColor];
    page4.bgColor = [UIColor whiteColor];
    page4.titleIconView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"title4"]];
    
    EAIntroView *intro = [[EAIntroView alloc] initWithFrame:self.rootView.bounds];
    [intro setDelegate:self];
    
    SMPageControl *pageControl = [[SMPageControl alloc] init];
    pageControl.pageIndicatorTintColor = [UIColor customThirdColor];
    pageControl.currentPageIndicatorTintColor = [UIColor customMainColor];
    [pageControl sizeToFit];
    intro.pageControl = (UIPageControl *)pageControl;
    
    // show skipButton only on 4th page + animation
    intro.skipButton.alpha = 0.f;
    intro.skipButton.enabled = NO;
    [intro.skipButton setTitleColor:[UIColor customMainColor] forState:UIControlStateNormal];
    [intro.skipButton setTitle:@"Salir" forState:UIControlStateNormal];
    page4.onPageDidAppear = ^{
        intro.skipButton.enabled = YES;
        [UIView animateWithDuration:0.3f animations:^{
            intro.skipButton.alpha = 1.f;
        }];
    };
    page4.onPageDidDisappear = ^{
        intro.skipButton.enabled = NO;
        [UIView animateWithDuration:0.3f animations:^{
            intro.skipButton.alpha = 0.f;
        }];
    };
    
    [intro setPages:@[page1,page2,page3,page4]];
    [intro showInView:self.rootView animateDuration:0.0];
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

- (void)introDidFinish:(EAIntroView *)introView
{
    [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationFade];
}

@end
