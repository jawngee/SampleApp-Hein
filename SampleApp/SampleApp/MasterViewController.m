//
//  MasterViewController.m
//  SampleApp
//
//  Created by Doan The Hien on 11/9/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "MasterViewController.h"
#import "Note.h"
@implementation MasterViewController

@synthesize fetchedResultsController;
@synthesize managedObjectContext;
@synthesize mySearchBar;
@synthesize addingManagedObjectContext;
- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
   // mySearchBar = [[UISearchBar alloc] init];
    mySearchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0,70,320,44)];
    mySearchBar.delegate = self;
    [[self tableView] setTableHeaderView:mySearchBar];
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
}
- (void) initFetchedResultController
{
    NSError *error;
	if (![[self fetchedResultsController] performFetch:&error]) {
		// Update to handle the error appropriately.
		NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
		exit(-1);  // Fail
	}
}


- (IBAction) addNote:(id)sender{
    
    NewNoteViewController *newNoteViewController = [[NewNoteViewController alloc] init];
	newNoteViewController.delegate = self;
	
	// Create a new managed object context for the new book -- set its persistent store coordinator to the same as that 
    //from the fetched results controller's context.
	NSManagedObjectContext *addingContext = [[NSManagedObjectContext alloc] init];
	self.addingManagedObjectContext = addingContext;

	[addingManagedObjectContext setPersistentStoreCoordinator:[[[self fetchedResultsController] managedObjectContext] persistentStoreCoordinator]];
    
	newNoteViewController.note = (Note*)[NSEntityDescription insertNewObjectForEntityForName:@"Note" inManagedObjectContext:addingContext];
    
	UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:newNoteViewController];
	
    [self.navigationController presentModalViewController:navController animated:YES];
	
	[newNoteViewController release];
	[navController release];
    [addingContext release];
    
}
- (void)newNoteDidFinishSaved:(NewNoteViewController *)controller {
	
		
    NSNotificationCenter *dnc = [NSNotificationCenter defaultCenter];
    [dnc addObserver:self selector:@selector(newNoteControllerContextDidSave:) name:NSManagedObjectContextDidSaveNotification object:addingManagedObjectContext];
		
    NSError *error;
    if (![addingManagedObjectContext save:&error]) {
        // Update to handle the error appropriately.
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        exit(-1);  // Fail
    }
    [dnc removeObserver:self name:NSManagedObjectContextDidSaveNotification object:addingManagedObjectContext];
	// Release the adding managed object context.
//	self.addingManagedObjectContext = nil;
	// Dismiss the modal view to return to the main list
//    [self dismissModalViewControllerAnimated:YES];
    
   
         
}
- (void) newNoteControllerContextDidSave:(NSNotification*)saveNotification {
	
    
	NSManagedObjectContext *context = [fetchedResultsController managedObjectContext];
	// Merging changes causes the fetched results controller to update its results
	[context mergeChangesFromContextDidSaveNotification:saveNotification];
     
}
#pragma mark -
#pragma mark Fetched results controller

/**
 Returns the fetched results controller. Creates and configures the controller if necessary.
 */
- (NSFetchedResultsController *)fetchedResultsController {
    
    if (fetchedResultsController != nil) {
        return fetchedResultsController;
    }
    
	// Create and configure a fetch request with the Note entity.
	NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSLog(@"toi day roi");
	NSEntityDescription *entity = [NSEntityDescription entityForName:@"Note" inManagedObjectContext:[self managedObjectContext]];
    [fetchRequest setEntity:entity];
	
	// Create the sort descriptors array.
	NSSortDescriptor *nameDescriptor = [[NSSortDescriptor alloc] initWithKey:@"name" ascending:NO];
	NSSortDescriptor *dateDescriptor = [[NSSortDescriptor alloc] initWithKey:@"date" ascending:NO];
	NSArray *sortDescriptors = [[NSArray alloc] initWithObjects:nameDescriptor, dateDescriptor, nil];
	[fetchRequest setSortDescriptors:sortDescriptors];
	
	// Create and initialize the fetch results controller.
	NSFetchedResultsController *aFetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest managedObjectContext:self.managedObjectContext sectionNameKeyPath:@"date" cacheName:@"Root"];
	self.fetchedResultsController = aFetchedResultsController;
	fetchedResultsController.delegate = self;
	 NSLog(@"finish to init fetch");
	// Memory management.
	[aFetchedResultsController release];
	[fetchRequest release];
	[nameDescriptor release];
	[dateDescriptor release];
	[sortDescriptors release];
	
	return fetchedResultsController;
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
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

#pragma mark UISearchBarDelegate

- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar
{
	// only show the status bar's cancel button while in edit mode
    NSLog(@"text is begining to start");
	mySearchBar.showsCancelButton = YES;
	
	
}

- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar
{
	mySearchBar.showsCancelButton = NO;
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
	
	
}

// called when cancel button pressed
- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
	[searchBar resignFirstResponder];
	searchBar.text = @"";
}

// called when Search (in our case "Done") button pressed
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
	[searchBar resignFirstResponder];
}

@end
