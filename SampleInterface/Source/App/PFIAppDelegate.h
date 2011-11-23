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
@class PFIRootViewController;

/**
 * PFIAppDelegate contains the RootViewController. The RootViewController is a UITabBarViewController that contains five view controllers which are: PFIHomeViewController, PFICalendarViewController, PFIClotheViewController, PFIBagViewController, PFIMapViewController.
 */
@interface PFIAppDelegate : UIResponder <UIApplicationDelegate>
{
    /**
     * homeNavigationController: this is the navigation controller contains PFIHomeViewController
     * calendarNavigationController: this is the navigation controller contains PFICalendarViewController
     * clotheNavigationController: this is the navigation controller contains PFIClotheViewController
     * bagNavigationController: this is the navigation controller contains PFIBagViewController
     * mapNavigationController: this is the navigation controller contains PFIMapViewController
     */
    UINavigationController* homeNavigationController;
    UINavigationController* calendarNavigationController;
    UINavigationController* clotheNavigationController;
    UINavigationController* bagNavigationController;
    UINavigationController* mapNavigationController;
}

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) PFIRootViewController *tabBarViewController;

@property (strong, nonatomic)  UINavigationController* homeNavigationController;

@property (strong, nonatomic) UINavigationController* calendarNavigationController;

@property (strong, nonatomic)  UINavigationController* clotheNavigationController;

@property (strong, nonatomic)  UINavigationController* bagNavigationController;

@property (strong, nonatomic) UINavigationController* mapNavigationController;
@end
