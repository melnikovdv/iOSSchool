//
//  MyClass.m
//  iOSSchool2
//
//  Created by Дмитрий Мельников on 01.08.12.
//  Copyright (c) 2012 Дмитрий Мельников. All rights reserved.
//

#import "MyClass.h"

@implementation MyClass

@synthesize myProperty = _myProperty;

- (void)myMethodWithArg:(NSInteger) intArh andStringArg:(NSString *)stringArg
{
    [[self class] myMethodWithArg2:10 andStringArg2:@"Hellow"];
    __unused NSString * a = self->_myProperty; // unused директива неиспользуемой переменной
}

+ (void)myMethodWithArg2:(NSInteger) intArh andStringArg2:(NSString *)stringArg
{
    // Do nothing
}

- (void)myMethodWithArg:(NSInteger)a
{
    
}

- (void)myMethodWithoutArg
{
    NSLog(@"%@", self->_myProperty);
    
}

//- (void)setMyProperty:(NSString *)myProperty
//{
//    self->_myField = [myProperty floatValue];
////    self->_myProperty;
//}

//- (NSString *)myProperty
//{
//    return nil;
//}

@end
