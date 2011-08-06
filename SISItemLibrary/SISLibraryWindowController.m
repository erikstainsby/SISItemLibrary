//
//  SISLibraryWindowController.m
//  SISItemLibrary
//
//  Created by Erik Stainsby on 2011/07/31.
//  Copyright 2011 Roaring Sky Software. All rights reserved.
//

#import "SISLibraryWindowController.h"
#import "SISItem.h"

@implementation SISLibraryWindowController

@synthesize content;

- (id)initWithWindow:(NSWindow *)window
{
    if(nil != (self = [super initWithWindow:window])) 
    {
        // Initialization code here.
        NSLog( @"%@ [%04d] init complete",[self class], __LINE__ );
    }
    
    return self;
}

- (void)windowDidLoad
{
    [super windowDidLoad];
    
    // Implement this method to handle any initialization after 
    // your window controller's window has been loaded from its nib file.
    
    //[[self window] setTitle:@"Library as table view"];
    
    NSArray *subs1 = [[[self window] contentView] subviews];
    NSScrollView * scv = [subs1 objectAtIndex:0];
    NSArray * subs2 = [scv subviews];
    NSClipView * clv = [subs2 objectAtIndex:0];
    NSArray * subs3 = [clv subviews];
    NSTableView * myTable = [subs3 objectAtIndex:0];

    [myTable setDataSource: self];
    
    NSLog( @"%@ [%04d] table dataSource set to self",[self class], __LINE__ );
    
    [myTable reloadData];
    NSLog( @"%@ [%04d] table data reloaded",[self class], __LINE__ );
    
    NSLog( @"%@ [%04d] windowDidLoad complete",[self class], __LINE__ );
}

#pragma mark NSTableViewDataSource protocol conformance
-(NSInteger) numberOfRowsInTableView:(NSTableView *)tableView {
    NSInteger count=0;
    if (self.content)
        count=[self.content count];
    return count;
}

-(id) tableView:(NSTableView *)tableView objectValueForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row 
{
    // most returns will be NSStrings, but NSImage is also possible here with the correct cell type to match
    
    id returnValue=nil;   
    
    NSString * columnIdentifer = [tableColumn identifier];
    
    SISItem * this = (SISItem *)[content objectAtIndex:row];
    
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
    if ([columnIdentifer isEqualToString: kSISItemParent]) {
        returnValue = @"none";
        if( this != nil ) {
            SISItem * p = (SISItem *) this.parent;
            returnValue = p.name;
            [p release];
        }
        
    }
    if ([columnIdentifer isEqualToString: kSISItemChildren]) {
        returnValue = @"none";
        if( this != nil ) {
            NSArray * a = [[NSArray alloc] initWithArray: this.children];
            returnValue = [NSString stringWithFormat:@"%i",[a count]];
            [a release];
        }
    }
    
    return returnValue;
}


@end
