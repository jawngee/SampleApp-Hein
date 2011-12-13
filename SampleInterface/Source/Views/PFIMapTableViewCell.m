//
//  PFIMapTableViewCell.m
//  SampleInterface
//
//  Created by Doan The Hien on 12/6/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "PFIMapTableViewCell.h"

@implementation PFIMapTableViewCell

@synthesize titleLabel;
@synthesize contentLabel;
@synthesize icon;
@synthesize subtitleLabel;

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier elements:(NSDictionary *) dataItem
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        ///add icon image
        icon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[dataItem objectForKey:@"icon"]]] ;
        icon.frame = CGRectMake(8 , 15 , 133 , 94 ); 
        [self addSubview:icon];
        
        ///add title label
        titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(150 , 15 , 156 , 17 )] ;
        titleLabel.text = [dataItem objectForKey:@"title"];
        [titleLabel setFont:[UIFont systemFontOfSize:15 ]];
        [titleLabel setLineBreakMode: UILineBreakModeWordWrap];
        [titleLabel setNumberOfLines:0];
        [titleLabel setTextColor:[UIColor colorWithRed:102.0 / 255.0 green:102.0 / 255.0 blue:102.0 / 255.0 alpha:1.0]];
        [titleLabel sizeToFit];
        [titleLabel setHighlighted:NO];
        [titleLabel setHighlightedTextColor:[UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0]];
        [titleLabel setBackgroundColor:[UIColor clearColor]];
        [self addSubview: titleLabel];
        
        ///add subtitleLabel
        int height = titleLabel.frame.size.height;
        int contentY = titleLabel.frame.origin.y + height;
        subtitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(150 , contentY, 163 , 15 )]; 
        subtitleLabel.text = [dataItem objectForKey:@"subtitle"];
        [subtitleLabel setFont:[UIFont systemFontOfSize:12 ]];
        [subtitleLabel setTextColor:[UIColor colorWithRed:153.0 / 255.0 green:153.0 / 255.0 blue:153.0 / 255.0 alpha:1.0]];
        [subtitleLabel setLineBreakMode: UILineBreakModeWordWrap];
        [subtitleLabel setNumberOfLines:0];
        [subtitleLabel sizeToFit];
        [subtitleLabel setHighlighted:NO];
        [subtitleLabel setHighlightedTextColor:[UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0]];
        [subtitleLabel setBackgroundColor:[UIColor clearColor]];
        [self addSubview: subtitleLabel];
        
        ///add content label
        contentLabel = [[UILabel alloc] initWithFrame:CGRectMake(150 , 85 , 170 , 25 )];
        contentLabel.text = [dataItem objectForKey:@"content"];
        [contentLabel setFont:[UIFont systemFontOfSize:10 ]];
        [contentLabel setTextColor:[UIColor colorWithRed:153.0 / 255.0 green:153.0 / 255.0 blue:153.0 / 255.0 alpha:1.0]];
        [contentLabel setLineBreakMode: UILineBreakModeWordWrap];
        [contentLabel setNumberOfLines:0];
        [contentLabel sizeToFit];
        [contentLabel setHighlighted:NO];
        [contentLabel setHighlightedTextColor:[UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0]];
        [contentLabel setBackgroundColor:[UIColor clearColor]];
        [self addSubview: contentLabel];
        
    }
    return self;
}

-(void) setElements:(NSDictionary *) dataItem
{
    
    ///set icon image
    [self.icon setImage:[UIImage imageNamed:[dataItem objectForKey:@"icon"]]];
    
    ///set titleLabel
    [self.titleLabel setText:[dataItem objectForKey:@"title"]];
    
    ///set subtitle Label
    int height = titleLabel.frame.size.height;
    int contentY = titleLabel.frame.origin.y + height;
    [self.contentLabel setFrame:CGRectMake(150 , contentY, 163 , 15 )];
    [self.contentLabel setText:[dataItem objectForKey:@"subtitle"]];
    
    ///set dateLabel
    contentLabel.text = [dataItem objectForKey:@"content"];
}
-(void) drawRect:(CGRect)rect
{
    ///draw a line between 2 cells
    CGContextRef ctx = UIGraphicsGetCurrentContext(); 
    CGContextSetRGBStrokeColor(ctx, 145.0 / 255.0, 145.0 / 255.0, 145.0 / 255.0, 1.0); ///black color
    CGContextMoveToPoint(ctx, 0, 123);
    CGContextAddLineToPoint( ctx, 319,123);
    CGContextStrokePath(ctx);
}
-(void) dealloc
{
    [icon release];
    [contentLabel release];
    [subtitleLabel release];
    [titleLabel release];
    icon = nil;
    contentLabel = nil;
    subtitleLabel = nil;
    titleLabel = nil;
}
@end
