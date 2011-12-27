//
//  PFIAppDelegate.h
//  SampleInterface
//
//  Created by Doan The Hien on 11/18/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PFIHomeViewController.h"
#import "PFICalendarViewController.h"
#import "PFIClotheViewController.h"
#import "PFIBagViewController.h"
#import "PFIMapViewController.h"
#import "ASINetworkQueue.h"
#import "LGViewHUD.h"

@class PFIRootViewController;

/**
 * PFIAppDelegate contains the RootViewController. The RootViewController is a UITabBarViewController that contains five view controllers which are: PFIHomeViewController, PFICalendarViewController, PFIClotheViewController, PFIBagViewController, PFIMapViewController.
 */
@interface PFIAppDelegate : UIResponder <UIApplicationDelegate>
{

    NSMutableArray *tabBarButtons;
    ASINetworkQueue *networkQueue;
    LGViewHUD *progressView;
    
}

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) UITabBarController *tabBarViewController;

@end
