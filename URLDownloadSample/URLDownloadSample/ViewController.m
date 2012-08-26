//
//  ViewController.m
//  URLDownloadSample
//
//  Created by Дмитрий Мельников on 22.08.12.
//  Copyright (c) 2012 Дмитрий Мельников. All rights reserved.
//

#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>


@interface ViewController () <NSURLConnectionDelegate, NSURLConnectionDataDelegate>
@property (strong, nonatomic) IBOutlet UIImageView *image;
@property (nonatomic, strong) NSMutableData *networkData;
@property(nonatomic, strong) UIView *activity;
@end

@implementation ViewController
@synthesize image;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [self setImage:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}


-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [self startActivityIndication];
    NSURL *url = [NSURL URLWithString:@"http://i.imm.io/BzH7.jpeg"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    
    NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self startImmediately:NO];
    [connection start];
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
    if ((httpResponse.statusCode / 100) == 2) {
        NSLog(@"Success");
    } else {
        NSLog(@"Non-200 Code");
    }
    self.networkData = [NSMutableData data];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    [self.networkData appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    UIImage *img = [UIImage imageWithData:self.networkData];
    self.image.image = img;
    
    self.networkData = nil;
    [self stopActivityIndication];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    NSLog(@"%@", [error localizedDescription]);
    self.networkData = nil;
}

- (void)startActivityIndication {
    [self stopActivityIndication];
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 120.0f, 120.0f)];
    CGRect appFrame = [UIScreen mainScreen].applicationFrame;
    view.layer.cornerRadius = 8.0f;
    view.center = CGPointMake(CGRectGetMidX(appFrame), CGRectGetMidY(appFrame));
    view.backgroundColor = [UIColor colorWithWhite:0.0f alpha:0.8f];
    view.exclusiveTouch = YES;
    
    UIActivityIndicatorView *indicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    indicator.frame = CGRectMake(0.0f, 0.0f, 40.0f, 40.0f);
    indicator.center = CGPointMake(CGRectGetMidX(view.bounds), CGRectGetMidY(view.bounds));
    indicator.hidesWhenStopped = YES;
    [indicator startAnimating];
    
    [view addSubview:indicator];
    [self.view addSubview:view];
    
    
    self.activity = view;
    self.view.userInteractionEnabled = NO;
}

- (void)stopActivityIndication {
    [self.activity removeFromSuperview];
    self.activity = nil;
    self.view.userInteractionEnabled = YES;
}

@end
