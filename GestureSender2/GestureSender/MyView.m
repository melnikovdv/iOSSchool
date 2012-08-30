//
//  MyView.m
//  GestureSender
//
//  Created by Дмитрий Мельников on 29.08.12.
//  Copyright (c) 2012 Дмитрий Мельников. All rights reserved.
//

#import "MyView.h"

@implementation MyView
//
//- (id)initWithFrame:(CGRect)frame
//{
//    self = [super initWithFrame:frame];
//    if (self) {
//        // Initialization code
//    }
//    return self;
//}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (void)setRandomColor {
    NSInteger red = rand() % 255;
    NSInteger green = rand() % 255;
    NSInteger blue = rand() % 255;
    
    self.backgroundColor = [UIColor colorWithRed:red / 255.0f green:green / 255.0f blue:blue / 255.0f alpha:1.0f];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    if (touch.tapCount == 1) {
        CGPoint currentLocation = [touch locationInView:self.superview];
        CGPoint prevLocation = [touch previousLocationInView:self.superview];
        
        CGFloat deltaX = currentLocation.x - prevLocation.x;
        CGFloat deltaY = currentLocation.y - prevLocation.y;
        
        CGAffineTransform transform = self.transform;
        transform = CGAffineTransformTranslate(transform, deltaX, deltaY);
        self.transform = transform;
    }
}

- (void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
//    self.multipleTouchEnabled = YES; // for multiple touch
    UITouch *touch = [touches anyObject];
    if (touch.tapCount == 2) {
        [self setRandomColor];
    } else {
        if (touch.tapCount == 1) {
            CGPoint currentLocation = [touch locationInView:self.superview];
            CGPoint prevLocation = [touch previousLocationInView:self.superview];
            
            CGFloat deltaX = currentLocation.x - prevLocation.x;
            CGFloat deltaY = currentLocation.y - prevLocation.y;
            
            self.center = CGPointMake(self.center.x + deltaX, self.center.y + deltaY);
        }
    }
}

- (void) touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    if (touch.tapCount == 1) {
        self.transform = CGAffineTransformIdentity;
    }
}

@end
