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

typedef void(^PFIDataManagerCompleteBlock)(id);

@protocol PFIDataManagerProtocol 

-(void)loadHomeNewsItems:(NSArray*)data;

@end

@interface PFIDataManager : NSObject
{
    NSArray *homeNewsData;
    NSArray *clotheData;
    NSArray *clotheDataGridView;
    NSArray *clotheSexData;
    NSArray *mapData;
    PFIDataManagerCompleteBlock dasBlock;
    PFIDataManagerCompleteBlock gridItemBlock;
    PFIDataManagerCompleteBlock mapItemBlock;

}

+(PFIDataManager*)sharedManager;
-(NSArray*)getClotheDataItems;
-(NSArray*)getClotheDataGridViewItems;
-(NSArray*)getClotheSexDataItems;
-(NSArray*)getMapDataItems;
-(void)loadHomeNewsItems:(PFIDataManagerCompleteBlock) block;
-(void)loadClotheGridViewItems:(PFIDataManagerCompleteBlock) block;
-(void)loadMapItems:(PFIDataManagerCompleteBlock) block;

@end
