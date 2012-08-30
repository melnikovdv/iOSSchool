//
//  MLViewController.h
//  PeriodicalPayments
//
//  Created by Дмитрий Мельников on 26.08.12.
//  Copyright (c) 2012 Дмитрий Мельников. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MLViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIButton *btn;
@property (strong, nonatomic) IBOutlet UIButton *btnGetToken;

- (IBAction)btnGetTokenTapped:(id)sender;

- (IBAction)toAppBtnTapped:(id)sender;


@end
