//
//  SISLibraryWindowController.h
//  SISItemLibrary
//
//  Created by Erik Stainsby on 2011/07/31.
//  Copyright 2011 Roaring Sky Software. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface SISLibraryWindowController : NSWindowController <NSTableViewDataSource>{
@private
    
} 

@property (readwrite,assign) IBOutlet NSMutableArray * content;  // reference to (not copy of) the Library's myModel array

#pragma mark NSTableViewDataSource protocol conformance
-(NSInteger) numberOfRowsInTableView:(NSTableView *)tableView;
-(id) tableView:(NSTableView *)tableView objectValueForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row;

@end