//
//  NSString+MdvAdditions.m
//  mdvlib
//
//  Created by Дмитрий Мельников on 05.08.12.
//  Copyright (c) 2012 Дмитрий Мельников. All rights reserved.
//

#import "NSString+MdvAdditions.h"

@implementation NSString (MdvAdditions)

- (BOOL) isUrl {
    if ( [self hasPrefix:@"http://"] || [self hasPrefix:@"https://"] )
        return YES;
    else
        return NO;
}

- (NSString *) reverseString {
    NSUInteger len = [self length];
    NSMutableString *revertedSting = [NSMutableString stringWithCapacity:len];
    
    while (len > 0) {
        unichar chr = [self characterAtIndex:--len];
        [revertedSting appendString:[NSString stringWithCharacters:&chr length:1]];
    }
    return revertedSting;
}

@end