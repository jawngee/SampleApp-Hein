//
//  HomeViewController.h
//  SampleInterface
//
//  Created by Doan The Hien on 11/21/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomCellBackground.h"
#import "ASINetworkQueue.h"
/**
 * PFIHomeViewController contains a table view to show out the outline of all News.
 */
@interface PFIHomeViewController : UITableViewController
{
    /** 
     * data is to keep all the news which are contained in a plist file.
     * cellBackground is to custom the background of every cell in table view.
     */
    ASINetworkQueue *networkQueue;
    NSArray *data;
    NSMutableArray *imageArray;
    CustomCellBackground *cellBackground;
}

@property(nonatomic,assign) NSArray *data;
@property(nonatomic,assign) CustomCellBackground *cellBackground;
@end
