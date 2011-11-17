//
//  ViewController.h
//  CoreGraphicSamp
//
//  Created by Doan The Hien on 11/15/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UITableViewController{
   
    NSMutableArray *_thingsToLearn;
    NSMutableArray *_thingsLearned;
}
@property (copy) NSMutableArray *thingsToLearn;
@property (copy) NSMutableArray *thingsLearned;
@end
