//
//  MasterViewController.h
//  SampleApp
//
//  Created by Doan The Hien on 11/9/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

//#import <UIKit/UIKit.h>
#import "CoreData/CoreData.h"
#import "NewNoteViewController.h"
@interface MasterViewController : UITableViewController <NSFetchedResultsControllerDelegate,  UISearchBarDelegate, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate, NewNoteViewControllerDelegate>
{
    UISearchBar *mySearchBar;
    NSFetchedResultsController *fetchedResultsController;
    NSManagedObjectContext *managedObjectContext;
    NSManagedObjectContext *addingManagedObjectContext;
}
@property (nonatomic, retain) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, retain) NSManagedObjectContext *addingManagedObjectContext;
@property (nonatomic, retain) NSFetchedResultsController *fetchedResultsController;
@property (retain, nonatomic)  UISearchBar *mySearchBar;
- (IBAction) addNote:(id)sender;
- (void) initFetchedResultController;
@end
