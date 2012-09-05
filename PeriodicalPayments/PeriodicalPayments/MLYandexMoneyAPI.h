//
//  MLYandexMoneyAPI.h
//  PeriodicalPayments
//
//  Created by Дмитрий Мельников on 04.09.12.
//  Copyright (c) 2012 –î–º–∏—Ç—Ä–∏–π –ú–µ–ª—å–Ω–∏–∫–æ–≤. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MLYMAccountInfoResponse : NSObject

@property(readonly, nonatomic) NSString *account;
@property(readonly, nonatomic) NSString *balance;

- (MLYMAccountInfoResponse *)initWithJSON: (id)JSON;

@end

@interface MLYMRequestPaymentResponse : NSObject

@property(readonly, nonatomic) NSString *status;
@property(readonly, nonatomic) NSString *error;
@property(readonly, nonatomic) NSString *requestId;
@property(readonly, nonatomic) NSDictionary *moneySource;

- (MLYMRequestPaymentResponse *)initWithJSON: (id)JSON;

@end

@interface MLYMProcessPaymentResponse : NSObject

@property(readonly, nonatomic) NSString *status;
@property(readonly, nonatomic) NSString *error;
@property(readonly, nonatomic) NSString *paymentId;

- (MLYMProcessPaymentResponse *)initWithJSON: (id)JSON;

@end

@interface MLYandexMoneyAPI : NSObject

- (MLYandexMoneyAPI *)initWithToken:(NSString *)token;

- (void)accountInfo:(void (^)(MLYMAccountInfoResponse *response)) success fail:(void (^)(NSError *error)) fail;

- (void)requestPaymentWithParams:(NSDictionary *)params success:(void (^)(MLYMRequestPaymentResponse *response)) success fail:(void (^)(NSError *error)) fail;

- (void)processPaymentWithParams:(NSDictionary *)params success:(void (^)(MLYMProcessPaymentResponse *response)) success fail:(void (^)(NSError *error)) fail;

@end
