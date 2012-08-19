//
//  main.m
//  PredicateSample
//
//  Created by Дмитрий Мельников on 18.08.12.
//  Copyright (c) 2012 Дмитрий Мельников. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "MLAppDelegate.h"

int main(int argc, char *argv[])
{
    @autoreleasepool {
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"(SELF CONTAINS[cd] \'aa\') AND NOT (SELF BEGINSWITH[cd] %@)", @"aa"];
        NSArray *strings = @[@"AAbcd", @"BCaadd", @"bbccdd"];
 
        NSArray *filteredArray = [strings filteredArrayUsingPredicate:predicate];
        NSLog(@"%@", filteredArray);
    }
}
