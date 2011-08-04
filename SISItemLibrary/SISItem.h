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
}

@property (readwrite,retain) NSString * name;
@property (readwrite,retain) NSString * category;
@property (readwrite,retain) NSString * usage;
@property (readwrite,retain) NSString * icon;

@end
