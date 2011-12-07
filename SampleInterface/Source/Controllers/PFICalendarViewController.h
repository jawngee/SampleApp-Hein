//
//  CalendarViewController.h
//  SampleInterface
//
//  Created by Doan The Hien on 11/18/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 * PFICalendarViewController is a UIViewController that contains a scroll view to show out all the images of the collection.
 */
@interface PFICalendarViewController : UIViewController
{
    /**
     * imageScrollView is the scroll view to show out all the images of the collection.
     */
     UIScrollView *imageScrollView;
    
}
@property(nonatomic, retain) UIScrollView *imageScrollView;
@end
