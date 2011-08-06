//
//  SISOutlineWindowController.m
//  SISItemLibrary
//
//  Created by Erik Stainsby on 2011/08/04.
//  Copyright 2011 Roaring Sky Software. All rights reserved.
//

#import "SISOutlineWindowController.h"
#import "SISItem.h"

@implementation SISOutlineWindowController

@synthesize content;

- (id)initWithWindow:(NSWindow *)window
{
    if(nil != (self = [super initWithWindow:window])) 
    {
        // Initialization code here.
    }
    
    return self;
}

- (void)windowDidLoad
{
    [super windowDidLoad];
    
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
    // [[self window] setTitle:@"Library as outline view"];
    
    NSArray *subs1 = [[[self window] contentView] subviews];
    NSScrollView * scv = [subs1 objectAtIndex:0];
    NSArray * subs2 = [scv subviews];
    NSClipView * clv = [subs2 objectAtIndex:0];
    NSArray * subs3 = [clv subviews];
    NSTableView * myOutline = [subs3 objectAtIndex:0];
    
    [myOutline setDataSource: self];
    NSLog( @"%@ [%04d] outline dataSource set",[self class], __LINE__ );
    
    [myOutline reloadData];
    NSLog( @"%@ [%04d] outline data reloaded",[self class], __LINE__ );
    
    NSLog( @"%@ [%04d] windowDidLoad complete",[self class], __LINE__ );
}


#pragma mark NSOutlineViewDataSource protocol conformance

- (id)outlineView:(NSOutlineView *)outlineView child:(NSInteger)index ofItem:(id)item
{
    return (SISItem *)[content objectAtIndex: [outlineView rowForItem: item]];
}
- (BOOL)outlineView:(NSOutlineView *)outlineView isItemExpandable:(id)item 
{
    return NO;
}

- (NSInteger)outlineView:(NSOutlineView *)outlineView numberOfChildrenOfItem:(id)item 
{
    NSInteger count=0;
    if (self.content  && item == nil)
    {
        count=[self.content count];
    }
    return count;
}

- (id)outlineView:(NSOutlineView *)outlineView objectValueForTableColumn:(NSTableColumn *)tableColumn byItem:(id)item
{
    // most returns will be NSStrings, but NSImage is also possible here with the correct cell type to match
    
    id returnValue=nil;   
    
    NSString * columnIdentifer = [tableColumn identifier];
    
    SISItem * this = [content objectAtIndex: [outlineView rowForItem: item]];
    
    // Compare each column identifier and set the return value to
    // the field value appropriate for the column
    
    if ([columnIdentifer isEqualToString: kSISItemName]) {
        returnValue = this.name;
    }
    if ([columnIdentifer isEqualToString: kSISItemCategory]) {
        returnValue = this.category;
    }
    if ([columnIdentifer isEqualToString: kSISItemUsage]) {
        returnValue = this.usage;
    }
    if ([columnIdentifer isEqualToString: kSISItemIcon]) {
        returnValue = this.icon;
    }
    
    return returnValue;
    
}


@end
