//
//  PFIDataManager.h
//  SampleInterface
//
//  Created by Doan The Hien on 12/13/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PFIDataManager : NSObject
{
    NSArray *homeNewsData;
    NSArray *clotheData;
    NSArray *clotheDataGridView;
    NSArray *clotheSexData;
    NSArray *mapData;
}

+(PFIDataManager*)sharedManager;
-(NSArray*)getHomeNewsItems;
-(NSArray*)getClotheDataItems;
-(NSArray*)getClotheDataGridViewItems;
-(NSArray*)getClotheSexDataItems;
-(NSArray*)getMapDataItems;
@end
