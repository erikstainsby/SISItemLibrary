//
//  SISOutlineWindowController.h
//  SISItemLibrary
//
//  Created by Erik Stainsby on 2011/08/04.
//  Copyright 2011 Roaring Sky Software. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface SISOutlineWindowController : NSWindowController <NSOutlineViewDataSource>
{

}

@property (readwrite,assign) IBOutlet NSMutableArray * content;  // reference to (not copy of) the Library's myModel array

#pragma mark NSOutlineViewDataSource protocol conformance
- (id)outlineView:(NSOutlineView *)outlineView child:(NSInteger)index ofItem:(id)item;
- (BOOL)outlineView:(NSOutlineView *)outlineView isItemExpandable:(id)item;
- (NSInteger)outlineView:(NSOutlineView *)outlineView numberOfChildrenOfItem:(id)item;
- (id)outlineView:(NSOutlineView *)outlineView objectValueForTableColumn:(NSTableColumn *)tableColumn byItem:(id)item;


@end
