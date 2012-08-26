//
//  ViewController.m
//  FileSystemSample
//
//  Created by Дмитрий Мельников on 22.08.12.
//  Copyright (c) 2012 Дмитрий Мельников. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (strong, nonatomic) IBOutlet UIButton *btn;

@end

@implementation ViewController
@synthesize btn;

- (IBAction)btnTapped:(id)sender {
    
    NSURL *fileURL = [[NSBundle mainBundle] URLForResource:@"ourPlist" withExtension:@"plist"];
    NSURL *destinationURL =  [[[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] objectAtIndex:0] URLByAppendingPathComponent:@"ourPlist" isDirectory:NO];

    NSError *error = nil;
    
//    [NSFileManager defaultManager] re
    
//    [[NSFileManager defaultManager] copyItemAtURL:fileURL toURL:destinationURL error:&error];
    
    if ([[NSFileManager defaultManager] copyItemAtURL:fileURL toURL:destinationURL error:&error]) {
        NSDictionary* dict = [NSDictionary dictionaryWithContentsOfURL:destinationURL];
        NSLog(@"Dict : %@", dict);
    }
    

}

- (IBAction)btnPressed:(id)sender {
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [self setBtn:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
