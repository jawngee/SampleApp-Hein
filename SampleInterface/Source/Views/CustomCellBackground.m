//
//  CustomCellBackground.m
//  SampleInterface
//
//  Created by Doan The Hien on 11/23/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "CustomCellBackground.h"

@implementation CustomCellBackground

-(id)init
{
    if ((self = [super init])) 
    {
        NSString *imageName = @"home-background-cell";
        UIImageView *background = [[[UIImageView alloc] initWithImage:[UIImage imageNamed:imageName]] autorelease];
        [self addSubview:background];
    }
    return self;
}

@end
