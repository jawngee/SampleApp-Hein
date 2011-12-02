//
//  PFIClotheGridViewCellDetail.m
//  SampleInterface
//
//  Created by Doan The Hien on 12/1/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "PFIClotheGridViewCellDetail.h"
#import "PFIGradientButton.h"

#define  SilverButtonTouched 1
#define  OrangeButtonTouched 2
#define  ThumnailButton1Touched 3
#define  ThumnailButton2Touched 4
#define  ThumnailButton3Touched 5

@implementation PFIClotheGridViewCellDetail

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil data:(NSDictionary*) item
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) 
    {
        itemData = item;
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    //home-background-tableview
    UIImageView *background = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"home-background-tableview"]];
    background.frame = CGRectMake(0, 0, 320, 460);
    [self.view addSubview: background];
    
    ///add shadow
    UIImageView *shadow = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"clothe-girdview-detail-shadow"]];
    shadow.frame = CGRectMake(64, 210, 175, 22);
    [self.view addSubview: shadow];
    
    ///add Image
    productImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"clothe-gridview-detail-1-silverImage"]];
    productImage.frame = CGRectMake(53, 55, 207, 114);
    [self.view addSubview: productImage];
    
    ///add content View
    UIView *contentView = [[UIView alloc] initWithFrame:CGRectMake(0, 278, 320, 89)];
    UIImageView *contentBackground = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"clothe-gridview-detail-content-background"]];
    contentBackground.frame = CGRectMake(0, 0, 320, 89);
    [contentView addSubview: contentBackground];
    
    ///add titleLabel to contentView
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(8, 9, 150, 17)];
    titleLabel.text = [itemData objectForKey:@"title"];
    [titleLabel setFont:[UIFont systemFontOfSize:13 ]];
    [titleLabel setTextColor:[UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0]];
    [titleLabel setHighlighted:NO];
    [titleLabel setBackgroundColor:[UIColor clearColor]];
    [contentView addSubview: titleLabel];
    
    ///add description to contentView
    UILabel *descriptionLabel = [[UILabel alloc] initWithFrame: CGRectMake(8, 35, 26, 12)];
    descriptionLabel.text = @"面料:";
    [descriptionLabel setFont:[UIFont systemFontOfSize:10 ]];
    [descriptionLabel setTextColor:[UIColor colorWithRed:209.0 / 255.0 green:209.0 / 255.0 blue:209.0 / 255.0 alpha:1.0]];
    [descriptionLabel setHighlighted:NO];
    [descriptionLabel setBackgroundColor:[UIColor clearColor]];
    [contentView addSubview: descriptionLabel];
    
    ///then....add the description content to View
    UILabel *contentDescription = [[UILabel alloc] initWithFrame: CGRectMake(37, 35, 100, 12)];
    contentDescription.text = [itemData objectForKey:@"description"];
    [contentDescription setFont:[UIFont systemFontOfSize:10 ]];
    [contentDescription setTextColor:[UIColor colorWithRed:209.0 / 255.0 green:209.0 / 255.0 blue:209.0 / 255.0 alpha:1.0]];
    [contentDescription setHighlighted:NO];
    [contentDescription setBackgroundColor:[UIColor clearColor]];
    [contentView addSubview: contentDescription];
    
    ///add color label
    UILabel *colorLabel = [[UILabel alloc] initWithFrame: CGRectMake(8, 52, 26, 12)];
    colorLabel.text = @"颜色:";
    [colorLabel setFont:[UIFont systemFontOfSize:10 ]];
    [colorLabel setTextColor:[UIColor colorWithRed:209.0 / 255.0 green:209.0 / 255.0 blue:209.0 / 255.0 alpha:1.0]];
    [colorLabel setHighlighted:NO];
    [colorLabel setBackgroundColor:[UIColor clearColor]];
    [contentView addSubview: colorLabel];
    
    ///add silver button
    PFIGradientButton *silverButton =[[PFIGradientButton alloc] initWithFrame:CGRectMake(43, 54, 26, 26) starColor:[UIColor colorWithRed:199.0 / 255.0 green:199.0 / 255.0 blue:199.0 / 255.0 alpha:1.0] endColor:[UIColor colorWithRed:183.0 / 255.0 green:183.0 / 255.0 blue:183.0 / 255.0 alpha:1.0]];
    silverButton.tag = SilverButtonTouched;
    [silverButton addTarget:self action:@selector(myButtonTouched:) forControlEvents:UIControlEventTouchUpInside];
    [contentView addSubview: silverButton];
    
    ///add orange button
    PFIGradientButton *orangeButton =[[PFIGradientButton alloc] initWithFrame:CGRectMake(75, 54, 26, 26) starColor:[UIColor colorWithRed:230.0 / 255.0 green:181.0 / 255.0 blue:133.0 / 255.0 alpha:1.0] endColor:[UIColor colorWithRed:221.0 / 255.0 green:157.0 / 255.0 blue:93.0 / 255.0 alpha:1.0]];
    orangeButton.tag = OrangeButtonTouched;
    [orangeButton addTarget:self action:@selector(myButtonTouched:) forControlEvents:UIControlEventTouchUpInside];
    [contentView addSubview: orangeButton];
    
    /*
    UIButton *silverButton = [[UIButton alloc] initWithFrame:CGRectMake(43, 54, 26, 26)];
    [silverButton setImage:[UIImage imageNamed:@"clothe-gridview-detail-button-color-silver"] forState:UIControlStateNormal];
    silverButton.tag = SilverButtonTouched;
    [silverButton addTarget:self action:@selector(myButtonTouched:) forControlEvents:UIControlEventTouchUpInside];
    [contentView addSubview: silverButton];
    
    ///add orange button
    UIButton *orangeButton = [[UIButton alloc] initWithFrame:CGRectMake(75, 54, 26, 26)];
    [orangeButton setImage:[UIImage imageNamed:@"clothe-gridview-detail-button-color-orange"] forState:UIControlStateNormal];
    orangeButton.tag = OrangeButtonTouched;
    [orangeButton addTarget:self action:@selector(myButtonTouched:) forControlEvents:UIControlEventTouchUpInside];
    [contentView addSubview: orangeButton];
    */
    
    ///add thumnai button 1
    UIButton *thumnailButton1 = [[UIButton alloc] initWithFrame:CGRectMake(165, 35, 45, 44)];
    [thumnailButton1 setImage:[UIImage imageNamed:@"clothe-gridview-detail-1-thumnail1"] forState:UIControlStateNormal];
    thumnailButton1.tag = ThumnailButton1Touched;
    [thumnailButton1 addTarget:self action:@selector(myButtonTouched:) forControlEvents:UIControlEventTouchUpInside];
    [contentView addSubview: thumnailButton1];
    
    ///add thumnai button 1
    UIButton *thumnailButton2 = [[UIButton alloc] initWithFrame:CGRectMake(217, 35, 45, 44)];
    [thumnailButton2 setImage:[UIImage imageNamed:@"clothe-gridview-detail-1-thumnail1"] forState:UIControlStateNormal];
    thumnailButton2.tag = ThumnailButton2Touched;
    [thumnailButton2 addTarget:self action:@selector(myButtonTouched:) forControlEvents:UIControlEventTouchUpInside];
    [contentView addSubview: thumnailButton2];
    
    
    ///add thumnai button 1
    UIButton *thumnailButton3 = [[UIButton alloc] initWithFrame:CGRectMake(268, 35, 45, 44)];
    [thumnailButton3 setImage:[UIImage imageNamed:@"clothe-gridview-detail-1-thumnail1"] forState:UIControlStateNormal];
    thumnailButton3.tag = ThumnailButton3Touched;
    [thumnailButton3 addTarget:self action:@selector(myButtonTouched:) forControlEvents:UIControlEventTouchUpInside];
    [contentView addSubview: thumnailButton3];
    
    [self.view addSubview: contentView];
                           
}
-(void) myButtonTouched: (id) sender
{
    switch (((UIButton*)sender).tag)
    {
        case  SilverButtonTouched:
            [productImage setImage: [UIImage imageNamed:@"clothe-gridview-detail-1-silverImage"]];
            break;
        case  OrangeButtonTouched:
            [productImage setImage: [UIImage imageNamed:@"clothe-gridview-detail-1-orangeImage"]];
            break;
        case  ThumnailButton1Touched:
            
            break;
        case  ThumnailButton2Touched:
            
            break;
        case  ThumnailButton3Touched:
            
            break;
            
    }
}
- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
