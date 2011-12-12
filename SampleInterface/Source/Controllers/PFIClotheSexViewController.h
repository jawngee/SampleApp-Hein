//
//  PFIClotheSexViewController.h
//  SampleInterface
//
//  Created by Doan The Hien on 12/12/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PFIClotheSexViewController : UITableViewController
{
    NSArray *data;
    UIView  *selectedCellBackground;
}

@property(nonatomic, retain) NSArray *data;
@property(nonatomic, retain) UIView  *selectedCellBackground;
@end
