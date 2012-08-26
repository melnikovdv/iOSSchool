//
//  SCMyClass.h
//  FileSample
//
//  Created by Alena Boyarkina on 8/22/12.
//  Copyright (c) 2012 elegion. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SCMyClass : NSObject <NSCoding>

@property(nonatomic, copy) NSString *myString;
@property(nonatomic, assign) BOOL myBoolean;
@property(nonatomic, assign) NSInteger myNumber;

@end
