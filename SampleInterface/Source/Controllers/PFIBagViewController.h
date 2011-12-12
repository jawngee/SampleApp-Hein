//
//  BagViewController.h
//  SampleInterface
//
//  Created by Doan The Hien on 11/18/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PFIBagViewController : UIViewController<UIScrollViewDelegate>
{
    /**
     * imageScrollView is the scroll view to show out all the images of the collection.
     */
    UIScrollView  *imageScrollView;
    UIImageView    *view1;
    UIImageView    *view2;
    NSMutableArray *imageSet;
    int view1Index, view2Index;
    
}

@property(nonatomic, retain) UIScrollView *imageScrollView;
@property(nonatomic, retain) UIImageView *view1;
@property(nonatomic, retain) UIImageView *view2;
@property(nonatomic, retain) NSMutableArray *imageSet;

-(void)update;
@end
