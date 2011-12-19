//
//  PFIClotheGridViewCellDetail.m
//  SampleInterface
//
//  Created by Doan The Hien on 12/1/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "PFIClotheGridViewCellDetail.h"
#import "PFIGradientButton.h"
#import "PFIClotheGridViewDetail.h"

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
        firstLoad = TRUE;
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

-(void)dealloc
{
    /*
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
    
     */
    [super dealloc];
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    
    if (firstLoad)
    {
        firstLoad = FALSE;
        [super viewDidLoad];
        
        int imageWidth   = 320;
        int imageHeight  = 370;
        int contentWidth = imageWidth * 4;
        int x = 0;
        
        myScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, imageWidth, imageHeight)];
        [myScrollView setPagingEnabled:YES];
        [myScrollView setUserInteractionEnabled:YES];
        [myScrollView setShowsHorizontalScrollIndicator: NO];
        [myScrollView setShowsVerticalScrollIndicator: NO];
        myScrollView.scrollEnabled = YES;
        myScrollView.contentSize = CGSizeMake(contentWidth, imageHeight);
        [self.view addSubview: myScrollView];
        
        for (int i = 0; i < 4; i++)
        {
            PFIClotheGridViewDetail *myView = [[[PFIClotheGridViewDetail alloc] initWithData:itemData] autorelease];
            myView.frame = CGRectMake(x, 0, imageWidth, imageHeight);
            x += 320;
            [myScrollView addSubview: myView];
        }
    }
}
-(void) backButtonPress:(id) sender
{
    
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
