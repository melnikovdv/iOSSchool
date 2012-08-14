//
//  MLViewController.m
//  test01
//
//  Created by Дмитрий Мельников on 12.08.12.
//  Copyright (c) 2012 Дмитрий Мельников. All rights reserved.
//

#import "MLViewController.h"
#import "MLEditViewController.h"

@interface MLViewController ()

@end

@implementation MLViewController
@synthesize btnOpenEditController;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (IBAction)onBtnEditControlsClick:(id)sender {

    UIViewController *editViewController = [[MLEditViewController alloc] initWithNibName:@"MLEditViewController" bundle:nil];
    [self.navigationController pushViewController:editViewController animated:YES];
    NSLog(@"pusgViewController");
}

- (void)viewDidUnload
{
    [self setBtnOpenEditController:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
