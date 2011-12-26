//
//  PFIDataManager.m
//  SampleInterface
//
//  Created by Doan The Hien on 12/13/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "PFIDataManager.h"
#import "ASIHTTPRequest.h"
#import "JSONKit.h"


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
-(void)loadMapItems:(PFIDataManagerCompleteBlock) block
{
    mapItemBlock = [block copy];
    NSURL *url = [NSURL URLWithString:@"http://robe.local/robe/locations/"];
    __block ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
    
    [request setCompletionBlock:^
     {
         NSString *responseString=[request responseString];
         NSArray *myArray=[responseString objectFromJSONString];
         mapItemBlock(myArray);
         [mapItemBlock release];
     }];
    
    [request setFailedBlock:^
     {
         //NSError *error = [request error];
     }];
    [request startAsynchronous];
}
-(void)loadClotheGridViewItems:(PFIDataManagerCompleteBlock) block
{
    gridItemBlock = [block copy];
    NSURL *url = [NSURL URLWithString:@"http://robe.local/robe/products/"];
    __block ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
    
    [request setCompletionBlock:^
     {
         NSString *responseString=[request responseString];
         NSArray *myArray=[responseString objectFromJSONString];
         gridItemBlock(myArray);
         [gridItemBlock release];
     }];
    
    [request setFailedBlock:^
     {
         //NSError *error = [request error];
     }];
    [request startAsynchronous];
}
-(void) loadHomeNewsItems:(PFIDataManagerCompleteBlock) block
{
    dasBlock = [block copy];
    NSURL *url = [NSURL URLWithString:@"http://robe.local/robe/news/"];
    __block ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
    
    [request setCompletionBlock:^
     {
         NSString *responseString=[request responseString];
         NSArray *myArray=[responseString objectFromJSONString];
         dasBlock(myArray);
         [dasBlock release];
     }];
    
    [request setFailedBlock:^
     {
         //NSError *error = [request error];
     }];
    [request startAsynchronous];
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
