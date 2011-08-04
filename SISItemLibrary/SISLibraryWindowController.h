//
//  SISLibraryWindowController.h
//  SISItemLibrary
//
//  Created by Erik Stainsby on 2011/07/31.
//  Copyright 2011 Roaring Sky Software. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface SISLibraryWindowController : NSWindowController{
    NSInteger * indent;
}

@property (readwrite,assign) NSInteger * indent;
@end
