//
//  PFIClotheGridViewDetail.m
//  SampleInterface
//
//  Created by Doan The Hien on 12/19/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.


#import "PFIClotheGridViewDetail.h"
#import "UIImageView+WebCache.h"
#import "UIButton+WebCache.h"

#define  SilverButtonTouched 1
#define  OrangeButtonTouched 2
#define  ThumnailButton1Touched 3
#define  ThumnailButton2Touched 4
#define  ThumnailButton3Touched 5

@implementation PFIClotheGridViewDetail

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        // Initialization code
    }
    return self;
}
-(id)initWithData:(NSDictionary*)item
{
    self = [super init];
    if (self)
    {
        view1Active = TRUE;
        itemData = item;
        
        colors = [itemData objectForKey:@"colors"];
        view1 = [[colors objectAtIndex:0] objectForKey:@"views"];
        view2 = [[colors objectAtIndex:1] objectForKey:@"views"];
        
        //home-background-tableview
        background = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"home-background-tableview"]];
        background.frame = CGRectMake(0, 0, 320, 460);
        [self addSubview: background];
        
        
        ///add shadow
        shadow = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"clothe-girdview-detail-shadow"]];
        shadow.frame = CGRectMake(64, 210, 175, 22);
        [self addSubview: shadow];
        
        
        ///add Image
        productImage = [[UIImageView alloc] init];
        [productImage setImageWithURL:[NSURL URLWithString:[[view1 objectAtIndex:0] objectForKey:@"image"]]];
        productImage.frame = CGRectMake(53, 55, 207, 114);
        [self addSubview: productImage];
        
        ///add content View
        contentView = [[UIView alloc] initWithFrame:CGRectMake(0, 278, 320, 89)];
        contentBackground = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"clothe-gridview-detail-content-background"]];
        contentBackground.frame = CGRectMake(0, 0, 320, 89);
        [contentView addSubview: contentBackground];
        
        
        ///add titleLabel to contentView
        titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(8, 9, 150, 17)];
        titleLabel.text = [itemData objectForKey:@"title"];
        [titleLabel setFont:[UIFont systemFontOfSize:13 ]];
        [titleLabel setTextColor:[UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0]];
        [titleLabel setHighlighted:NO];
        [titleLabel setBackgroundColor:[UIColor clearColor]];
        [contentView addSubview: titleLabel];
        
        
        ///add description to contentView
        descriptionLabel = [[UILabel alloc] initWithFrame: CGRectMake(8, 35, 26, 12)];
        NSLog(@"descriptionLabel retainCount is %d",[descriptionLabel retainCount]);
        
        descriptionLabel.text = @"面料:";
        [descriptionLabel setFont:[UIFont systemFontOfSize:10 ]];
        [descriptionLabel setTextColor:[UIColor colorWithRed:209.0 / 255.0 green:209.0 / 255.0 blue:209.0 / 255.0 alpha:1.0]];
        [descriptionLabel setHighlighted:NO];
        [descriptionLabel setBackgroundColor:[UIColor clearColor]];
        
        [contentView addSubview: descriptionLabel];
        
        
        ///then....add the description content to View
        contentDescription = [[UILabel alloc] initWithFrame: CGRectMake(37, 35, 100, 12)];
        contentDescription.text = [itemData objectForKey:@"description"];
        [contentDescription setFont:[UIFont systemFontOfSize:10 ]];
        [contentDescription setTextColor:[UIColor colorWithRed:209.0 / 255.0 green:209.0 / 255.0 blue:209.0 / 255.0 alpha:1.0]];
        [contentDescription setHighlighted:NO];
        [contentDescription setBackgroundColor:[UIColor clearColor]];
        [contentView addSubview: contentDescription];
        
        
        ///add color label
        colorLabel = [[UILabel alloc] initWithFrame: CGRectMake(8, 52, 26, 12)];
        colorLabel.text = @"颜色:";
        [colorLabel setFont:[UIFont systemFontOfSize:10 ]];
        [colorLabel setTextColor:[UIColor colorWithRed:209.0 / 255.0 green:209.0 / 255.0 blue:209.0 / 255.0 alpha:1.0]];
        [colorLabel setHighlighted:NO];
        [colorLabel setBackgroundColor:[UIColor clearColor]];
        [contentView addSubview: colorLabel];
        
        
        ///add silver button
        NSString *silver = [[colors objectAtIndex:0] objectForKey:@"color"];
        NSScanner *scanner2 = [NSScanner scannerWithString:silver];
        unsigned baseColor1;
        [scanner2 scanHexInt:&baseColor1]; 
        CGFloat red   = ((baseColor1 & 0xFF0000) >> 16) / 255.0f;
        CGFloat green = ((baseColor1 & 0x00FF00) >>  8) / 255.0f;
        CGFloat blue  =  (baseColor1 & 0x0000FF) / 255.0f;
        
        silverButton =[[PFIGradientButton alloc] initWithFrame:CGRectMake(43, 54, 26, 26) startColor:[UIColor colorWithRed:red green:green blue:blue alpha:1.0] endColor:[UIColor colorWithRed:red green:green blue:blue alpha:1.0]];
        silverButton.tag = SilverButtonTouched;
        [silverButton addTarget:self action:@selector(myButtonTouched:) forControlEvents:UIControlEventTouchUpInside];
        [contentView addSubview: silverButton];
        
        
        ///add orange button
        NSString *orange = [[colors objectAtIndex:1] objectForKey:@"color"];
        NSScanner *scanner = [NSScanner scannerWithString:orange];
        unsigned baseColor;
        [scanner scanHexInt:&baseColor]; 
        red   = ((baseColor & 0xFF0000) >> 16) / 255.0f;
        green = ((baseColor & 0x00FF00) >>  8) / 255.0f;
        blue  =  (baseColor & 0x0000FF) / 255.0f;
        
        orangeButton =[[PFIGradientButton alloc] initWithFrame:CGRectMake(75, 54, 26, 26) startColor:[UIColor colorWithRed:red green:green blue:blue alpha:1.0] endColor:[UIColor colorWithRed:red green:green blue:blue alpha:1.0]];
        orangeButton.tag = OrangeButtonTouched;
        [orangeButton addTarget:self action:@selector(myButtonTouched:) forControlEvents:UIControlEventTouchUpInside];
        [contentView addSubview: orangeButton];
        
        //CGRectMake(165, 35, 45, 44)
        //CGRectMake(217, 35, 45, 44)
        //CGRectMake(268, 35, 45, 44)
        ///add thumnai button 1
        thumnailButton1 = [[UIButton alloc] init];
        [thumnailButton1 setImageWithURL:[NSURL URLWithString:[[view1 objectAtIndex:0] objectForKey:@"thumbnail"]]];
        thumnailButton1.frame = CGRectMake(165, 35, 45, 44);
        thumnailButton1.tag = ThumnailButton1Touched;
        [thumnailButton1 addTarget:self action:@selector(myButtonTouched:) forControlEvents:UIControlEventTouchUpInside];
        [contentView addSubview: thumnailButton1];
        
        
        ///add thumnai button 2
        thumnailButton2 = [[UIButton alloc] init];
        [thumnailButton2 setImageWithURL:[NSURL URLWithString:[[view1 objectAtIndex:1] objectForKey:@"thumbnail"]]];
        thumnailButton2.frame =CGRectMake(217, 35, 45, 44);
        thumnailButton2.tag = ThumnailButton2Touched;
        [thumnailButton2 addTarget:self action:@selector(myButtonTouched:) forControlEvents:UIControlEventTouchUpInside];
        [contentView addSubview: thumnailButton2];
        
        
        ///add thumnai button 3
        thumnailButton3 = [[UIButton alloc] init];
        [thumnailButton3 setImageWithURL:[NSURL URLWithString:[[view1 objectAtIndex:2] objectForKey:@"thumbnail"]]];
        thumnailButton3.frame = CGRectMake(268, 35, 45, 44);
        thumnailButton3.tag = ThumnailButton3Touched;
        [thumnailButton3 addTarget:self action:@selector(myButtonTouched:) forControlEvents:UIControlEventTouchUpInside];
        [contentView addSubview: thumnailButton3];
        
        
        [self addSubview: contentView];
        [contentView release];
        contentView = nil;
        
    }
    return self;
}

