//
//  SCMyClass.m
//  FileSample
//
//  Created by Alena Boyarkina on 8/22/12.
//  Copyright (c) 2012 elegion. All rights reserved.
//

#import "SCMyClass.h"
#import <objc/objc-runtime.h>

@implementation SCMyClass

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [self init];

    self.myString = [aDecoder decodeObjectForKey:@"MyString"];
    self.myNumber = [aDecoder decodeIntegerForKey:@"MyNumber"];
    self.myBoolean = [aDecoder decodeBoolForKey:@"MyBoolean"];
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.myString forKey:@"MyString"];
    [aCoder encodeInteger:self.myNumber forKey:@"MyNumber"];
    [aCoder encodeBool:self.myBoolean forKey:@"MyBoolean"];
}

@end
