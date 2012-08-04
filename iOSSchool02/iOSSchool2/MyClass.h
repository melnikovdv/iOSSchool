//
//  MyClass.h
//  iOSSchool2
//
//  Created by Дмитрий Мельников on 01.08.12.
//  Copyright (c) 2012 Дмитрий Мельников. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyClass : NSObject {
    @private
    float _myField;
}

@property(nonatomic, copy) NSString *myProperty;

- (void)myMethodWithArg:(NSInteger) intArh andStringArg:(NSString *)stringArg;
+ (void)myMethodWithArg2:(NSInteger) intArh andStringArg2:(NSString *)stringArg;
- (void)myMethodWithoutArg;

@end
