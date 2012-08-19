//
//  MLCustomView.m
//  ViewSample
//
//  Created by Дмитрий Мельников on 15.08.12.
//  Copyright (c) 2012 Дмитрий Мельников. All rights reserved.
//

#import "MLCustomView.h"
#import <QuartzCore/QuartzCore.h>

@implementation MLCustomView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

- (void)layoutSubviews {
    CAGradientLayer *layer = [CAGradientLayer layer];
    layer.cornerRadius = 10.0f;
    layer.frame = self.bounds;
    layer.colors = [[NSArray alloc] initWithObjects:(id)[UIColor blueColor].CGColor, (id)[UIColor redColor].CGColor, nil];
//    layer.startPoint = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMinY(self.bounds));
//    layer.endPoint = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMaxY(self.bounds));
    layer.startPoint = CGPointMake(0.5, 0.0);
    layer.endPoint = CGPointMake(0.5, 1.0);
    
    [self.layer insertSublayer:layer atIndex:0];
    
}

#if FALSE
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
//    CGRect aRect = { .origin = {.x = 10, .y = 20}, .size = {100, 100}}; так не надо
    
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:10];
    [[UIColor redColor] setStroke]; // цвет рисования по умолчанию
    
    [path stroke];
    [path addClip];
    
    CGColorSpaceRef colorSpace = NULL;
    CGFloat locations[] = { 0.0f, 1.0f };

    CFArrayRef colors = (__bridge_retained CFArrayRef) [[NSArray alloc] initWithObjects:(id)[UIColor blueColor].CGColor, (id)[UIColor redColor].CGColor, nil] ;
    
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace = CGColorSpaceCreateDeviceRGB(), colors, locations);
    
    CGContextDrawLinearGradient(context, gradient, CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMinY(self.bounds)), CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMaxY(self.bounds)), 0);
    
    CGGradientRelease(gradient);
    CGColorSpaceRelease(colorSpace);
    CFRelease(colors);
    CGContextRestoreGState(context);
}

#endif

@end
