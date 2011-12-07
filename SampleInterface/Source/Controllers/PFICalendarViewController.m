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
    NSLog(@"HELLO THERE MISTER PANTS");
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

-(void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    if (!self.imageScrollView) 
    {
        self.imageScrollView = [[UIScrollView alloc] init];
        self.view.backgroundColor = [UIColor colorWithRed: 212.0 / 255.0 green: 212.0 / 255.0 blue: 212.0 / 255.0 alpha: 1.0];
        int imageWidth   = 320;
        int imageHeight  = 365;
        int contentWidth = imageWidth * 3;
        int x = 0, y = 0;
        
        [self.imageScrollView setPagingEnabled:YES];
        [self.imageScrollView setUserInteractionEnabled:YES];
        [self.imageScrollView setShowsHorizontalScrollIndicator: NO];
        [self.imageScrollView setShowsVerticalScrollIndicator: NO];
        self.imageScrollView.scrollEnabled = YES;
        self.imageScrollView.frame = CGRectMake(0, 0, 320, imageHeight);
        self.imageScrollView.contentSize = CGSizeMake(contentWidth, imageHeight);
        for (int i = 1; i <= 3; i++) 
        {
            UIImageView *addedImage = [[[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"calendar-image-%d.jpg",i]]]autorelease];
            addedImage.frame = CGRectMake(x, y, imageWidth, imageHeight);
            [self.imageScrollView addSubview: addedImage];
            x = x + imageWidth ;
        }
        
        [self.view addSubview: self.imageScrollView];
        //[self.view insertSubview:self.imageScrollView aboveSubview:self.view];
    }
    
}
-(void) dealloc
{    
    NSLog(@"DEALLOC %@",NSStringFromClass([self class]));

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
