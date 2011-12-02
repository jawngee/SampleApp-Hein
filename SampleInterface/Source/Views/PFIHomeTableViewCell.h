//
//  PFIHomeTableViewCell.h
//  SampleInterface
//
//  Created by Doan The Hien on 11/24/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
/**
    * PFIHomeTableViewCell is the cell of PFIHomeViewController that contains the infomation of an fashion event.
    * icon: image of the event
    * titleLabel: brief text related to event
    * contentLabel: small description of event
    * dateLabel: date when event occurs.
 */
@interface PFIHomeTableViewCell : UITableViewCell
{
    UIImageView *icon;
    UILabel     *titleLabel;
    UILabel     *contentLabel;
    UILabel     *dateLabel;
}
@property(nonatomic, retain) UIImageView *icon;
@property(nonatomic, retain) UILabel     *titleLabel;
@property(nonatomic, retain) UILabel     *contentLabel;
@property(nonatomic, retain) UILabel     *dateLabel;

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
