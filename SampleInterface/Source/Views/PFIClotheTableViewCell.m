//
//  PFIClotheTableViewCell.m
//  SampleInterface
//
//  Created by Doan The Hien on 11/24/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "PFIClotheTableViewCell.h"

@implementation PFIClotheTableViewCell

@synthesize icon;
@synthesize titleLabel;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier elements:(NSDictionary *) dataItem
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        ///create icon
        icon = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 70, 92)];
        [icon setContentMode: UIViewContentModeCenter];
        [icon setImage:[UIImage imageNamed:[dataItem objectForKey:@"image"]]];
        [icon setHighlightedImage:[UIImage imageNamed:[dataItem objectForKey:@"hightlight"]]];
        
        ///create label
        titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(135, 33, 50, 26)];
        titleLabel.text = [dataItem objectForKey:@"title"];
        [titleLabel setTextAlignment: UITextAlignmentCenter];
        [titleLabel setFont:[UIFont systemFontOfSize:16]];
        [titleLabel setLineBreakMode: UILineBreakModeWordWrap];
        [titleLabel setNumberOfLines:0];
        [titleLabel setTextColor:[UIColor colorWithRed:92.0 / 255.0 green:92.0 / 255.0 blue:92.0 / 255.0 alpha:1.0]];
        [titleLabel sizeToFit];
        [titleLabel setHighlighted:NO];
        [titleLabel setHighlightedTextColor:[UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0]];
        [titleLabel setBackgroundColor:[UIColor clearColor]];
        
        ///add subview
        [self addSubview: icon];
        [self addSubview: titleLabel];
        
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
