//
//  MLHTTPClient.h
//  PeriodicalPayments
//
//  Created by Дмитрий Мельников on 03.09.12.
//  Copyright (c) 2012 –î–º–∏—Ç—Ä–∏–π –ú–µ–ª—å–Ω–∏–∫–æ–≤. All rights reserved.
//

#import "AFHTTPClient.h"

@interface MLHTTPClient : AFHTTPClient

+ (MLHTTPClient *)sharedClientWithAccessToken:(NSString *) token;
- (void)setAuthorizationBearerWithToken:(NSString *) token;
@end
