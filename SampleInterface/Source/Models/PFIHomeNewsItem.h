//
//  PFIHomeNewsItem.h
//  SampleInterface
//
//  Created by Doan The Hien on 12/22/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PFIHomeNewsItem : NSObject
{
    NSString *date;
    NSString *headLine;
    NSString *biLine;
    NSString *subHeader;
    NSString  *icon;
}

@property(assign, readwrite, nonatomic) NSString *date;
@property(assign, readwrite, nonatomic) NSString *headLine;
@property(assign, readwrite, nonatomic) NSString *biLine;
@property(assign, readwrite, nonatomic) NSString *subHeader;
@property(assign, readwrite, nonatomic) NSString *icon;

//-(id)init;

@end
