//
//  NSString+MdvAdditions.h
//  mdvlib
//
//  Created by Дмитрий Мельников on 05.08.12.
//  Copyright (c) 2012 Дмитрий Мельников. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSString+MdvAdditions.h"

@interface NSString (MdvAdditions)

- (BOOL) isUrl;
- (NSString *) reverseString;

@end
