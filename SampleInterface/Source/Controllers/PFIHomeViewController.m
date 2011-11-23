//
//  HomeViewController.m
//  SampleInterface
//
//  Created by Doan The Hien on 11/21/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "PFIHomeViewController.h"
#import "CustomBackground.h"
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
    [cellBackground release];
    [data release];
    [super dealloc];
}
#pragma mark - View lifecycle

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    ///load data to an array
    NSString *dataPath = [[NSBundle mainBundle] pathForResource:@"DataToLoad" ofType:@"plist"];
    NSDictionary *loadedFile=[NSDictionary dictionaryWithContentsOfFile:dataPath];
    self.data = [loadedFile allValues];

    ///set table height
    self.tableView.rowHeight = 123 ; 
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"global-header-button-refresh"] style:0 target:self action:@selector(refreshPage:)];
        
    [self.navigationItem.rightBarButtonItem setBackgroundImage:[UIImage imageNamed:@"global-header-refresh-background"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
        
    [self.tableView setBackgroundView:[[ CustomBackground alloc] init]];
    
    cellBackground = [[CustomCellBackground alloc] init];
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
    static NSString *CellIdentifier = @"CellView";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    ///add the icon image
    NSDictionary *dataItem = [data objectAtIndex:indexPath.row];
    NSString *imageName;
    imageName = [dataItem objectForKey:@"icon"];
  
    UIImageView *icon = [[[UIImageView alloc] initWithImage:[UIImage imageNamed:imageName]] autorelease];
    icon.frame = CGRectMake(8 , 15 , 133 , 94 );
    [cell addSubview:icon];
    
    ///add title label
    UILabel *titleLabel = [[[UILabel alloc] initWithFrame:CGRectMake(150 , 15 , 163 , 15 )] autorelease];
    titleLabel.text = [dataItem objectForKey:@"label1"];
    [titleLabel setFont:[UIFont systemFontOfSize:12 ]];
    [titleLabel setLineBreakMode: UILineBreakModeWordWrap];
    [titleLabel setNumberOfLines:0];
    [titleLabel setTextColor:[UIColor colorWithRed:92.0 / 255.0 green:92.0 / 255.0 blue:92.0 / 255.0 alpha:1.0]];
    [titleLabel sizeToFit];
    [titleLabel setHighlighted:NO];
    [titleLabel setHighlightedTextColor:[UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0]];
    [titleLabel setBackgroundColor:[UIColor clearColor]];
    [cell addSubview: titleLabel];
    
    ///add content label
    int height = titleLabel.frame.size.height;
    int contentY = titleLabel.frame.origin.y + height;
    UILabel *contentLabel = [[[UILabel alloc] initWithFrame:CGRectMake(150 , contentY, 163 , 15 )] autorelease]; 
    contentLabel.text = [dataItem objectForKey:@"label2"];
    [contentLabel setFont:[UIFont systemFontOfSize:12 ]];
    [contentLabel setTextColor:[UIColor colorWithRed:153.0 / 255.0 green:153.0 / 255.0 blue:153.0 / 255.0 alpha:1.0]];
    [contentLabel setLineBreakMode: UILineBreakModeWordWrap];
    [contentLabel setNumberOfLines:0];
    [contentLabel sizeToFit];
    [contentLabel setHighlighted:NO];
    [contentLabel setHighlightedTextColor:[UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0]];
    [contentLabel setBackgroundColor:[UIColor clearColor]];
    [cell addSubview: contentLabel];
    
    ////add date label
    UILabel *dateLabel = [[[UILabel alloc] initWithFrame:CGRectMake(173 , 94 , 133 , 15 )] autorelease];
    dateLabel.text = [dataItem objectForKey:@"label3"];
    [dateLabel setFont:[UIFont systemFontOfSize:12 ]];
    [dateLabel setTextColor:[UIColor colorWithRed:153.0 / 255.0 green:153.0 / 255.0 blue:153.0 / 255.0 alpha:1.0]];
    [dateLabel setLineBreakMode: UILineBreakModeWordWrap];
    [dateLabel setNumberOfLines:0];
    [dateLabel sizeToFit];
    [dateLabel setHighlighted:NO];
    [dateLabel setHighlightedTextColor:[UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0]];
    [dateLabel setBackgroundColor:[UIColor clearColor]];
    [cell addSubview: dateLabel];
    
    ///set the background cell
    
    [cell setSelectedBackgroundView: cellBackground];
    
    return cell;
}

@end
