//
//  PFIMapTableViewCell.h
//  SampleInterface
//
//  Created by Doan The Hien on 12/6/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PFIMapTableViewCell : UITableViewCell
{
    UIImageView *icon;
    UILabel     *titleLabel;
    UILabel     *contentLabel;
    UILabel     *subtitleLabel;
}
@property(nonatomic, retain) UIImageView *icon;
@property(nonatomic, retain) UILabel     *titleLabel;
@property(nonatomic, retain) UILabel     *contentLabel;
@property(nonatomic, retain) UILabel     *subtitleLabel;

/**
 * init method
 */
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier elements:(NSDictionary *) dataItem;
/**
 When we reuse a cell, we don't need to create a new instance of cell. We just use this method to adjust the 
 cell.
 */
-(void) setElements:(NSDictionary *) dataItem;

@end
