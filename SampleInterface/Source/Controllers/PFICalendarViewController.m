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
@synthesize view1;
@synthesize view2;
@synthesize imageSet;

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
        self.imageScrollView = [[[UIScrollView alloc] init] autorelease];
        self.view.backgroundColor = [UIColor colorWithRed: 212.0 / 255.0 green: 212.0 / 255.0 blue: 212.0 / 255.0 alpha: 1.0];
        int imageWidth   = 320;
        int imageHeight  = 365;
        int contentWidth = imageWidth * 6;
        //int x = 0, y = 0;
        
        [self.imageScrollView setPagingEnabled:YES];
        [self.imageScrollView setUserInteractionEnabled:YES];
        [self.imageScrollView setShowsHorizontalScrollIndicator: NO];
        [self.imageScrollView setShowsVerticalScrollIndicator: NO];
        self.imageScrollView.scrollEnabled = YES;
        self.imageScrollView.frame = CGRectMake(0, 0, 320, imageHeight);
        self.imageScrollView.contentSize = CGSizeMake(contentWidth, imageHeight);
        self.imageScrollView.delegate = self;
        [self.view addSubview: self.imageScrollView];
        
        ///init image Set
        imageSet = [[NSMutableArray alloc] initWithCapacity:0];
        for (int i = 1; i <= 3; i++)
        {
            UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"calendar-image-%d.jpg",i]];
            [imageSet addObject:image];
        }

        ///init 2 UIImageView views
        view1 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 365)];
        view2 = [[UIImageView alloc] initWithFrame:CGRectMake(320, 0, 320, 365)];
        
        ///set image
        view1.image = [imageSet objectAtIndex:0];
        view2.image = [imageSet objectAtIndex:1];
        
        ///add subview
        [imageScrollView addSubview: view1];
        [imageScrollView addSubview: view2];
        
        view1Index = 0;
        view2Index = 1;
    }
    
}
-(void)scrollViewDidScroll:(UIScrollView *) scrollView
{	
    [self update];
}
-(void) update
{
    CGFloat pageWidth = 320;
	float currPos = imageScrollView.contentOffset.x;
	
	int selectedPage = roundf(currPos / pageWidth);
	
	float truePosition = selectedPage*pageWidth;
	
	int zone = selectedPage % 2;
	
	BOOL view1Active = zone == 0;
	
	UIImageView *nextView = view1Active ? view2 : view1;
	
	int nextpage = truePosition > currPos ? selectedPage-1 : selectedPage+1;
	
	if(nextpage >= 0 && nextpage < [imageSet count])
	{
		if((view1Active && nextpage == view1Index) || (!view1Active && nextpage == view2Index)) return;
		
		nextView.frame = CGRectMake(nextpage*320, 0, 320, 365);
		nextView.image = [imageSet objectAtIndex:nextpage];
		
		if(view1Active) view1Index = nextpage;
		else view2Index = nextpage;
	}
}
-(void) dealloc
{    
    NSLog(@"DEALLOC %@",NSStringFromClass([self class]));

    //[imageScrollView release];
    [view1 release];
    [view2 release];
    [imageSet release];
    imageScrollView = nil;
    view1 = nil;
    view2 = nil;
    imageSet = nil;
    
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
