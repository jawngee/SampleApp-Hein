//
//  PFIClotheSexViewController.m
//  SampleInterface
//
//  Created by Doan The Hien on 12/12/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "PFIClotheSexViewController.h"
#import "CustomBackground.h"
#import "PFIClotheTableViewCell.h"
#import "PFIClotheViewController.h"
#import "PFIDataManager.h"
@implementation PFIClotheSexViewController

@synthesize data;
@synthesize selectedCellBackground;

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

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if (!self.data)
    {
        
        ///set Table view
        self.tableView.rowHeight = 92;
        [self.tableView setBackgroundView:[[[CustomBackground alloc] init] autorelease]];
        
        /*
        ///load data
        NSString *dataPath = [[NSBundle mainBundle] pathForResource:@"ClotheSexData" ofType:@"plist"];
        NSDictionary *loadedFile=[NSDictionary dictionaryWithContentsOfFile:dataPath];
        self.data = [loadedFile allValues];
        */
        
        self.data = [[PFIDataManager sharedManager] getClotheSexDataItems];
        
        selectedCellBackground = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 92)];
        [selectedCellBackground setBackgroundColor:[UIColor colorWithRed:35.0 / 255.0 green:150.0 / 255.0 blue:210.0 / 255.0 alpha:1.0]];
    }

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
    static NSString *CellIdentifier = @"Cell";
    
    int indexRow = indexPath.row;
    NSDictionary *dataItem = [self.data objectAtIndex: indexRow];
    
    PFIClotheTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) 
    {
        cell = [[[PFIClotheTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier elements:dataItem] autorelease];
        [cell setAccessoryType: UITableViewCellAccessoryDisclosureIndicator];
        [cell setSelectedBackgroundView: selectedCellBackground];
    }
    return cell;

}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    
    PFIClotheViewController *detailViewController = [[PFIClotheViewController alloc] initWithNibName:@"PFIClotheGridViewController" bundle:nil];
    
    // Pass the selected object to the new view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
    
    [detailViewController release];
}
-(void) dealloc
{
    NSLog(@"DEALLOC %@",NSStringFromClass([self class]));
    
    [selectedCellBackground release];
    selectedCellBackground = nil;
}
@end
