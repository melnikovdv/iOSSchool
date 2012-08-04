//
//  main.m
//  iOSSchool2
//
//  Created by Дмитрий Мельников on 01.08.12.
//  Copyright (c) 2012 Дмитрий Мельников. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "MyClass.h"

int main(int argc, char *argv[])
{
    MyClass *m = [[ MyClass alloc] init];
    m.myProperty = @"Test";
    [m  myMethodWithoutArg];

    
    
}
