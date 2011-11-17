//
//  CustomCellBackground.h
//  CoreGraphicSamp
//
//  Created by Doan The Hien on 11/15/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomCellBackground : UIView{
    
    BOOL _lastCell;
    BOOL _selected;
}
@property  BOOL lastCell;
@property  BOOL selected;
@end
