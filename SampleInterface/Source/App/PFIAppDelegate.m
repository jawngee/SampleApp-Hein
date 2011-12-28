//
//  PFIAppDelegate.m
//  SampleInterface
//
//  Created by Doan The Hien on 11/18/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "PFIAppDelegate.h"
#import "PFINavigationController.h"
#import "SDImageCache.h"
#import "ASIHTTPRequest.h"
#import "JSONKit.h"
#import "PFIDataManager.h"

@implementation PFIAppDelegate

@synthesize window = _window;
@synthesize tabBarViewController;

-(void)dealloc
{ 
    [_window release];
    [tabBarViewController release];
    [networkQueue release];
    [super dealloc];
}

-(void)addTabBarButtonAtIndex:(NSInteger)index normalImage:(NSString *)normalImage selectedImage:(NSString *)selectedImage isSelected:(BOOL)isSelected
{
    // First we have to check if the running version of iOS supports tabbar item customization
    SEL asshat = @selector(setFinishedSelectedImage:withFinishedUnselectedImage:);
    
    if ([self.tabBarViewController.tabBar respondsToSelector: asshat])
    {
        //IOS 5+
        
        // Set the images
        [[self.tabBarViewController.tabBar.items objectAtIndex:index] setFinishedSelectedImage:[UIImage imageNamed:selectedImage] withFinishedUnselectedImage:[UIImage imageNamed:normalImage]];
        
        // Adjust the button image insets to center
        [[self.tabBarViewController.tabBar.items objectAtIndex:index] setImageInsets:UIEdgeInsetsMake(7, 0, -7, 0)];
    }
    else
    {
        //IOS 4
        float buttonWidth = floor(tabBarViewController.tabBar.frame.size.width/5);
        
        UIButton *b = [UIButton buttonWithType:UIButtonTypeCustom];
        b.tag = index;
        [b setSelected:isSelected];
        [b setImage:[UIImage imageNamed:normalImage] forState:UIControlStateNormal];
        [b setImage:[UIImage imageNamed:selectedImage] forState:UIControlStateSelected];
        b.frame=CGRectMake(buttonWidth*index, 0, buttonWidth, self.tabBarViewController.tabBar.frame.size.height);
        [b addTarget:self action:@selector(tabBarButtonSelected:) forControlEvents:UIControlEventTouchUpInside];
        [tabBarButtons addObject:b];
        [tabBarViewController.tabBar addSubview:b];
    }
}

