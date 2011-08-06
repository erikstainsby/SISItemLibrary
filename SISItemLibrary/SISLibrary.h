//
//  SISLibrary.h
//  SISItemLibrary
//
//  Created by Erik Stainsby on 2011/07/31.
//  Copyright 2011 Roaring Sky Software. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface SISLibrary : NSDocument <NSTableViewDataSource> {
@private
    NSMutableArray * myModel;
}

@property (readwrite, retain) NSMutableArray IBOutlet * myModel;

-(void) populateMyModelArray;




@end
