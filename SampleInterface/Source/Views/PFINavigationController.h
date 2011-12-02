//
//  PFINavigationController.h
//  SampleInterface
//
//  Created by Doan The Hien on 11/28/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PFINavigationController;
/**
    * PFINavigationControllerDelegate is to handle the event when User touch the button refresh on navigation bar
 */
@protocol PFINavigationControllerDelegate

/**
    * This method is to handle the event when user touch the button on navigation bar.
 */
-(void) navigationControllerReloaded:(PFINavigationController*) navigationController;

@end

/**
    * PFINavigationController is to customize the UINavigationController so that we can set background image
     of the navigation bar.
    * reload: asked if there is a button refresh on navigation bar
    * delegate: the delegate to receive the event when hitting the refresh button.
 */
@interface PFINavigationController : UINavigationController
{
    UIViewController<PFINavigationControllerDelegate> *delegate;
    BOOL reload;
}
+(PFINavigationController*) navigationControllerForViewController:(NSString *)viewControllerName hasReload:(BOOL)hasReload;
@end
