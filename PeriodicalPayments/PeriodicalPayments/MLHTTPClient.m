//
//  MLHTTPClient.m
//  PeriodicalPayments
//
//  Created by Дмитрий Мельников on 03.09.12.
//  Copyright (c) 2012 –î–º–∏—Ç—Ä–∏–π –ú–µ–ª—å–Ω–∏–∫–æ–≤. All rights reserved.
//

#import "MLHTTPClient.h"
#import "AFJSONRequestOperation.h"

static NSString * const kMLHTTPClientAPIBaseURLString = @"https://money.yandex.ru/api/";

@interface MLHTTPClient ()

@property(strong, nonatomic) NSString *accessToken;

@end

@implementation MLHTTPClient

@synthesize accessToken;
    
+ (MLHTTPClient *)sharedClientWithAccessToken:(NSString *)token {
    static MLHTTPClient *_sharedClient = nil;

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[MLHTTPClient alloc] initWithBaseURL:[NSURL URLWithString:kMLHTTPClientAPIBaseURLString]];
    });
    
    [_sharedClient setAccessToken:token];
    [_sharedClient setAuthorizationHeaderWithToken:token];
    
    return _sharedClient;
}

- (id)initWithBaseURL:(NSURL *)url {
    self = [super initWithBaseURL:url];
    if (!self) {
        return nil;
    }
    
    [self registerHTTPOperationClass:[AFJSONRequestOperation class]];
    
    // Accept HTTP Header; see http://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.1
	[self setDefaultHeader:@"Accept" value:@"application/json"];
    
    return self;
}

- (void)setAuthorizationBearerWithToken:(NSString *)token {
    [self setDefaultHeader:@"Authorization" value:[NSString stringWithFormat:@"Bearer %@", token]];
}



@end
