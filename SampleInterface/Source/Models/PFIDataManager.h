//
//  PFIDataManager.h
//  SampleInterface
//
//  Created by Doan The Hien on 12/13/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIKit/UIkit.h"
#import "JSONKit.h"

@protocol PFIDataManagerProtocol 

-(void)loadHomeNewsItems:(NSArray*)data;

@end

@interface PFIDataManager : NSObject
{
    NSArray *homeNewsData;
    NSArray *clotheDataGridView;
    NSArray *mapData;
    
    NSArray *clotheSexData;
    NSArray *clotheData;
}
@property(assign,readwrite,nonatomic) NSArray *homeNewsData;
@property(assign,readwrite,nonatomic) NSArray *clotheDataGridView;
@property(assign,readwrite,nonatomic) NSArray *mapData;

-(NSArray*)getClotheSexDataItems;
-(NSArray*)getClotheDataItems;
+(PFIDataManager*)sharedManager;


@end
