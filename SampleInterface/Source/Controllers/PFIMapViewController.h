//
//  PFIMapViewController.h
//  SampleInterface
//
//  Created by Doan The Hien on 12/6/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomCellBackground.h"
@interface PFIMapViewController : UITableViewController
{
    NSArray *data;
    CustomCellBackground *backgroundSelectedCell;    
}
@property(nonatomic,retain) NSArray *data;
@property(nonatomic,retain) CustomCellBackground *backgroundSelectedCell;
@end
