//
//  NewNoteViewController.m
//  SampleApp
//
//  Created by Doan The Hien on 11/13/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "NewNoteViewController.h"

@implementation NewNoteViewController
@synthesize noteEditor;
@synthesize delegate;
@synthesize note;

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
    noteEditor = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, 320, 460)];
    [[self view] addSubview:noteEditor];
    noteEditor.delegate = self;
    self.navigationItem.rightBarButtonItem = [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(saveButtonTouched:)] autorelease];
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
   // NSLog(contentNote);
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [noteEditor resignFirstResponder];
    return  NO;
}

///////SAVE BUTTON/////////
- (IBAction) saveButtonTouched: (id) sender
{
    /*
    contentNote = noteEditor.text;
    NSDate *today = [NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    // display in 12HR/24HR (i.e. 11:25PM or 23:25) format according to User Settings
    [dateFormatter setDateFormat:@"MM-dd-YYYY"];
    NSString *currentTime = [dateFormatter stringFromDate:today];
    [dateFormatter release];
    
    [note setValue:contentNote forKey:@"content"];
    [note setValue:currentTime forKey:@"date"];
    [note setValue:@"Note 1" forKey:@"name"];
    [delegate newNoteDidFinishSaved:self];
    */
}
@end

