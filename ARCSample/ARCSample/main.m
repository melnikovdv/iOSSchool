//
//  main.m
//  ARCSample
//
//  Created by Дмитрий Мельников on 15.08.12.
//  Copyright (c) 2012 Дмитрий Мельников. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "MLAppDelegate.h"

int main(int argc, char *argv[])
{
        NSString __weak *b = nil;
    @autoreleasepool {

//        return UIApplicationMain(argc, argv, nil, NSStringFromClass([MLAppDelegate class]));
//        NSString __strong *b = nil;
//        NSString __weak *b = nil;
        {
//            NSString *c = [[NSString alloc] initWithFormat:@"Sample string: %d", 10];
            NSString *c = [NSString stringWithFormat:@"Sample string: %d", 10];
            b = c;
        }
//        NSLog(@"C: %@", c);
//        NSLog(@"B: %@", b);
    }
    NSLog(@"B: %@", b);
}
