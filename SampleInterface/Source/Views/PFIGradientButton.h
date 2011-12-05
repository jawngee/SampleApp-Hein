//
//  PFIGradientButton.h
//  SampleInterface
//
//  Created by Doan The Hien on 12/2/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
/**
   * PFIGradientButton is a class to customize the appearance of a button. Draw it linear gradient with 
     startColor and endColor.
 */
@interface PFIGradientButton : UIButton
{
    UIColor *colorStart;
    UIColor *colorEnd;
}
@property(nonatomic, retain) UIColor *colorStart;
@property(nonatomic, retain) UIColor *colorEnd;
/**
  * the init method with a starColor and endColor
 */
-(id)initWithFrame:(CGRect)frame startColor:(UIColor*) start endColor:(UIColor*) end;
@end
