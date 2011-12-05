//
//  PFIClotheGridViewController.h
//  SampleInterface
//
//  Created by Doan The Hien on 11/29/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PFIClotheGridViewCell.h"
/**
    * PFIClotheGridViewController is a Table View contains all the products related to a category.
    * This class needs to do the PFIClotheGridViewCellDelegate protocol to handle the event when
        user touch on a product.
    * data: this is an array contains all products.
    * numberOfRow: number of row in table view. 
 */
@interface PFIClotheGridViewController : UITableViewController<PFIClotheGridViewCellDelegate>
{
    NSArray *data;
    int numberOfRow;
}
@property(nonatomic, retain) NSArray *data;

@end
