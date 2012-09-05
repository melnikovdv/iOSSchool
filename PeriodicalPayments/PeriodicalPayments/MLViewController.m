//
//  MLViewController.m
//  PeriodicalPayments
//
//  Created by Дмитрий Мельников on 26.08.12.
//  Copyright (c) 2012 Дмитрий Мельников. All rights reserved.
//

#import "MLViewController.h"
#import "AFJSONRequestOperation.h"
#import "GTMOAuth2Authentication.h"
#import "GTMOAuth2ViewControllerTouch.h"
#import "MLHTTPClient.h"
#import "MLYandexMoneyAPI.h"
#import "MLMobileController.h"

@interface MLViewController ()

@property (strong, nonatomic) IBOutlet UIButton *btn;
@property (strong, nonatomic) IBOutlet UIButton *btnGetToken;
@property (strong, nonatomic) NSString *accessToken;
@property (strong, nonatomic) IBOutlet UILabel *lblAccount;
@property (strong, nonatomic) IBOutlet UILabel *lblBalance;
@property (strong, nonatomic) IBOutlet UILabel *lblToken;

@property (strong, nonatomic) MLYandexMoneyAPI *ymApi;

@end

@implementation MLViewController

@synthesize btn;
@synthesize btnGetToken;
@synthesize accessToken = _accessToken;
@synthesize lblAccount;
@synthesize lblBalance;
@synthesize lblToken;

@synthesize ymApi;

NSString * const clientId = @"70CC427E9E80B2984B3BF49738F68A9FC3C0F661A60C1C649B4DE6011901A71B";
NSString * const clientSecret = @"33E6F10C74F2CA1D8154A5524F4ACDDE00B76F456F2CA2AC9533BAF809832CB729D950A512F9A12EBE56ABABDA7293F5B30F2BED1814915A2204990468EBC170";

static NSString *const kMyNotificationToken = @"org.mlayer.token-notification";

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    lblAccount.text = @"";
    lblBalance.text = @"";
    lblToken.text = @"";
    _accessToken = @"";
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(tokenValueChanged:)name:kMyNotificationToken object:nil];

    [self setAccessToken:[self restoreToken]];
}

- (void)viewDidUnload
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
    [self setBtn:nil];
    [self setBtnGetToken:nil];
    [self setLblAccount:nil];
    [self setLblBalance:nil];
    [self setLblToken:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

#pragma mark --
#pragma mark accessToken notification

- (void)tokenValueChanged:(NSNotification *)notification {
    if ([[notification name] isEqualToString:kMyNotificationToken]) {
        lblToken.text = _accessToken;
        if (_accessToken) {
            [self setYmApi: [[MLYandexMoneyAPI alloc] initWithToken:[self accessToken]]];
        } else {
            [self setYmApi:nil];
        }
    }
}

- (void)setAccessToken:(NSString *)accessToken {
     _accessToken = accessToken;
    
    [[NSNotificationCenter defaultCenter] postNotificationName:kMyNotificationToken object:accessToken];
}

#pragma mark --
#pragma mark OAuth2

- (GTMOAuth2Authentication *)myCustomAuth {

    NSURL *tokenURL = [NSURL URLWithString:@"https://sp-money.yandex.ru/oauth/token"];
    
    // We'll make up an arbitrary redirectURI.  The controller will watch for
    // the server to redirect the web view to this URI, but this URI will not be
    // loaded, so it need not be for any actual web page.
    NSString *redirectURI = @"mdv://localhost/redirected";
    
    GTMOAuth2Authentication *auth;
    auth = [GTMOAuth2Authentication authenticationWithServiceProvider:@"Custom Service"
                                                             tokenURL:tokenURL
                                                          redirectURI:redirectURI
                                                             clientID:clientId
                                                         clientSecret:clientSecret];
    return auth;
}

- (void)signInToCustomService {
    [self signOut];
    
    GTMOAuth2Authentication *auth = [self myCustomAuth];
    
    // Specify the appropriate scope string, if any, according to the service's API documentation
    auth.scope = @"account-info payment.to-pattern(\"337\").limit(30,1000) money-source(\"wallet\",\"card\")";
    
    NSURL *authURL = [NSURL URLWithString:@"https://m.sp-money.yandex.ru/oauth/authorize"];
    
    // Display the authentication view
    GTMOAuth2ViewControllerTouch *viewController;
    viewController = [[GTMOAuth2ViewControllerTouch alloc] initWithAuthentication:auth
                                                                  authorizationURL:authURL
                                                                  keychainItemName:@"mdv"
                                                                          delegate:self
                                                                  finishedSelector:@selector(viewController:finishedWithAuth:error:)];
    
    // Now push our sign-in view
    [[self navigationController] pushViewController:viewController animated:YES];
}

- (void)signOut {
    
}

- (void)viewController:(GTMOAuth2ViewControllerTouch *)viewController
      finishedWithAuth:(GTMOAuth2Authentication *)auth
                 error:(NSError *)error {
    if (error != nil) {
        NSLog(@"OAuth2 failed");
    } else {
        NSLog(@"OAuth2 succeed");
        NSLog(@"access token: %@", [auth accessToken]);
        
        [self storeToken:[auth accessToken]];
        [self setAccessToken:[auth accessToken]];
    }
}

#pragma mark --
#pragma mark button actions

- (IBAction)btnPayForMegafonTapped:(id)sender {
    NSLog(@"btnPayForMegafonTapped");

    NSDictionary *params = [NSDictionary dictionaryWithObjectsAndKeys:
                            @"337", @"pattern_id",
                            @"921", @"PROPERTY1",
                            @"3020052", @"PROPERTY2",
                            @"1.00", @"sum",
                            nil];
    
    if ([self accessToken] && ymApi) {
        [ymApi requestPaymentWithParams:params success:^(MLYMRequestPaymentResponse *response) {
            NSLog(@"request-payment request is %@, request_id = %@, error = %@", [response status], [response requestId], [response error]);
            
            if ([[response status] isEqualToString:@"success"]) {
                NSMutableDictionary *params  = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                           [response requestId], @"request_id",
                           @"card", @"money_source",
                           @"678", @"csc",
                           nil];
                [ymApi processPaymentWithParams:params success:^(MLYMProcessPaymentResponse *response) {
                    NSLog(@"process-payment request is %@, payment_id = %@, error = %@", [response status], [response paymentId], [response error]);
                } fail:^(NSError *error) {
                    NSLog(@"reuest-payment request failed: %@", [error description]);
                }];
            }
            
        } fail:^(NSError *error) {
            NSLog(@"reuest-payment request failed: %@", [error description]);
        }];
    }
}

