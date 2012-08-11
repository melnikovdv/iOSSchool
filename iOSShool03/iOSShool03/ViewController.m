//
//  ViewController.m
//  iOSShool03
//
//  Created by Дмитрий Мельников on 08.08.12.
//  Copyright (c) 2012 Дмитрий Мельников. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UIButton *btn;
@property (strong, nonatomic) IBOutlet UILabel *lbl;
- (IBAction)btnNav:(id)sender;

@end

@implementation ViewController
@synthesize btn = _btn;
@synthesize lbl;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCompose target:self action:@selector(barButtonItemTap)];
//    _btn.contentStretch =
    [_btn setBackgroundImage:[UIImage imageNamed:@"btn_white"] forState:UIControlStateNormal];
//    stretchableImageWithLeftCapWidth:(NSInteger) topCapHeight:(NSInteger)
}

- (void)barButtonItemTap {
    NSLog(@"barButtonItemTap");
}

- (void)viewDidUnload
{
    [self setBtn:nil];
    [self setLbl:nil];
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

- (IBAction)btnNav:(id)sender {
    UIViewController *newCtrl = [[UIViewController alloc] init];
//    [self.navigationController pushViewController:newCtrl animated:YES];
    newCtrl.title = @"Title test";
    
//    UIViewController * myController = [[ViewController alloc] initWithNibName:@"ViewTable" bundle:nil];
//    [self.navigationController pushViewController:myController. animated:YES];
    
    [UIView animateWithDuration:3 animations:^{
//        lbl.backgroundColor = [UIColor redColor];
        lbl.alpha = 0.0;
    } completion:^(BOOL finiished){
        NSLog(@"completions");
    }];
}
@end

// comment 1