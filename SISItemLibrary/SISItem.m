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
@synthesize categories;
@synthesize usage;
@synthesize icon;
@synthesize image;
@synthesize parent;
@synthesize children;


- (id) init 
{
    if( nil != (self = [super init])) 
    {
        // vanilla object for manually building initial instances
    }
    return self;
}

- (id) initWithDictionary:(NSDictionary *) dict
{
    if( nil != (self = [super init])) 
    {
        [self setName: [dict objectForKey:kSISItemName]];
        [self setCategories: [dict objectForKey:kSISItemCategories]];
        [self setUsage: [dict objectForKey:kSISItemDescription]];
        [self setIcon: [dict objectForKey:kSISItemIcon]];
        [self setImage: [self imageFromIconName]];
        [self setParent: [dict objectForKey: kSISItemParent]];
        [self setChildren: [dict objectForKey: kSISItemChildren]];
    }  
    return self;
}


- (id) initWithCoder:(NSCoder *) coder
{
    if( nil != (self = [super init])) 
    {
        [self setName: [coder decodeObjectForKey:kSISItemName]];
        [self setCategories: [coder decodeObjectForKey:kSISItemCategories]];
        [self setUsage: [coder decodeObjectForKey:kSISItemUsage]];
        [self setIcon: [coder decodeObjectForKey:kSISItemIcon]];
        [self setImage: [coder decodeObjectForKey:kSISItemImage]];
        [self setParent: [coder decodeObjectForKey: kSISItemParent]];
        [self setChildren: [coder decodeObjectForKey: kSISItemChildren]];
    }  
    return self;
}

-(void) encodeWithCoder:(NSCoder *) coder 
{
    [coder encodeObject:[self name] forKey:kSISItemName];
    [coder encodeObject:[self categories] forKey:kSISItemCategories];
    [coder encodeObject:[self usage] forKey:kSISItemUsage];
    [coder encodeObject:[self icon] forKey:kSISItemIcon];
    [coder encodeObject:[self image] forKey:kSISItemImage];
    [coder encodeObject:[self parent] forKey:kSISItemParent];
    [coder encodeObject:[self children] forKey:kSISItemChildren];
}


-(NSString *) categoryList
{
    NSArray * cats = self.categories;
    NSString * catString;

    for(NSUInteger i=0; i<cats.count; i++)
    {
        NSString * s = [cats objectAtIndex:i];
        NSLog( @"\t\t-- category: %@",s);
        if(i==0) 
        {
            catString = [NSString stringWithFormat:@"%@",s];
        }
        else 
        {
            catString = [catString stringByAppendingString:[NSString stringWithFormat:@",%@",s]];
        }
    }
    [cats release];
    return catString;
}


-(NSString *) description
{
    NSString * ret = [NSString stringWithFormat: @"%@",[self class],nil];
    
    return ret;
}

-(NSImage *) imageFromIconName
{
    return [[NSImage alloc] initWithContentsOfURL: [[NSURL alloc] initFileURLWithPath: [[NSBundle mainBundle] pathForImageResource:[self icon]]]];
}


@end

