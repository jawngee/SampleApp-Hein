//
//  PFIClotheGridViewCellDetail.h
//  SampleInterface
//
//  Created by Doan The Hien on 12/1/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
/**
    * PFIClotheGridViewCellDetail is the product detail view when user touches a cell from PFIClotheGridViewController
    * itemData: this contains all info of a cell
    * productImage: the image of the product.
 */
@interface PFIClotheGridViewCellDetail : UIViewController
{
    NSDictionary *itemData;
    UIImageView *productImage;
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil data:(NSDictionary*) item;

@end
