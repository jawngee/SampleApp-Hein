//
//  PFIClotheGridViewCell.h
//  SampleInterface
//
//  Created by Doan The Hien on 11/30/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
/**
   * PFIClotheGridViewCellDelegate protocol is to handle the event when User tap on a cell in Clothe Grid View
 */
@protocol PFIClotheGridViewCellDelegate

/**
  * this method is to show the Detail View of a cell.
 */
-(void) presentGridViewCellDetail:(NSDictionary*) dataItem;

@end

/**
    * PFIClotheGridViewCell is a cell in PFIClotheTableViewCell
    * it contains a maximum of 3 buttons, 2 vertical lines, 3 horizontal lines
    * every dataItem (dataItem1, dataItem2, dataItem3) corresponds to every button(button1, button2, button3) on the cell
 */
@interface PFIClotheGridViewCell : UITableViewCell
{
    UIButton *button1;
    UIButton *button2;
    UIButton *button3;
    
    UIImageView *line1;
    UIImageView *line2;
    
    UIImageView *underLine1;
    UIImageView *underLine2;
    UIImageView *underLine3;

    
    NSDictionary *dataItem1;
    NSDictionary *dataItem2;
    NSDictionary *dataItem3;
    
    NSObject<PFIClotheGridViewCellDelegate> *delegate;
}
@property(nonatomic, assign, readwrite) UIButton *button1;
@property(nonatomic, assign, readwrite) UIButton *button2;
@property(nonatomic, assign, readwrite) UIButton *button3;

@property(nonatomic, assign, readwrite) UIImageView *line1;
@property(nonatomic, assign, readwrite) UIImageView *line2;

@property(nonatomic, assign, readwrite) NSDictionary *dataItem1;
@property(nonatomic, assign, readwrite) NSDictionary *dataItem2;
@property(nonatomic, assign, readwrite) NSDictionary *dataItem3;

@property(nonatomic, assign, readwrite) NSObject<PFIClotheGridViewCellDelegate> *delegate;

/**
   * init method with 3 data items: data1, data2, data3.
 */
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier item1:(NSDictionary *) data1 item2:(NSDictionary *) data2 item3:(NSDictionary *) data3;

/**
   * when a cell is reused, we don't need to create a new instance of cell. We just use this method to adjust the 
    data item within this cell.
 */
-(void) adjustCell:(NSDictionary*) data1 item2:(NSDictionary*) data2 item3:(NSDictionary*) data3;
@end
