//
//  SISItem.h
//  SISItemLibrary
//
//  Created by Erik Stainsby on 2011/08/01.
//  Copyright 2011 Roaring Sky Software. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SISItemConstants.h"

@interface SISItem : NSObject <NSCoding> {
    @private
    NSString * name;
    NSString * category;
    NSString * usage;
    NSString * icon;
    NSImage * image;
    SISItem * parent;
    NSMutableArray * children;
}

@property (readwrite,retain) NSString * name;
@property (readwrite,retain) NSMutableArray * categories;
@property (readwrite,retain) NSString * usage;
@property (readwrite,retain) NSString * icon;
@property (readwrite,retain) NSImage * image;
@property (readwrite,retain) SISItem * parent;
@property (readwrite,retain) NSMutableArray * children;

-(NSString *) categoryList;
-(NSImage *) imageFromIconName;

- (id) initWithDictionary:(NSDictionary *) dict;
- (id) initWithCoder:(NSCoder *) coder;

@end
