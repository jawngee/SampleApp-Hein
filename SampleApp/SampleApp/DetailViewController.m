//
//  DetailViewController.m
//  SampleApp
//
//  Created by Doan The Hien on 11/9/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "DetailViewController.h"



@implementation DetailViewController

@synthesize noteEditor;
#pragma mark - Managing the detail item


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    noteEditor.frame = CGRectMake(0, 0, 320, 416);
    noteEditor.delegate = self;
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


/////////////////TEXT FIELD /////////////////////
- (void) textFieldDidBeginEditing:(UITextField *)textField
{
    NSLog(@"text field did starting");
}
- (void) textFieldDidEndEditing:(UITextField *)textField
{
    contentNote = textField.text;
    NSLog(@"text field did  ending");
    NSLog(contentNote);
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [noteEditor resignFirstResponder];
    return  NO;
}

///////SAVE BUTTON/////////
- (IBAction) saveButtonTouched: (id) sender
{
    contentNote = noteEditor.text;
    
}
@end

///reading a txt file
/*
 NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
 NSString *documentsDirectory = [paths objectAtIndex:0];
 
 NSString *myPathDocs =  [documentsDirectory stringByAppendingPathComponent:@"file1.txt"];
 
 if (![[NSFileManager defaultManager] fileExistsAtPath:myPathDocs])
 {
 NSString *myPathInfo = [[NSBundle mainBundle] pathForResource:@"file1" ofType:@"txt"];
 NSFileManager *fileManager = [NSFileManager defaultManager];
 [fileManager copyItemAtPath:myPathInfo toPath:myPathDocs error:NULL];
 }       
 
 //Load from File
 NSString *myString = [[NSString alloc] initWithContentsOfFile:myPathDocs encoding:NSUTF8StringEncoding error:NULL];
 NSLog(myString);
 */


/////creating a txt file

/*
 NSError *error;
 
 // Create file manager
 NSFileManager *fileMgr = [NSFileManager defaultManager];
 
 // Point to Document directory
 NSString *documentsDirectory = [NSHomeDirectory() 
 stringByAppendingPathComponent:@"Documents"];
 NSString *filePath = [documentsDirectory 
 stringByAppendingPathComponent:@"file2.txt"];
 
 // String to write
 NSString *str = @"iPhone Developer Tips\nhttp://iPhoneDevelopTips,com";
 
 // Write the file
 [str writeToFile:filePath atomically:YES 
 encoding:NSUTF8StringEncoding error:&error];
 
 // Show contents of Documents directory
 NSLog(@"Documents directory: %@",
 [fileMgr contentsOfDirectoryAtPath:documentsDirectory error:&error]);

*/

///deleting a file

/*
 NSError *error;
 NSFileManager *fileManager = [NSFileManager defaultManager];
 NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
 NSString *documentsDirectory = [paths objectAtIndex:0];
 NSLog(@"save touched");
 NSString *filePath2 = [documentsDirectory 
 stringByAppendingPathComponent:@"file1.txt"];
 if ([fileManager removeItemAtPath:filePath2 error:&error] != YES)
 NSLog(@"Unable to delete file: %@", [error localizedDescription]);
 // Show contents of Documents directory
 NSLog(@"Documents directory: %@",
 [fileManager contentsOfDirectoryAtPath:documentsDirectory error:&error]); 
 */

////listing all the names in Document directory

/*
 NSError* error;
 NSFileManager* fileMgr = [NSFileManager defaultManager];
 NSString* documentsDirectory = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
 NSArray* listOfFilenames = [fileMgr contentsOfDirectoryAtPath: documentsDirectory error: &error];
 */