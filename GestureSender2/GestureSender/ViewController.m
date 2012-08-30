//
//  ViewController.m
//  GestureSender
//
//  Created by Дмитрий Мельников on 29.08.12.
//  Copyright (c) 2012 Дмитрий Мельников. All rights reserved.
//

#import "ViewController.h"
#import "MyView.h"

@interface ViewController () <UITextFieldDelegate>
@property (retain, nonatomic) IBOutlet MyView *myView;
@property (retain, nonatomic) IBOutlet UITextField *myTextField;
@property (retain, nonatomic) IBOutlet UILabel *myLabel;

@end

@implementation ViewController
@synthesize myView;
@synthesize myTextField;
@synthesize myLabel;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    UIPinchGestureRecognizer *pinchRecog = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinchAction:)];
    [self.myView addGestureRecognizer:pinchRecog];
    [pinchRecog release];
    
//    UITextField *textField = [UITextField alloc] initWithFrame:CGRectMake(0.0f, -50.0f, CGRectGetWidth(self.view.bounds, ), 40.0f);
//    [self.view addSubview:textField];
//    [textField becomeFirstResponder];
    
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    self.myLabel.text = textField.text;
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
//    [self.textField becomeFirstResponder];
    [self becomeFirstResponder];
}

- (BOOL)canBecomeFirstResponder {
    return YES;
}

-(void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    static int numberOfTimes = 0;
    
    if (motion == UIEventSubtypeMotionShake) {
        self.view.backgroundColor = (numberOfTimes & 1) ? [UIColor redColor] : [UIColor blueColor];
        
        numberOfTimes++;
    }
}

- (void)viewDidUnload
{
    [self setMyView:nil];
    [self setMyTextField:nil];
    [self setMyLabel:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)tapAction:(UITapGestureRecognizer *)sender {
    
    if (sender.state == UIGestureRecognizerStateRecognized) {
        [self.myView setRandomColor];
    }

}

- (IBAction)panAction:(UIPanGestureRecognizer *)sender {
    
    if (sender.state == UIGestureRecognizerStateChanged) {
        CGPoint currentLocation = [sender translationInView:self.myView.superview];
    
        self.myView.transform = CGAffineTransformMakeTranslation(currentLocation.x, currentLocation.y);
    } else if (sender.state == UIGestureRecognizerStateEnded) {
        CGPoint currentLocation = [sender translationInView:self.myView.superview];
        self.myView.transform = CGAffineTransformIdentity;
        
        self.myView.center = CGPointMake(self.myView.center.x + currentLocation.x, self.myView.center.y + currentLocation.y);
    }
}

- (void)pinchAction:(UIPinchGestureRecognizer *)sender {
    
    if (sender.state == UIGestureRecognizerStateBegan) {
        CGFloat scale = sender.scale;
        self.myView.transform = CGAffineTransformMakeScale(scale, scale);
    } else if (sender.state == UIGestureRecognizerStateEnded) {
        CGFloat scale = sender.scale;
        CGPoint center = sender.view.center;
        CGRect newFrame = CGRectMake(0.0f, 0.0f, sender.view.bounds.size.width * scale, sender.view.bounds.size.height * scale);
        self.myView.transform = CGAffineTransformIdentity;
        self.myView.frame = newFrame;
        self.myView.center = center;
    } else if (sender.state == UIGestureRecognizerStateFailed || sender.state == UIGestureRecognizerStateCancelled) {
        self.myView.transform = CGAffineTransformIdentity;
    }
    
}

- (void)dealloc {
    [myView release];
    [myTextField release];
    [myLabel release];
    [super dealloc];
}
@end
