//
//  PFIAppDelegate.m
//  SampleInterface
//
//  Created by Doan The Hien on 11/18/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "PFIAppDelegate.h"
#import "RootViewController.h"
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
    CGRect screen   = [[UIScreen mainScreen] bounds];
    int ratioScreen = screen.size.width / 320;
    HomeViewController *homeViewController = [[[HomeViewController alloc] initWithNibName:@"HomeViewController" bundle:nil] autorelease];
    
    CalendarViewController *calendarViewController = [[[CalendarViewController alloc] initWithNibName:@"CalendarViewController" bundle:nil] autorelease];
    
    ClotheViewController *clotheViewController = [[[ClotheViewController alloc] initWithNibName:@"ClotheViewController" bundle:nil] autorelease];
    
    BagViewController *bagViewController = [[[BagViewController alloc] initWithNibName:@"BagViewController" bundle:nil] autorelease];
    
    MapViewController *mapViewController = [[[MapViewController alloc] initWithNibName:@"MapViewController" bundle:nil] autorelease];
    
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
    self.tabBarViewController = [[[RootViewController alloc] initWithNibName:@"RootViewController" bundle:nil] autorelease];
    self.tabBarViewController.viewControllers = [NSArray arrayWithObjects:self.homeNavigationController, self.calendarNavigationController, self.clotheNavigationController, self.bagNavigationController, self.mapNavigationController, nil];
    
    ///set Header background of Navigation Bar
    if (ratioScreen == 1)
    {
        [self.homeNavigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"global-header-background.png"] forBarMetrics: UIBarMetricsDefault];
        [self.calendarNavigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"global-header-background.png"] forBarMetrics: UIBarMetricsDefault];
    }
    else
    {
        [self.homeNavigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"global-header-background@2x.png"] forBarMetrics: UIBarMetricsDefault];
        [self.calendarNavigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"global-header-background@2x.png"] forBarMetrics: UIBarMetricsDefault];
    }
    
    UIImage *selectedImage0, *unselectedImage0, *selectedImage1, *unselectedImage1,
    *selectedImage2, *unselectedImage2,*selectedImage3, *unselectedImage3,*selectedImage4, *unselectedImage4;
    UITabBar *tabBar = self.tabBarViewController.tabBar;
    
    if (ratioScreen == 1) 
    {
        selectedImage0   = [UIImage imageNamed:@"global-footer-home-on.png"];
        unselectedImage0 = [UIImage imageNamed:@"global-footer-home.png"];
        
        selectedImage1   = [UIImage imageNamed:@"global-footer-calendar-on.png"];
        unselectedImage1 = [UIImage imageNamed:@"global-footer-calendar.png"];
        
        selectedImage2   = [UIImage imageNamed:@"global-footer-cloth-on.png"];
        unselectedImage2 = [UIImage imageNamed:@"global-footer-cloth.png"];
        
        selectedImage3   = [UIImage imageNamed:@"global-footer-bag-on.png"];
        unselectedImage3 = [UIImage imageNamed:@"global-footer-bag.png"];
        
        selectedImage4   = [UIImage imageNamed:@"global-footer-map-on.png"];
        unselectedImage4 = [UIImage imageNamed:@"global-footer-map.png"];
        
        [tabBar setBackgroundImage:[UIImage imageNamed:@"global-footer-background.png"]];
    }
    else
    {
        selectedImage0   = [UIImage imageNamed:@"global-footer-home-on@2x.png"];
        unselectedImage0 = [UIImage imageNamed:@"global-footer-home@2x.png"];
        
        selectedImage1   = [UIImage imageNamed:@"global-footer-calendar-on@2x.png"];
        unselectedImage1 = [UIImage imageNamed:@"global-footer-calendar@2x.png"];
        
        selectedImage2   = [UIImage imageNamed:@"global-footer-cloth-on@2x.png"];
        unselectedImage2 = [UIImage imageNamed:@"global-footer-cloth@2x.png"];
        
        selectedImage3   = [UIImage imageNamed:@"global-footer-bag-on@2x.png"];
        unselectedImage3 = [UIImage imageNamed:@"global-footer-bag@2x.png"];
        
        selectedImage4   = [UIImage imageNamed:@"global-footer-map-on@2x.png"];
        unselectedImage4 = [UIImage imageNamed:@"global-footer-map@2x.png"];
        
        [tabBar setBackgroundImage:[UIImage imageNamed:@"global-footer-background@2x.png"]];
    }
    
    
    
    
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
