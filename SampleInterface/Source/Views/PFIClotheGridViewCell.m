//
//  PFIClotheGridViewCell.m
//  SampleInterface
//
//  Created by Doan The Hien on 11/30/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "PFIClotheGridViewCell.h"

@implementation PFIClotheGridViewCell

@synthesize  button1;
@synthesize  button2;
@synthesize  button3;
@synthesize  line1;
@synthesize  line2;
@synthesize  dataItem1;
@synthesize  dataItem2;
@synthesize  dataItem3;
@synthesize  delegate;

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier item1:(NSDictionary *) data1
              item2:(NSDictionary *) data2 item3:(NSDictionary *) data3
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) 
    {
        dataItem1 = data1;
        dataItem2 = data2;
        dataItem3 = data3;
        
        int buttonWidth = 106;
        int buttonHeight = 121; 
        
        if (dataItem1)
        {
            NSString *imageName = [dataItem1 objectForKey:@"iconImage"];
            button1 = [[UIButton alloc] init];
            button1.frame = CGRectMake(0, 0, buttonWidth, buttonHeight);
            [button1 setImage:[UIImage imageNamed: imageName] forState:UIControlStateNormal];
            [button1 setBackgroundImage:[UIImage imageNamed:@"clothe-gridview-cell-hightlight"] forState:UIControlStateHighlighted];
            button1.tag = 1;
            [button1 addTarget:self action:@selector(itemButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
            
            line1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"clothe-gridview-seperation-line"]];
            line1.frame = CGRectMake(buttonWidth , 0, 1, 121);
            
            underLine1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"clothe-gridview-under-line"]];
            underLine1.frame = CGRectMake(0, buttonHeight, 107, 1);
            
            [self addSubview: button1];
            [self addSubview: line1];
            [self addSubview: underLine1];
        }
        
        if (dataItem2)
        {
           
            
            NSString *imageName = [dataItem2 objectForKey:@"iconImage"];
            button2 = [[UIButton alloc] init];
            button2.frame = CGRectMake(buttonWidth + 1, 0, buttonWidth, buttonHeight);
            [button2 setImage:[UIImage imageNamed: imageName] forState:UIControlStateNormal];
            [button2 setBackgroundImage:[UIImage imageNamed:@"clothe-gridview-cell-hightlight"] forState:UIControlStateHighlighted];
            button2.tag = 2;
            [button2 addTarget:self action:@selector(itemButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
            
            line2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"clothe-gridview-seperation-line"]] ;
            line2.frame = CGRectMake(buttonWidth * 2 + 1, 0, 1, 121);
            
            underLine2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"clothe-gridview-under-line"]];
            underLine2.frame = CGRectMake(buttonWidth + 1, buttonHeight, 107, 1);

            [self addSubview: button2];
            [self addSubview: line2];
            [self addSubview: underLine2];
        }
        
        if (dataItem3)
        {

        
            NSString *imageName = [dataItem3 objectForKey:@"iconImage"];
            button3 = [[UIButton alloc] init];
            button3.frame = CGRectMake(buttonWidth * 2 + 2, 0, buttonWidth, buttonHeight);
            [button3 setImage:[UIImage imageNamed: imageName] forState:UIControlStateNormal];
            [button3 setBackgroundImage:[UIImage imageNamed:@"clothe-gridview-cell-hightlight"] forState:UIControlStateHighlighted];
            button3.tag = 3;
            [button3 addTarget:self action:@selector(itemButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
            
            underLine3 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"clothe-gridview-under-line"]];
            underLine3.frame = CGRectMake(buttonWidth * 2 + 2, buttonHeight, 107, 1);
            
            [self addSubview: button3];
            [self addSubview: underLine3];
        }
        
    }
    return self;
}
-(void)itemButtonTapped:(id) sender
{
    switch (((UIButton*) sender).tag) 
    {
        case 1:
            [delegate presentGridViewCellDetail:dataItem1];
            break;
        case 2:
            [delegate presentGridViewCellDetail:dataItem2];
            break;
        default:
            [delegate presentGridViewCellDetail:dataItem3];
            break;
    }
}
-(void) adjustCell:(NSDictionary*) data1 item2:(NSDictionary*) data2 item3:(NSDictionary*) data3
{
    dataItem1 = data1;
    NSString *imageName = [data1 objectForKey:@"iconImage"];
    [button1 setImage:[UIImage imageNamed: imageName] forState:UIControlStateNormal];
    
    if (data2)
    {
        imageName = [data2 objectForKey:@"iconImage"];
        [button2 setImage:[UIImage imageNamed: imageName]  forState:UIControlStateNormal];
        [button2 setHidden: NO];
        [underLine2 setHidden: NO];
        dataItem2 = data2;
        
        if (data3)
        {
            imageName = [data3 objectForKey:@"iconImage"];
            [button3 setImage:[UIImage imageNamed: imageName] forState:UIControlStateNormal];
            [button3 setHidden: NO];
            [underLine3 setHidden: NO];
            [line2   setHidden: NO];
            dataItem3 = data3;
        }
        else
        { 
            [button3 setHidden: YES];
            [underLine3 setHidden:YES];
            dataItem3 = nil;
        }
    }
    else
    {
        [button2 setHidden: YES];
        [button3 setHidden: YES];
        [underLine2 setHidden: YES];
        [underLine3 setHidden: YES];
        [line2   setHidden: YES];
        dataItem2 = nil;
        dataItem3 = nil;
    }
}

-(void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
}

@end
