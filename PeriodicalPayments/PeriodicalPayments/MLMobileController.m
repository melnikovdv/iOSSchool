//
//  MLMobileController.m
//  PeriodicalPayments
//
//  Created by Дмитрий Мельников on 05.09.12.
//  Copyright (c) 2012 –î–º–∏—Ç—Ä–∏–π –ú–µ–ª—å–Ω–∏–∫–æ–≤. All rights reserved.
//

#import "MLMobileController.h"

@interface MLMobileController () <UIPickerViewDelegate, UIPickerViewDataSource>

@property (strong, nonatomic) IBOutlet UIPickerView *pickerView;
@property (strong, nonatomic) IBOutlet UILabel *lblTest;
@property(strong, nonatomic) NSMutableArray *arrayColors;
@property (strong, nonatomic) IBOutlet UITextField *edtPreffix;
@property (strong, nonatomic) IBOutlet UITextField *edtNumber;

@end

@implementation MLMobileController

@synthesize pickerView;
@synthesize lblTest;
@synthesize arrayColors;
@synthesize edtPreffix;
@synthesize edtNumber;

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    arrayColors = [[NSMutableArray alloc] init];
    [arrayColors addObject:@"Мегафон"];
    [arrayColors addObject:@"МТС"];
    [arrayColors addObject:@"Биллайн"];
}

- (void)viewDidUnload
{
    [self setLblTest:nil];
    [self setPickerView:nil];
    [self setEdtPreffix:nil];
    [self setEdtNumber:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark --
#pragma mark picker delegate


- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}


-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return [arrayColors count];
}


- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return [arrayColors objectAtIndex:row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    NSLog(@"Selected Color: %@. Index of selected color: %i", [arrayColors objectAtIndex:row], row);
}


- (IBAction)btnPayTapped:(id)sender {
    
}

@end
