//
//  Note.h
//  SampleApp
//
//  Created by Doan The Hien on 11/12/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <CoreData/CoreData.h>

@interface Note : NSManagedObject

@property (nonatomic, retain) NSString *content;
@property (nonatomic, retain) NSString *date;
@property (nonatomic, retain) NSString *name;

@end
