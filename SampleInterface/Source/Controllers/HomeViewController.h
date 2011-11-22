//
//  HomeViewController.h
//  SampleInterface
//
//  Created by Doan The Hien on 11/21/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeViewController : UITableViewController
{
    NSArray *data;
    int ratioScreen;
}
@property(nonatomic, retain) NSArray *data;
@end
