//
//  HomeViewController.m
//  SampleInterface
//
//  Created by Doan The Hien on 11/21/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
/*
 NSString *error;
 NSPropertyListFormat format; 
 NSData *plistData = [NSData dataWithContentsOfFile:dataPath]; 
 self.data = (NSArray *) [[NSPropertyListSerialization propertyListFromData:plistData mutabilityOption:NSPropertyListImmutable format:&format errorDescription:&error] retain]; 
 */

//

#import "PFIHomeViewController.h"
#import "CustomBackground.h"
#import "PFIHomeTableViewCell.h"
#import "PFIDataManager.h"
#import "PFIHomeNewsItem.h"
#import "ASIHTTPRequest.h"
@implementation PFIHomeViewController

@synthesize data;
@synthesize cellBackground;

-(id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
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

-(void) dealloc
{
    NSLog(@"DEALLOC %@",NSStringFromClass([self class]));
    
    [cellBackground release]; 
    cellBackground = nil;
    [super dealloc];
}

#pragma mark - View lifecycle

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tableView.rowHeight = 124;

    if(!self.data)
    {
        
        imageArray = [[NSMutableArray alloc] initWithCapacity:20];
        
        [[PFIDataManager sharedManager] loadHomeNewsItems:^(id dataArray)
         {
             data = [dataArray retain];
             NSLog(@"number of home items  = %d",[data count]);
             [self.tableView reloadData];
             
         }];
        
        [self.tableView setBackgroundView:[[[CustomBackground alloc] init] autorelease]];
        cellBackground = [[CustomCellBackground alloc] init];
    }
}
-(void) loadingIconImage
{
    if (!networkQueue) {
		networkQueue = [[ASINetworkQueue alloc] init];	
	}
	[networkQueue reset];
	[networkQueue setRequestDidFinishSelector:@selector(imageFetchComplete:)];
	[networkQueue setRequestDidFailSelector:@selector(imageFetchFailed:)];
	[networkQueue setDelegate:self];
    
    for (int i = 0; i < [data count]; i++)
    {
        NSDictionary *item = [data objectAtIndex:i];
        NSURL *url = [NSURL URLWithString:[item objectForKey:@"icon"]];
        ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
        
        [request setDownloadDestinationPath:[[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"] stringByAppendingPathComponent:[NSString stringWithFormat:@"%d.png",i]]];
        [request setUserInfo:[NSDictionary dictionaryWithObject:[NSString stringWithFormat:@"%d",i] forKey:@"name"]];
        [networkQueue addOperation:request];
        
    }
    [networkQueue go];
}
- (void)imageFetchComplete:(ASIHTTPRequest *)request
{
	UIImage *img = [UIImage imageWithContentsOfFile:[request downloadDestinationPath]];
    [imageArray addObject:img];
}

- (void)imageFetchFailed:(ASIHTTPRequest *)request
{
	NSLog(@"imageFetchFailed");
}

-(void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

-(void) refreshPage:(id)sender
{
    
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

-(void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

-(BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    // Return the number of sections.
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.data count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"CustomCell";
    PFIHomeTableViewCell *cell = (PFIHomeTableViewCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    int indexRow = indexPath.row;
    NSDictionary *dataItem = [self.data objectAtIndex: indexRow];

    if (cell == nil)
    {
        cell = [[[PFIHomeTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier elements: dataItem] autorelease];
        
        ///set the background cell
        [cell setSelectedBackgroundView: cellBackground];
    }
    else
    {
        [cell setElements: dataItem];
    }
    
    return cell;
}

@end
