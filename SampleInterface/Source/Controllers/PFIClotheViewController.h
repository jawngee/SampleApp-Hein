//
//  PFIClotheViewController.h
//  SampleInterface
//
//  Created by Doan The Hien on 11/24/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
/**
    * PFIClotheViewController is Clothe View that contains all stuffs related to clothes. Every cell on 
        table view is a category.
    * data: is an array contains all categories.
    * selectedCellBackground: the background view when a cell is selected.
 */
@interface PFIClotheViewController : UITableViewController
{
    NSArray *data;
    UIView  *selectedCellBackground;
}

@property(nonatomic, retain) NSArray *data;
@property(nonatomic, retain) UIView  *selectedCellBackground;
@end
