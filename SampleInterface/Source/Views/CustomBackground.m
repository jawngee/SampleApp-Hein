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
        CGRect screen   = [[UIScreen mainScreen] bounds];
        int ratioScreen = screen.size.width / 320;
        NSString *imageName;
        if (ratioScreen == 1) imageName = @"global-background-cell.png";
        else imageName = @"global-background-cell@2x.png";
        
        UIImageView *background = [[[UIImageView alloc] initWithImage:[UIImage imageNamed:imageName]] autorelease];
        [self addSubview:background];
    }
    return self;
}
@end
