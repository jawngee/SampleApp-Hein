//
//  CalendarViewController.m
//  SampleInterface
//
//  Created by Doan The Hien on 11/18/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "PFICalendarViewController.h"

@implementation PFICalendarViewController

@synthesize imageScrollView;

-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) 
    {
        // Custom initialization
        
    }
    return self;
}

-(void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

-(void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.view.backgroundColor = [UIColor colorWithRed: 212.0 / 255.0 green: 212.0 / 255.0 blue: 212.0 / 255.0 alpha: 1.0];
    int imageWidth   = 320;
    int imageHeight  = 365;
    int contentWidth = imageWidth * 3;
    int x = 0, y = 0;
    [imageScrollView setPagingEnabled:YES];
    [imageScrollView setUserInteractionEnabled:YES];
    [imageScrollView setShowsHorizontalScrollIndicator: NO];
    [imageScrollView setShowsVerticalScrollIndicator: NO];
    imageScrollView.contentSize = CGSizeMake(contentWidth, imageHeight);
    for (int i = 1; i <= 3; i++) 
    {
        UIImageView *addedImage = [[[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"calendar-image-%d.jpg",i]]]autorelease];
        addedImage.frame = CGRectMake(x, y, imageWidth, imageHeight);
        [imageScrollView addSubview: addedImage];
        x = x + imageWidth ;
    }
}
-(void) dealloc
{
    [imageScrollView release];
    imageScrollView = nil;
    [super dealloc];
}
-(void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

-(BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
