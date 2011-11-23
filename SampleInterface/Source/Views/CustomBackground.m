//
//  CustomBackground.m
//  SampleInterface
//
//  Created by Doan The Hien on 11/21/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "CustomBackground.h"
@implementation CustomBackground

-(id)init
{
    if ((self = [super init])) 
    {
        NSString *imageName = @"home-background-tableview";
        UIImageView *background = [[[UIImageView alloc] initWithImage:[UIImage imageNamed:imageName]] autorelease];
        [self addSubview:background];
    }
    return self;
}
@end