-(BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{  
    [[SDImageCache sharedImageCache] clearDisk];
    [[SDImageCache sharedImageCache] cleanDisk];
    
    ////////Compare the time creation of file with current time
    loadFromLocal = FALSE;
    NSString *myString  = [[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"] stringByAppendingPathComponent:@"productRequest.txt"];
    NSDictionary* fileAttribs = [[NSFileManager defaultManager] attributesOfItemAtPath:myString error:nil];
    NSDate *date = [fileAttribs valueForKey:NSFileModificationDate];
    //NSLog(@"Date creation = %@",result);
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:(kCFCalendarUnitHour | kCFCalendarUnitMinute | kCFCalendarUnitDay | kCFCalendarUnitMonth | kCFCalendarUnitYear) fromDate:date];
    NSInteger hour = [components hour];
    NSInteger year = [components year];
    NSInteger day = [components day];
    NSInteger month = [components month];
        
    NSDate *now = [NSDate date];
    NSDateComponents *componentsNow = [calendar components:(kCFCalendarUnitHour | kCFCalendarUnitMinute | kCFCalendarUnitDay | kCFCalendarUnitMonth | kCFCalendarUnitYear) fromDate:now];
    NSInteger currentHour = [componentsNow hour];
    NSInteger currentYear = [componentsNow year];
    NSInteger currentDay = [componentsNow day];
    NSInteger currentMonth = [componentsNow month];
    
    ///we load data from local only when it has the same year,month,day,and hour, otherwise we load from web service
    if (currentYear == year && currentMonth == month && currentDay == day)
    {
        NSLog(@"the same day");
        if (currentHour - hour == 0) ///the same hour
        {
            loadFromLocal = TRUE;
        }
    }

    tabBarButtons=[[NSMutableArray alloc] initWithCapacity:0];
    self.window     = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
      
    /// init Root view controller and configure it
    self.tabBarViewController = [[[UITabBarController alloc] init] autorelease];
    ///add background image to tab bar
    [  self.tabBarViewController.tabBar addSubview:[[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"global-footer-background"]] autorelease]];
    
    self.tabBarViewController.viewControllers = [NSArray arrayWithObjects: [PFINavigationController navigationControllerForViewController:@"PFIHomeViewController" hasReload:YES],
                                                 [PFINavigationController navigationControllerForViewController:@"PFICalendarViewController" hasReload:YES],
                                                 [PFINavigationController navigationControllerForViewController:@"PFIClotheSexViewController" hasReload:YES],
                                                 [PFINavigationController navigationControllerForViewController:@"PFIBagViewController" hasReload:YES],
                                                 [PFINavigationController navigationControllerForViewController:@"PFIMapViewController" hasReload:YES],
                                                  nil];
    
    [self addTabBarButtonAtIndex:0 normalImage:@"global-footer-home" selectedImage:@"global-footer-home-on" isSelected:YES];
    [self addTabBarButtonAtIndex:1 normalImage:@"global-footer-calendar" selectedImage:@"global-footer-calendar-on" isSelected:NO];
    [self addTabBarButtonAtIndex:2 normalImage:@"global-footer-cloth" selectedImage:@"global-footer-cloth-on" isSelected:NO];
    [self addTabBarButtonAtIndex:3 normalImage:@"global-footer-bag" selectedImage:@"global-footer-bag-on" isSelected:NO];
    [self addTabBarButtonAtIndex:4 normalImage:@"global-footer-map" selectedImage:@"global-footer-map-on" isSelected:NO];
    
    ///addding tab bar view
    self.window.rootViewController = self.tabBarViewController;
    
    ///check if loading from local or not
    if (loadFromLocal)
    {
        ///getting home data
        NSString *homePath = [[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"] stringByAppendingPathComponent:@"homeRequest.txt"];
        NSString *homeData = [NSString stringWithContentsOfFile:homePath encoding:NSUTF8StringEncoding error:NULL];
        NSArray *homeJason = [homeData objectFromJSONString];
        [PFIDataManager sharedManager].homeNewsData = [homeJason retain];
        
        ///getting product data: clotheDataGridView --->data for Grid View
        NSString *productPath = [[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"] stringByAppendingPathComponent:@"productRequest.txt"];
        NSString *productData = [NSString stringWithContentsOfFile:productPath encoding:NSUTF8StringEncoding error:NULL];
        NSArray *productJason = [productData objectFromJSONString];
        [PFIDataManager sharedManager].clotheDataGridView = [productJason retain];
        
        ///getting location data
        NSString *mapPath = [[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"] stringByAppendingPathComponent:@"mapRequest.txt"];
        NSString *mapData = [NSString stringWithContentsOfFile:mapPath encoding:NSUTF8StringEncoding error:NULL];
        NSArray *mapJason = [mapData objectFromJSONString];
        [PFIDataManager sharedManager].mapData = [mapJason retain];
        
        ///reload data from Home View
        PFINavigationController *controller = [[tabBarViewController viewControllers] objectAtIndex:0];
        PFIHomeViewController *homeController = (PFIHomeViewController*) controller.topViewController;
        [homeController.tableView reloadData];
    }
    else
    {
        ///disable interaction of tab bar view
        [tabBarViewController.view setUserInteractionEnabled:NO];

        ///adding progress view
        progressView = [LGViewHUD defaultHUD];
        progressView.activityIndicatorOn = YES;
        [progressView showInView:tabBarViewController.view];
        
        ///starting downloading all JSON Files
        if (!networkQueue) {
            networkQueue = [[ASINetworkQueue alloc] init];	
        }
        [networkQueue reset];
        [networkQueue setRequestDidFinishSelector:@selector(imageFetchComplete:)];
        [networkQueue setRequestDidFailSelector:@selector(imageFetchFailed:)];
        [networkQueue setDelegate:self];
        failed = NO;
        
        ASIHTTPRequest *request;
        request = [ASIHTTPRequest requestWithURL:[NSURL URLWithString:@"http://robe.local/robe/news/"]];
        [request setUserInfo:[NSDictionary dictionaryWithObject:@"HomeRequest" forKey:@"name"]];
        [request setDownloadDestinationPath:[[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"] stringByAppendingPathComponent:@"homeRequest.txt"]];
        [networkQueue addOperation:request];
        
        request = [ASIHTTPRequest requestWithURL:[NSURL URLWithString:@"http://robe.local/robe/products/"]];
        [request setUserInfo:[NSDictionary dictionaryWithObject:@"ProductRequest" forKey:@"name"]];
        [request setDownloadDestinationPath:[[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"] stringByAppendingPathComponent:@"productRequest.txt"]];
        [networkQueue addOperation:request];
        
        request = [ASIHTTPRequest requestWithURL:[NSURL URLWithString:@"http://robe.local/robe/locations/"]];
        [request setUserInfo:[NSDictionary dictionaryWithObject:@"MapRequest" forKey:@"name"]];
        [request setDownloadDestinationPath:[[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"] stringByAppendingPathComponent:@"mapRequest.txt"]];
        [networkQueue addOperation:request];
        
        [networkQueue go];

    }
   
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)imageFetchComplete:(ASIHTTPRequest *)request
{
    NSString *myString = [NSString stringWithContentsOfFile:[request downloadDestinationPath] encoding:NSUTF8StringEncoding error:NULL];
    NSArray *myArray=[myString objectFromJSONString];
    
    NSDictionary *myDict =[request userInfo];
    NSString *requestItem = [myDict objectForKey:@"name"];
    
    if ([requestItem isEqualToString:@"HomeRequest"])
    {
        [PFIDataManager sharedManager].homeNewsData = [myArray retain];
    }
    else 
        if([requestItem isEqualToString:@"ProductRequest"])
        {
            [PFIDataManager sharedManager].clotheDataGridView = [myArray retain];
        }
        else ///MapRequest
        {
            [PFIDataManager sharedManager].mapData = [myArray retain];
        }
    ///check if downloading is finished
    if ([[PFIDataManager sharedManager] homeNewsData] != nil &&
        [[PFIDataManager sharedManager] clotheDataGridView] != nil &&
        [[PFIDataManager sharedManager] mapData] != nil)
    {
        [[LGViewHUD defaultHUD] hideWithAnimation:HUDAnimationHideZoom];
        [tabBarViewController.view setUserInteractionEnabled:YES];
        PFINavigationController *controller = [[tabBarViewController viewControllers] objectAtIndex:0];
        PFIHomeViewController *homeController = (PFIHomeViewController*) controller.topViewController;
        [homeController.tableView reloadData];
    }
}

- (void)imageFetchFailed:(ASIHTTPRequest *)request
{
    if (!failed) {
		if ([[request error] domain] != NetworkRequestErrorDomain || [[request error] code] != ASIRequestCancelledErrorType) {
			UIAlertView *alertView = [[[UIAlertView alloc] initWithTitle:@"Download failed" message:@"Please turn on your web server" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] autorelease];
			[alertView show];
            [[LGViewHUD defaultHUD] hideWithAnimation:HUDAnimationHideZoom];
            [tabBarViewController.view setUserInteractionEnabled:YES];
		}
		failed = YES;
	}
}

-(void)tabBarButtonSelected:(id)sender
{
    [[tabBarButtons objectAtIndex: self.tabBarViewController.selectedIndex] setSelected:NO];
    self.tabBarViewController.selectedIndex=((UIButton *)sender).tag;
    [sender setSelected:YES];
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

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application
{
    NSLog(@"MEMORY WARNING");
    
    [self.tabBarViewController didReceiveMemoryWarning];
}

@end
