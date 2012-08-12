//
//  MyCustomCell.m
//  iOSShool03
//
//  Created by Дмитрий Мельников on 11.08.12.
//  Copyright (c) 2012 Дмитрий Мельников. All rights reserved.
//

#import "MyCustomCell.h"

@implementation MyCustomCell
@synthesize label;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
