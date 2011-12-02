//
//  PFINavigationController.m
//  SampleInterface
//
//  Created by Doan The Hien on 11/28/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "PFINavigationController.h"

@implementation PFINavigationController

/** Private methods */
@interface PFINavigationController(Private)

-(id)initForViewController:(NSString *)viewControllerName hasReload:(BOOL)hasReload;
-(void)reloadTapped:(id)sender;
@end

+(PFINavigationController*) navigationControllerForViewController:(NSString *)viewControllerName hasReload:(BOOL)hasReload
{
    return [[[PFINavigationController alloc] initForViewController:viewControllerName hasReload:hasReload] autorelease];
}

-(id)initForViewController:(NSString *)viewControllerName hasReload:(BOOL)hasReload
{
    self = [super init];
    
    if (self)
    {
        // Fetch the class from the class name
        Class vclass = NSClassFromString(viewControllerName);
        
        // Create an instance of the class
        delegate = [[vclass alloc] initWithNibName:viewControllerName bundle:nil];
        
        // Set reload flag
        reload = hasReload;
    
        // Push it onto the stack
        [self pushViewController:delegate animated:NO];
        
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
    // Do any additional setup after loading the view from its nib.
    CGRect frame = self.navigationBar.frame;
    
    // Zero the origin
    frame.origin.x = 0;
    frame.origin.y = 0;
    
    UIView *backgroundView = [[[UIView alloc] initWithFrame: frame] autorelease];
    
    backgroundView.backgroundColor = [UIColor whiteColor];
    backgroundView.opaque = YES;
    backgroundView.userInteractionEnabled = NO;
    UIImageView *imageView = [[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"global-header-background"]] autorelease];
    
    [backgroundView addSubview: imageView];
    [self.navigationBar insertSubview: backgroundView atIndex: 1];
    
    if (reload)
    {
        // Create the reload button
        UIButton *b=[UIButton buttonWithType:UIButtonTypeCustom];
        
        // Set the image
        [b setImage:[UIImage imageNamed:@"global-header-button-refresh"] forState:UIControlStateNormal];
        
        // Set the frame
        b.frame=CGRectMake(backgroundView.frame.size.width-36, floor((backgroundView.frame.size.height/2)-10), 21, 21);
        
        // Add the button to the container view
        [self.navigationBar addSubview:b];
        
        [b addTarget:self action:@selector(reloadTapped:) forControlEvents:UIControlEventTouchUpInside];

    }
}

-(void) reloadTapped:(id)sender
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
