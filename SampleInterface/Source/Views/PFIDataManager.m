//
//  PFIDataManager.m
//  SampleInterface
//
//  Created by Doan The Hien on 12/13/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "PFIDataManager.h"

@implementation PFIDataManager

static PFIDataManager* sharedDataManager;

+(PFIDataManager*)sharedManager
{
    if (sharedDataManager == nil)
    {
        sharedDataManager = (PFIDataManager*)[[self alloc] init];
    }
    return sharedDataManager;
}
-(id)init
{
    if (self = [super init])
    {
        
    }
    return self;
}
-(NSArray*)getHomeNewsItems
{
    if(homeNewsData == nil)
    {
        NSString *dataPath = [[NSBundle mainBundle] pathForResource:@"HomeData" ofType:@"plist"];
        NSDictionary *loadedFile=[NSDictionary dictionaryWithContentsOfFile:dataPath];
        homeNewsData = [loadedFile allValues];
    }
    return homeNewsData;
}

-(NSArray*)getClotheDataItems
{
    if(clotheData == nil)
    {
        NSString *dataPath = [[NSBundle mainBundle] pathForResource:@"ClotheData" ofType:@"plist"];
        NSDictionary *loadedFile=[NSDictionary dictionaryWithContentsOfFile:dataPath];
        clotheData = [loadedFile allValues];
    }
    return clotheData;
}

-(NSArray*)getClotheDataGridViewItems
{
    if(clotheDataGridView == nil)
    {
        NSString *dataPath = [[NSBundle mainBundle] pathForResource:@"ClotheGridViewData" ofType:@"plist"];
        NSDictionary *loadedFile=[NSDictionary dictionaryWithContentsOfFile:dataPath];
        clotheDataGridView = [loadedFile allValues];
    }
    return clotheDataGridView;
}

-(NSArray*)getClotheSexDataItems
{
    if(clotheSexData == nil)
    {
        NSString *dataPath = [[NSBundle mainBundle] pathForResource:@"ClotheSexData" ofType:@"plist"];
        NSDictionary *loadedFile=[NSDictionary dictionaryWithContentsOfFile:dataPath];
        clotheSexData = [loadedFile allValues];
    }
    return clotheSexData;
}

-(NSArray*)getMapDataItems;
{
    if(mapData == nil)
    {
        NSString *dataPath = [[NSBundle mainBundle] pathForResource:@"MapDataItem" ofType:@"plist"];
        NSDictionary *loadedFile=[NSDictionary dictionaryWithContentsOfFile:dataPath];
        mapData = [loadedFile allValues];
    }
    return mapData;
}

-(void)dealloc
{
    [homeNewsData release];
    [clotheData release];
    [clotheDataGridView release];
    [clotheSexData release];
    [mapData release];
    [super dealloc];
    
}
@end