- (IBAction)btnGetTokenTapped:(id)sender {
    NSLog(@"btnGetTokenTapped");
    [self signInToCustomService];
}

- (IBAction)btnUpdateBalanceTapped:(id)sender {
    NSLog(@"toAppBtnTapped");
    if ([self accessToken] && ymApi) {
        [ymApi accountInfo:^(MLYMAccountInfoResponse *response) {
            NSLog(@"account-info request is ok");
            lblAccount.text = [response account];
            lblBalance.text = [[response balance] stringByAppendingString:@" р."];
        } fail:^(NSError *error) {
            NSLog(@"account-info request failed: %@", [error description]);
        }];
    }
}

- (IBAction)btnExitTapped:(id)sender {
    [self setAccessToken:nil];
    [self storeToken:nil];
    lblAccount.text = @"";
    lblBalance.text = @"";
    lblToken.text = @"";
    
}

- (IBAction)btnShowMoreTapped:(id)sender {
    MLMobileController *mobilePaymentController = [[MLMobileController alloc] initWithNibName:@"MLMobileController" bundle:nil];
    
    [self.navigationController pushViewController:mobilePaymentController animated:YES];
}


#pragma mark --
#pragma mark store/restore token

- (void)storeToken:(NSString *)token {
    
    NSString *path = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
    path = [path stringByAppendingPathComponent:@"settings.plist"];
    
    BOOL fexists = [[NSFileManager defaultManager] fileExistsAtPath:path];
    if (fexists) {
        NSLog(@"file exists");
        NSMutableDictionary *dict = [[NSMutableDictionary alloc] initWithContentsOfFile:path];
        [dict setValue:token forKey:@"access_token"];
        if ([dict writeToFile:path atomically:YES]) {
            NSLog(@"file written to %@", path);
        } else {
            NSLog(@"file write fails");
        }
        
    } else {
        NSLog(@"file not exists");
        NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
        [dict setValue:token forKey:@"access_token"];
        if ([dict writeToFile:path atomically:YES]) {
            NSLog(@"file written to %@", path);
        } else {
            NSLog(@"file write fails");
        }
    }
    
    //    [NSDictionary alloc] initWithContentsOfFile:path
}

- (NSString *)restoreToken {
    NSString *path = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/settings.plist"] ;
    NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile:path];
    
    NSString *token = [dict valueForKey:@"access_token"];
    if (token) {
        [self setAccessToken:token];
    }
    
    return token;
}

@end
