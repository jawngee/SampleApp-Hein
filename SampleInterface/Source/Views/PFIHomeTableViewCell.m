//
//  PFIHomeTableViewCell.m
//  SampleInterface
//
//  Created by Doan The Hien on 11/24/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "PFIHomeTableViewCell.h"
#import "UIImageView+WebCache.h"
@implementation PFIHomeTableViewCell

@synthesize icon;
@synthesize titleLabel;
@synthesize contentLabel;
@synthesize dateLabel;

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier elements:(NSDictionary *) dataItem
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) 
    {
        
        self.frame = CGRectMake(0, 0, 320, 124);
        
        ///add icon
        NSString *imageName;
        imageName = [dataItem objectForKey:@"icon"];
        icon = [[UIImageView alloc] init] ;
        [icon setImageWithURL:[NSURL URLWithString:imageName]];
        icon.frame = CGRectMake(8 , 15 , 133 , 94 ); 
        [self addSubview:icon];
        
        ///add title label
        titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(150 , 15 , 163 , 15 )] ;
        titleLabel.text = [dataItem objectForKey:@"headline"];
        [titleLabel setFont:[UIFont systemFontOfSize:12 ]];
        [titleLabel setLineBreakMode: UILineBreakModeWordWrap];
        [titleLabel setNumberOfLines:0];
        [titleLabel setTextColor:[UIColor colorWithRed:92.0 / 255.0 green:92.0 / 255.0 blue:92.0 / 255.0 alpha:1.0]];
        [titleLabel sizeToFit];
        [titleLabel setHighlighted:NO];
        [titleLabel setHighlightedTextColor:[UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0]];
        [titleLabel setBackgroundColor:[UIColor clearColor]];
        [self addSubview: titleLabel];
        
        ///add content label
        int height = titleLabel.frame.size.height;
        int contentY = titleLabel.frame.origin.y + height;
        contentLabel = [[UILabel alloc] initWithFrame:CGRectMake(150 , contentY, 163 , 15 )]; 
        contentLabel.text = [dataItem objectForKey:@"subheader"];
        [contentLabel setFont:[UIFont systemFontOfSize:12 ]];
        [contentLabel setTextColor:[UIColor colorWithRed:153.0 / 255.0 green:153.0 / 255.0 blue:153.0 / 255.0 alpha:1.0]];
        [contentLabel setLineBreakMode: UILineBreakModeWordWrap];
        [contentLabel setNumberOfLines:0];
        [contentLabel sizeToFit];
        [contentLabel setHighlighted:NO];
        [contentLabel setHighlightedTextColor:[UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0]];
        [contentLabel setBackgroundColor:[UIColor clearColor]];
        [self addSubview: contentLabel];
        
        ////add date label
        dateLabel = [[UILabel alloc] initWithFrame:CGRectMake(173 , 94 , 133 , 15 )];
        dateLabel.text = [dataItem objectForKey:@"bi-line"];
        [dateLabel setFont:[UIFont systemFontOfSize:12 ]];
        [dateLabel setTextColor:[UIColor colorWithRed:153.0 / 255.0 green:153.0 / 255.0 blue:153.0 / 255.0 alpha:1.0]];
        [dateLabel setLineBreakMode: UILineBreakModeWordWrap];
        [dateLabel setNumberOfLines:0];
        [dateLabel sizeToFit];
        [dateLabel setHighlighted:NO];
        [dateLabel setHighlightedTextColor:[UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0]];
        [dateLabel setBackgroundColor:[UIColor clearColor]];
        [self addSubview: dateLabel];
        

    }
    return self;
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
-(void) setElements:(NSDictionary *) dataItem
{
    ///set icon image
    [icon setImageWithURL:[NSURL URLWithString:[dataItem objectForKey:@"icon"]]];    
    ///set titleLabel
    [self.titleLabel setText:[dataItem objectForKey:@"headline"]];
    
    ///set contentLabel
    int height = titleLabel.frame.size.height;
    int contentY = titleLabel.frame.origin.y + height;
    [self.contentLabel setFrame:CGRectMake(150 , contentY, 163 , 15 )];
    [self.contentLabel setText:[dataItem objectForKey:@"subheader"]];
    
    ///set dateLabel
    dateLabel.text = [dataItem objectForKey:@"bi-line"];
}
-(void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void) dealloc
{
    [icon release];
    [titleLabel release];
    [contentLabel release];
    [dateLabel release];
    [super dealloc];
}
@end
