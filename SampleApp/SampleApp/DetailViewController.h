//
//  DetailViewController.h
//  SampleApp
//
//  Created by Doan The Hien on 11/9/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController <UITextFieldDelegate>
{
    IBOutlet UITextField *noteEditor;
    NSString *contentNote;
}
@property (retain, nonatomic)  UITextField *noteEditor;
- (IBAction) saveButtonTouched: (id) sender;
@end
