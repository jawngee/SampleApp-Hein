//
//  PFIAppDelegate.m
//  SampleInterface
//
//  Created by Doan The Hien on 11/18/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "PFIAppDelegate.h"
#import "PFIRootViewController.h"
@implementation PFIAppDelegate

@synthesize window = _window;
@synthesize tabBarViewController;
@synthesize homeNavigationController;
@synthesize calendarNavigationController;
@synthesize clotheNavigationController;
@synthesize bagNavigationController;
@synthesize mapNavigationController;
-(void)dealloc
{ 
    [_window release];
    [tabBarViewController release];
    [super dealloc];
}

-(BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window     = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
   
    PFIHomeViewController *homeViewController = [[[PFIHomeViewController alloc] initWithNibName:@"PFIHomeViewController" bundle:nil] autorelease];
    
    PFICalendarViewController *calendarViewController = [[[PFICalendarViewController alloc] initWithNibName:@"PFICalendarViewController" bundle:nil] autorelease];
    
    PFIClotheViewController *clotheViewController = [[[PFIClotheViewController alloc] initWithNibName:@"PFIClotheViewController" bundle:nil] autorelease];
    
    PFIBagViewController *bagViewController = [[[PFIBagViewController alloc] initWithNibName:@"PFIBagViewController" bundle:nil] autorelease];
    
    PFIMapViewController *mapViewController = [[[PFIMapViewController alloc] initWithNibName:@"PFIMapViewController" bundle:nil] autorelease];
    
    ///init home navigation
    self.homeNavigationController = [[[UINavigationController alloc] initWithRootViewController:homeViewController] autorelease];
    self.homeNavigationController.navigationBar.tintColor = [UIColor whiteColor];

    
    ///init calendar navigation
    self.calendarNavigationController = [[[UINavigationController alloc] initWithRootViewController:calendarViewController] autorelease];
    self.calendarNavigationController.navigationBar.tintColor = [UIColor blackColor];

    
    ///init  clothe navigation
    self.clotheNavigationController = [[[UINavigationController alloc] initWithRootViewController:clotheViewController] autorelease];
    self.clotheNavigationController.navigationBar.tintColor = [UIColor blackColor];
    
    ///init bag navigation
    self.bagNavigationController = [[[UINavigationController alloc] initWithRootViewController:bagViewController] autorelease];
    self.bagNavigationController.navigationBar.tintColor = [UIColor blackColor];
  
    ////init map navigation
    self.mapNavigationController = [[[UINavigationController alloc] initWithRootViewController:mapViewController] autorelease];
    self.mapNavigationController.navigationBar.tintColor = [UIColor blackColor];
        
    /// init Root view controller and configure it
    self.tabBarViewController = [[[PFIRootViewController alloc] initWithNibName:@"PFIRootViewController" bundle:nil] autorelease];
    self.tabBarViewController.viewControllers = [NSArray arrayWithObjects:self.homeNavigationController, self.calendarNavigationController, self.clotheNavigationController, self.bagNavigationController, self.mapNavigationController, nil];
    
    [self.homeNavigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"global-header-background"] forBarMetrics: UIBarMetricsDefault];
    [self.calendarNavigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"global-header-background"] forBarMetrics: UIBarMetricsDefault];
    
    UIImage *selectedImage0, *unselectedImage0, *selectedImage1, *unselectedImage1,
    *selectedImage2, *unselectedImage2,*selectedImage3, *unselectedImage3,*selectedImage4, *unselectedImage4;
    UITabBar *tabBar = self.tabBarViewController.tabBar;
    
    selectedImage0   = [UIImage imageNamed:@"global-footer-home-on"];
    unselectedImage0 = [UIImage imageNamed:@"global-footer-home"];
    
    selectedImage1   = [UIImage imageNamed:@"global-footer-calendar-on"];
    unselectedImage1 = [UIImage imageNamed:@"global-footer-calendar"];
    
    selectedImage2   = [UIImage imageNamed:@"global-footer-cloth-on"];
    unselectedImage2 = [UIImage imageNamed:@"global-footer-cloth"];
    
    selectedImage3   = [UIImage imageNamed:@"global-footer-bag-on"];
    unselectedImage3 = [UIImage imageNamed:@"global-footer-bag"];
    
    selectedImage4   = [UIImage imageNamed:@"global-footer-map-on"];
    unselectedImage4 = [UIImage imageNamed:@"global-footer-map"];
    
    [tabBar setBackgroundImage:[UIImage imageNamed:@"global-footer-background"]];
    
    
    UITabBarItem *item0 = [tabBar.items objectAtIndex:0];
    UITabBarItem *item1 = [tabBar.items objectAtIndex:1];
    UITabBarItem *item2 = [tabBar.items objectAtIndex:2];
    UITabBarItem *item3 = [tabBar.items objectAtIndex:3];
    UITabBarItem *item4 = [tabBar.items objectAtIndex:4];
    
    [item0 setImageInsets: UIEdgeInsetsMake(7, 0, -7, 0)];
    [item1 setImageInsets: UIEdgeInsetsMake(7, 0, -7, 0)];
    [item2 setImageInsets: UIEdgeInsetsMake(7, 0, -7, 0)];
    [item3 setImageInsets: UIEdgeInsetsMake(7, 0, -7, 0)];
    [item4 setImageInsets: UIEdgeInsetsMake(7, 0, -7, 0)];
    
    [item0 setFinishedSelectedImage:selectedImage0 withFinishedUnselectedImage:unselectedImage0];
    [item1 setFinishedSelectedImage:selectedImage1 withFinishedUnselectedImage:unselectedImage1];
    [item2 setFinishedSelectedImage:selectedImage2 withFinishedUnselectedImage:unselectedImage2];
    [item3 setFinishedSelectedImage:selectedImage3 withFinishedUnselectedImage:unselectedImage3];
    [item4 setFinishedSelectedImage:selectedImage4 withFinishedUnselectedImage:unselectedImage4];

    self.window.rootViewController = self.tabBarViewController;
    [self.window makeKeyAndVisible];
    return YES;
}

-(void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

-(void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

-(void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

-(void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

-(void)applicationWillTerminate:(UIApplication *)application
{
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
}

@end
