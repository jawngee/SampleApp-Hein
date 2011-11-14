//
//  NewNoteViewController.h
//  SampleApp
//
//  Created by Doan The Hien on 11/13/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Note;

@protocol NewNoteViewControllerDelegate;

@interface NewNoteViewController : UIViewController <UITextFieldDelegate>
{
    UITextField *noteEditor;
    NSString *contentNote;
    id <NewNoteViewControllerDelegate> delegate;
    Note *note;
}

@property (nonatomic, retain) Note *note;
@property (nonatomic, assign) id <NewNoteViewControllerDelegate> delegate;
@property (nonatomic, retain)  UITextField *noteEditor;

- (IBAction) saveButtonTouched: (id) sender;

@end

@protocol NewNoteViewControllerDelegate
- (void) newNoteDidFinishSaved: (NewNoteViewController*) controller;
@end