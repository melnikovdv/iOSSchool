//
//  MLViewController.m
//  PeriodicalPayments
//
//  Created by Дмитрий Мельников on 26.08.12.
//  Copyright (c) 2012 Дмитрий Мельников. All rights reserved.
//

#import "MLViewController.h"
#import "AFJSONRequestOperation.h"

static NSString * const clientId = @"70CC427E9E80B2984B3BF49738F68A9FC3C0F661A60C1C649B4DE6011901A71B";
static NSString * const clientSecret = @"33E6F10C74F2CA1D8154A5524F4ACDDE00B76F456F2CA2AC9533BAF809832CB729D950A512F9A12EBE56ABABDA7293F5B30F2BED1814915A2204990468EBC170";

@interface MLViewController ()

@end

@implementation MLViewController
@synthesize btn;
@synthesize btnGetToken;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [self setBtn:nil];
    [self setBtnGetToken:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)btnGetTokenTapped:(id)sender {
    
    
}

- (IBAction)toAppBtnTapped:(id)sender {
    
//    self.view = 
}
@end
