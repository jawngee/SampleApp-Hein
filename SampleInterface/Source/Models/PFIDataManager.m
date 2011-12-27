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

@synthesize homeNewsData;
@synthesize clotheDataGridView;
@synthesize mapData;

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
-(void)dealloc
{
    [homeNewsData release];
    [clotheData release];
    [clotheDataGridView release];
    [mapData release];
    [clotheSexData release];
    [super dealloc];
    
}
@end
