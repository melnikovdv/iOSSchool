//
//  MLAppDelegate.h
//  test01
//
//  Created by Дмитрий Мельников on 12.08.12.
//  Copyright (c) 2012 Дмитрий Мельников. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MLViewController;

@interface MLAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) MLViewController *viewController;

@end
