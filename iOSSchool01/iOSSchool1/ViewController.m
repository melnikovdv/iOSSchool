//
//  ViewController.m
//  iOSSchool1
//
//  Created by Дмитрий Мельников on 01.08.12.
//  Copyright (c) 2012 Дмитрий Мельников. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (retain, nonatomic) IBOutlet UILabel *myButtonLabel;
@property (retain, nonatomic) IBOutlet UILabel *myLabel;

@end

@implementation ViewController
@synthesize myButtonLabel;
@synthesize myLabel;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [self setMyLabel:nil];
    [self setMyButtonLabel:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}
- (IBAction)onButtonClick:(id)sender {
    myLabel.text = @"Hello1";
}

- (IBAction)OnMyButton2Click:(id)sender {
    myButtonLabel.text = @"Hello2";
}

- (void)dealloc {
    [myLabel release];
    [myButtonLabel release];
    [super dealloc];
}
@end
