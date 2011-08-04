//
//  SISItem.m
//  SISItemLibrary
//
//  Created by Erik Stainsby on 2011/08/01.
//  Copyright 2011 Roaring Sky Software. All rights reserved.
//

#import "SISItem.h"

@implementation SISItem

@synthesize name;
@synthesize category;
@synthesize usage;
@synthesize icon;

- (id) init 
{
    if( nil != (self = [super init])) 
    {
        // vanilla object for manually building initial instances
    }
    return self;
}


- (id)initWithCoder:(NSCoder *) coder
{
    if( nil != (self = [super init])) 
    {
        [self setName: [coder decodeObjectForKey:kSISItemName]];
        [self setCategory: [coder decodeObjectForKey:kSISItemCategory]];
        [self setUsage: [coder decodeObjectForKey:kSISItemUsage]];
        [self setIcon: [coder decodeObjectForKey:kSISItemIcon]];
    }  
    return self;
}

-(void) encodeWithCoder:(NSCoder *) coder 
{
    [coder encodeObject:[self name] forKey:kSISItemName];
    [coder encodeObject:[self category] forKey:kSISItemCategory];
    [coder encodeObject:[self usage] forKey:kSISItemUsage];
    [coder encodeObject:[self icon] forKey:kSISItemIcon];
}

@end

