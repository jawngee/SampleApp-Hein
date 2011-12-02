//
//  PFIClotheTableViewCell.h
//  SampleInterface
//
//  Created by Doan The Hien on 11/24/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
/**
    * PFIClotheTableViewCell is a cell from PFIClotheTableViewController. Every cell means a category.
    * icon: the image of the category
    * titleLabel: a brief text related to the category.
 */
@interface PFIClotheTableViewCell : UITableViewCell
{
    UIImageView *icon;
    UILabel     *titleLabel;
}

@property(nonatomic, retain) UIImageView *icon;
@property(nonatomic, retain) UILabel     *titleLabel;

/**
    * init method
 */
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier elements:(NSDictionary *) dataItem;
@end
