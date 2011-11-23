//
//  PFIAppDelegate.h
//  SampleInterface
//
//  Created by Doan The Hien on 11/18/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PFIHomeViewController.h"
#import "CalendarViewController.h"
#import "ClotheViewController.h"
#import "BagViewController.h"
#import "MapViewController.h"
@class RootViewController;

@interface PFIAppDelegate : UIResponder <UIApplicationDelegate>
{
    UINavigationController* homeNavigationController;
    UINavigationController* calendarNavigationController;
    UINavigationController* clotheNavigationController;
    UINavigationController* bagNavigationController;
    UINavigationController* mapNavigationController;
}

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) RootViewController *tabBarViewController;

@property (strong, nonatomic)  UINavigationController* homeNavigationController;

@property (strong, nonatomic) UINavigationController* calendarNavigationController;

@property (strong, nonatomic)  UINavigationController* clotheNavigationController;

@property (strong, nonatomic)  UINavigationController* bagNavigationController;

@property (strong, nonatomic) UINavigationController* mapNavigationController;
@end
