//
//  MLViewController.h
//  test01
//
//  Created by Дмитрий Мельников on 12.08.12.
//  Copyright (c) 2012 Дмитрий Мельников. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MLViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIButton *btnOpenEditController;

- (IBAction)onBtnEditControlsClick:(id)sender;

@end
