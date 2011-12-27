//
//  PFIClotheGridViewController.m
//  SampleInterface
//
//  Created by Doan The Hien on 11/29/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "PFIClotheGridViewController.h"
#import "CustomBackground.h"
#import "PFIClotheGridViewCell.h"
#import "PFIClotheGridViewCellDetail.h"
#import "PFIDataManager.h"

@implementation PFIClotheGridViewController

@synthesize data;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self)
    {
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}
-(void) dealloc
{
    NSLog(@"DEALLOC %@",NSStringFromClass([self class]));
    [super dealloc];
}
#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tableView.rowHeight = 123;
    if (!self.data)
    {
        self.data = [[PFIDataManager sharedManager] clotheDataGridView];
        [self.tableView setBackgroundView:[[[ CustomBackground alloc] init] autorelease]];
        if ( [data count] % 3 == 0)
        {
            numberOfRow = [data count] / 3;
        }
        else
        {
            numberOfRow = [data count] / 3 + 1;
        }

         [self.tableView reloadData];
        
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
{    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    //NSLog(@"number of Row in Clothe Grid View = %d",numberOfRow );
    return numberOfRow;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    PFIClotheGridViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    NSDictionary *data1, *data2, *data3;
    
    if (indexPath.row * 3  < [data count])
    {
        data1 = [data objectAtIndex: indexPath.row * 3 ];
       // NSLog(@"data1 retainCount = %d", [[data objectAtIndex: indexPath.row * 3 ] retainCount]);
    }
    else data1 = nil;
    
    if (indexPath.row * 3 + 1 < [data count])
    {
        data2 = [data objectAtIndex: indexPath.row * 3 + 1];
    }
    else data2 = nil;
    
    if (indexPath.row * 3 + 2 < [data count])
    {
        data3 = [data objectAtIndex: indexPath.row * 3 + 2];
    }
    else data3 = nil;
    
    if (cell == nil) 
    { 
        cell = [[[PFIClotheGridViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier item1:data1 item2:data2 item3: data3] autorelease];
        cell.delegate = self;

    }
    else
    {
        [cell adjustCell:data1 item2:data2 item3:data3];
    }
        
    return cell;
}
-(void) presentGridViewCellDetail:(NSDictionary*) dataItem
{
    //NSLog(@"presentGridviewdetail");
    
    PFIClotheGridViewCellDetail *detailViewController = [[PFIClotheGridViewCellDetail alloc] initWithNibName:@"PFIClotheGridViewCellDetail" bundle:nil data:dataItem];
    
    [self.navigationController pushViewController:detailViewController animated:YES];
    [detailViewController release];
}

@end
