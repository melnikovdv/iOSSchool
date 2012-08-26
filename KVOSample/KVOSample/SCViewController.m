//
//  SCViewController.m
//  KVOSample
//
//  Created by Alena Boyarkina on 8/18/12.
//  Copyright (c) 2012 elegion. All rights reserved.
//

#import "SCViewController.h"

@interface SCViewController ()

@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UISlider *slider;


// Model
@property (nonatomic, assign) NSInteger labelValue;



@property (weak, nonatomic) IBOutlet UISwitch *theSwitch;

@end

@implementation SCViewController
@synthesize theSwitch;
@synthesize label;
@synthesize slider;

static NSString *const kMyNotificationName = @"com.e-legion.Sample.MyNotification";

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.labelValue = 5;

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(labelValueChanged:) name:kMyNotificationName object:nil];
    
//    [self addObserver:self forKeyPath:NSStringFromSelector(@selector(labelValue)) options:NSKeyValueObservingOptionNew context:nil];
}

- (void)setLabelValue:(NSInteger)labelValue
{
    _labelValue = labelValue;
    
    [[NSNotificationCenter defaultCenter] postNotificationName:kMyNotificationName object:@(self.labelValue)];
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)labelValueChanged:(NSNotification *)notification
{
    if ([[notification name] isEqualToString:kMyNotificationName]) {
        NSInteger newValue = [[notification object] integerValue];
        label.text = [NSString stringWithFormat:@"%d", newValue];
        if (slider.value != (float) newValue) {
            slider.value = newValue;
        }
        if (newValue <= 3) {
            theSwitch.on = NO;
        } else if (newValue >= 7) {
            theSwitch.on = YES;
        }
    }
}

/*
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if ([keyPath isEqualToString:NSStringFromSelector(@selector(labelValue))]) {
        if ([[change objectForKey:NSKeyValueChangeKindKey] integerValue] == NSKeyValueChangeSetting) {
            NSInteger newValue = [[change objectForKey:NSKeyValueChangeNewKey] integerValue];
            label.text = [NSString stringWithFormat:@"%d", newValue];
            if (slider.value != (float) newValue) {
                slider.value = newValue;
            }
            if (newValue <= 3) {
                theSwitch.on = NO;
            } else if (newValue >= 7) {
                theSwitch.on = YES;
            }
        }
    }
}

*/ 
 
- (void)viewDidUnload
{
//    [self removeObserver:self forKeyPath:NSStringFromSelector(@selector(labelValue)) context:nil];
    [self setLabel:nil];
    [self setSlider:nil];
    [self setTheSwitch:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}


- (IBAction)plusButton
{
    self.labelValue++;
}

- (IBAction)minusButton
{
    
    self.labelValue--;
}

- (IBAction)sliderChanged
{
    self.labelValue = (int) slider.value;
}

- (IBAction)switchChanged
{
    if (theSwitch.on) {
        self.labelValue = 7;
    } else {
        self.labelValue = 3;
    }
}

@end