-(void) myButtonTouched: (id) sender
{
    switch (((UIButton*)sender).tag)
    {
        case  SilverButtonTouched:
            view1Active = TRUE;
            ///set product image
            [productImage setImageWithURL:[NSURL URLWithString:[[view1 objectAtIndex:0] objectForKey:@"image"]]];
            
            ///set 3 thumnail images for view1
            [thumnailButton1 setImageWithURL:[NSURL URLWithString:[[view1 objectAtIndex:0] objectForKey:@"thumbnail" ]]];
            [thumnailButton2 setImageWithURL:[NSURL URLWithString:[[view1 objectAtIndex:1] objectForKey:@"thumbnail" ]]];
            [thumnailButton3 setImageWithURL:[NSURL URLWithString:[[view1 objectAtIndex:2] objectForKey:@"thumbnail" ]]];
            
            break;
        case  OrangeButtonTouched:
            view1Active = FALSE;
            ///set product image
            [productImage setImageWithURL:[NSURL URLWithString:[[view2 objectAtIndex:0] objectForKey:@"image"]]];
            
            ///set 3 thumnail images for view1
            [thumnailButton1 setImageWithURL:[NSURL URLWithString:[[view1 objectAtIndex:0] objectForKey:@"thumbnail" ]]];
            [thumnailButton2 setImageWithURL:[NSURL URLWithString:[[view1 objectAtIndex:1] objectForKey:@"thumbnail" ]]];
            [thumnailButton3 setImageWithURL:[NSURL URLWithString:[[view1 objectAtIndex:2] objectForKey:@"thumbnail" ]]];
            
            break;
        case  ThumnailButton1Touched:
            if (view1Active)
            {
                [productImage setImageWithURL:[NSURL URLWithString:[[view1 objectAtIndex:0] objectForKey:@"image"]]];
            }
            else
            {
                [productImage setImageWithURL:[NSURL URLWithString:[[view2 objectAtIndex:0] objectForKey:@"image"]]];
            }
            break;
        case  ThumnailButton2Touched:
            if (view1Active)
            {
                [productImage setImageWithURL:[NSURL URLWithString:[[view1 objectAtIndex:1] objectForKey:@"image"]]];
            }
            else
            {
                [productImage setImageWithURL:[NSURL URLWithString:[[view2 objectAtIndex:1] objectForKey:@"image"]]];
            }
            break;
        case  ThumnailButton3Touched:
            if (view1Active)
            {
                [productImage setImageWithURL:[NSURL URLWithString:[[view1 objectAtIndex:2] objectForKey:@"image"]]];
            }
            else
            {
                [productImage setImageWithURL:[NSURL URLWithString:[[view2 objectAtIndex:2] objectForKey:@"image"]]];
            }
            break;
            
    }
}

-(void)dealloc
{
    NSLog(@"DEALLOC %@",NSStringFromClass([self class]));
    
    [background release];
    [shadow release];
    [contentView release];
    [contentBackground release];
    [titleLabel release];
    [productImage release];
    [descriptionLabel release];
    [contentDescription release];
    [colorLabel release];
    [silverButton release];
    [orangeButton release];
    [thumnailButton1 release];
    [thumnailButton2 release];
    [thumnailButton3 release];
    
    [super dealloc];
}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect
 {
 // Drawing code
 }
 */

@end
