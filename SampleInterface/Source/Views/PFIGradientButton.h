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
    UIColor *startColor;
    UIColor *endColor;
}
/**
  * the init method with a starColor and endColor
 */
-(id)initWithFrame:(CGRect)frame starColor:(UIColor*) start endColor:(UIColor*) end;
@end
