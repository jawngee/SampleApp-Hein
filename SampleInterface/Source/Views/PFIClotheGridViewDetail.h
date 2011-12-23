//
//  PFIClotheGridViewDetail.h
//  SampleInterface
//
//  Created by Doan The Hien on 12/19/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PFIGradientButton.h"

@interface PFIClotheGridViewDetail : UIView
{
    NSDictionary *itemData;
    UIImageView *productImage;
    UIScrollView *productView;
    bool firstLoad;
    bool view1Active;
    
    NSArray *colors;
    NSArray *view1;
    NSArray *view2;
    UIImageView *background;
    UIImageView *shadow;
    UIView *contentView ;
    UIImageView *contentBackground;
    UILabel *titleLabel;
    UILabel *descriptionLabel;
    UILabel *contentDescription;
    UILabel *colorLabel;
    PFIGradientButton *silverButton;
    PFIGradientButton *orangeButton;
    UIButton *thumnailButton1;
    UIButton *thumnailButton2;
    UIButton *thumnailButton3;
    
}
-(id)initWithData:(NSDictionary*)item;
@end
