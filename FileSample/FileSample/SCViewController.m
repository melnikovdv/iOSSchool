//
//  SCViewController.m
//  FileSample
//
//  Created by Alena Boyarkina on 8/22/12.
//  Copyright (c) 2012 elegion. All rights reserved.
//

#import "SCViewController.h"
#import "SCMyClass.h"

@interface SCViewController ()

@property(nonatomic, weak) IBOutlet UIButton *button;

@end

@implementation SCViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)buttonTapped
{
    NSURL *fileURL = [[NSBundle mainBundle] URLForResource:@"ourPlist" withExtension:@"plist"];
    NSURL *documentsURL = [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] objectAtIndex:0];
    NSURL *destinationURL = [documentsURL URLByAppendingPathComponent:@"ourPlist.plist" isDirectory:NO];
    
    NSError *error = nil;
    
    [[NSFileManager defaultManager] removeItemAtURL:destinationURL error:&error];
    
    if ([[NSFileManager defaultManager] copyItemAtURL:fileURL toURL:destinationURL error:&error]) {
        
        NSDictionary *dict = [NSDictionary dictionaryWithContentsOfURL:destinationURL];
        
        SCMyClass *myClass = [[SCMyClass alloc] init];
        myClass.myString = [dict objectForKey:@"MyString"];
        myClass.myNumber = [[dict objectForKey:@"MyNumber"] integerValue];
        myClass.myBoolean = [[dict objectForKey:@"MyBoolean"] boolValue];
        
        NSMutableData *encodedData = [NSMutableData data];
        NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:encodedData];
        [archiver setOutputFormat:NSPropertyListXMLFormat_v1_0];
        [archiver encodeRootObject:myClass];
        [archiver finishEncoding];
        
        if (![encodedData writeToURL:[documentsURL URLByAppendingPathComponent:@"MyNewFile.archive"] atomically:YES]) {
            NSLog(@"fAilure");
        }
    }
}

@end
