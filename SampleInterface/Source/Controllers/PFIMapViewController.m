//
//  PFIMapViewController.m
//  SampleInterface
//
//  Created by Doan The Hien on 12/6/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "PFIMapViewController.h"
#import "CustomBackground.h"
#import "PFIMapTableViewCell.h"
#import "PFIMapDetailViewController.h"
@implementation PFIMapViewController

@synthesize data;
@synthesize backgroundSelectedCell;
- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
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
    NSLog(@"DEALLOC %@",NSStringFromClass([self class]));
    
    [super dealloc];
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    NSLog(@"LOADED BIATCHES");
    
    [super viewDidLoad];
    
    if (!self.data)
    {
        ///load data to an array
        NSString *dataPath = [[NSBundle mainBundle] pathForResource:@"MapDataItem" ofType:@"plist"];
        NSDictionary *loadedFile=[NSDictionary dictionaryWithContentsOfFile:dataPath];
        self.data = [loadedFile allValues];
        
        ///set background view 
        [self.tableView setBackgroundView:[[[CustomBackground alloc] init] autorelease]];
        
        ///set background selected cell
        backgroundSelectedCell = [[CustomCellBackground alloc] init];
    }
 
    ///set table view Height
    self.tableView.rowHeight = 123;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [data count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *CellIdentifier = @"CustomCell";
    PFIMapTableViewCell *cell = (PFIMapTableViewCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    int indexRow = indexPath.row;
    NSDictionary *dataItem = [self.data objectAtIndex: indexRow];

    if (cell == nil)
    {
        cell = [[[PFIMapTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier elements: dataItem] autorelease];
        
        ///set the background selected cell
        [cell setSelectedBackgroundView: backgroundSelectedCell];
    }
    else
    {
        [cell setElements: dataItem];
    }
    
    return cell;

}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    int indexRow = indexPath.row;
    NSDictionary *dataItem = [self.data objectAtIndex: indexRow];
    CLLocationDegrees lat = [[dataItem objectForKey:@"latitude"] doubleValue];
    CLLocationDegrees lon = [[dataItem objectForKey:@"longitude"] doubleValue];

    PFIMapDetailViewController *detailViewController = [[PFIMapDetailViewController alloc] initWithNibName:@"PFIMapDetailViewController" bundle:nil latitude:lat longitude:lon];
    
    // Pass the selected object to the new view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
    [detailViewController release];
     
}

@end
