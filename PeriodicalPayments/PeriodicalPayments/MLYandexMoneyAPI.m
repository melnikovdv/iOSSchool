//
//  MLYandexMoneyAPI.m
//  PeriodicalPayments
//
//  Created by Дмитрий Мельников on 04.09.12.
//  Copyright (c) 2012 –î–º–∏—Ç—Ä–∏–π –ú–µ–ª—å–Ω–∏–∫–æ–≤. All rights reserved.
//

#import "MLYandexMoneyAPI.h"
#import "MLHTTPClient.h"
#import "AFJSONRequestOperation.h"

typedef enum {
    MLYMAccountInfo    = 0,
    MLYMRequestPayment = 1,
    MLYMProcessPayment = 2
} MLYMRequestType;

#pragma mark --
#pragma mark Responses

@implementation MLYMAccountInfoResponse

@synthesize account;
@synthesize balance;

- (MLYMAccountInfoResponse *)initWithJSON:(id)JSON {
    account = [JSON valueForKey:@"account"];
    balance = [[JSON valueForKey:@"balance"] stringValue];
    return self;
}

@end

@implementation MLYMRequestPaymentResponse

@synthesize status;
@synthesize error;
@synthesize requestId;
@synthesize moneySource;

- (MLYMRequestPaymentResponse *)initWithJSON:(id)JSON {
    status = [JSON valueForKey:@"status"];
    error = [JSON valueForKey:@"error"];
    requestId = [JSON valueForKey:@"request_id"];
    moneySource = [JSON valueForKey:@"money_source"];

    return self;
}

@end

@implementation MLYMProcessPaymentResponse

@synthesize status;
@synthesize error;
@synthesize paymentId;
        
- (MLYMProcessPaymentResponse *)initWithJSON:(id)JSON {
    status = [JSON valueForKey:@"status"];
    error = [JSON valueForKey:@"error"];
    paymentId = [JSON valueForKey:@"payment_id"];
    
    return self;
}

@end

@interface MLYandexMoneyAPI ()

@property(strong, nonatomic) MLHTTPClient *client;

@end

#pragma mark --
#pragma mark Main object

@implementation MLYandexMoneyAPI {
    MLYMRequestType _requestType;
    
}

@synthesize client;

- (MLYandexMoneyAPI *)initWithToken:(NSString *)token {
    client = [MLHTTPClient sharedClientWithAccessToken:token];
    [client setAuthorizationBearerWithToken:token];
    
    return self;
}

#pragma mark --
#pragma mark public methods

- (void)accountInfo:(void (^)(MLYMAccountInfoResponse *response))success fail:(void (^)(NSError *error)) fail {
    
    NSMutableURLRequest *request = [client requestWithMethod:@"POST" path:@"account-info" parameters:nil];
    
    AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
        MLYMAccountInfoResponse *resp = [[MLYMAccountInfoResponse alloc] initWithJSON:JSON];
        success(resp);
    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON) {
        fail(error);
    }];
    
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    [queue addOperation:operation];
}

- (void)requestPaymentWithParams:(NSDictionary *)params success:(void (^)(MLYMRequestPaymentResponse *response)) success fail:(void (^)(NSError *error)) fail {
    
    NSMutableURLRequest *request = [client requestWithMethod:@"POST" path:@"request-payment" parameters:params];
    
    AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
        MLYMRequestPaymentResponse *resp = [[MLYMRequestPaymentResponse alloc] initWithJSON:JSON];
        success(resp);
    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON) {
        fail(error);
    }];
    
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    [queue addOperation:operation];
}

- (void)processPaymentWithParams:(NSDictionary *)params success:(void (^)(MLYMProcessPaymentResponse *response)) success fail:(void (^)(NSError *error)) fail {
    
    NSMutableURLRequest *request = [client requestWithMethod:@"POST" path:@"process-payment" parameters:params];
    
    AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
        MLYMProcessPaymentResponse *resp = [[MLYMProcessPaymentResponse alloc] initWithJSON:JSON];
        success(resp);
    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON) {
        fail(error);
    }];
    
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    [queue addOperation:operation];
}

@end
