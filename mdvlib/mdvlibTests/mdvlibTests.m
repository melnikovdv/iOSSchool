//
//  mdvlibTests.m
//  mdvlibTests
//
//  Created by Дмитрий Мельников on 05.08.12.
//  Copyright (c) 2012 Дмитрий Мельников. All rights reserved.
//

#import "mdvlibTests.h"
#import <Foundation/Foundation.h>
#import "NSString+MdvAdditions.h"

@implementation mdvlibTests

NSString *strHttp = @"http://ya.ru";
NSString *strSimple = @"just string";

- (void)setUp
{
    [super setUp];
    // Set-up code here.
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

- (void) testIsUrl
{
    BOOL isUrl = [strHttp isUrl];
    STAssertTrue(isUrl, [NSString stringWithFormat:@"%@%@", strHttp, @" this must be an url"]);
//    error: testIsUrl (mdvlibTests) failed: -[__NSCFConstantString isUrl]: unrecognized selector sent to instance 0x187b350
// build target linker flag -ObjC
    isUrl = [strSimple isUrl];
    STAssertFalse(isUrl, [NSString stringWithFormat:@"%@%@", strSimple, @" this must be a simple string"]);
}

- (void) testRevertString
{
    STAssertTrue([[strSimple reverseString] isEqualToString:@"gnirts tsuj"], @"expect correctly reverted string");
}
    
@end

