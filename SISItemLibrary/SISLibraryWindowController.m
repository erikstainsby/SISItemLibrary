//
//  SISLibraryWindowController.m
//  SISItemLibrary
//
//  Created by Erik Stainsby on 2011/07/31.
//  Copyright 2011 Roaring Sky Software. All rights reserved.
//

#import "SISLibraryWindowController.h"

@implementation SISLibraryWindowController


@synthesize indent;

- (id)initWithWindow:(NSWindow *)window
{
    if(nil != (self = [super initWithWindow:window])) 
    {
        self.indent = 0;
        // Initialization code here.
        NSLog( @"%@ [%04d] init complete",[self class], __LINE__ );
    }
    
    return self;
}

-(void) increment
{
    self.indent += 1;
}

-(void) decrement
{
    self.indent -= 1; 
}


- (void) listSubviewClasses: thisview
{
    
    NSArray * subs = [thisview subviews];
    if( -1 == subs.count)
        return;
    
    NSString * myIndent = @"";
    for( NSInteger *i = 0; i <= self.indent; i++)
    {
        myIndent = [myIndent stringByAppendingString:@"\t"];
    }
    
    NSLog(@"%@ [%04d] %@subview class: %@",[self class], __LINE__, myIndent, [thisview class] );
    
    NSLog(@"-->");
    [self increment];
    
    for(NSView *v in subs)
    {
        [self listSubviewClasses: v];
    }
    [self decrement];
    NSLog(@"<--");
}

- (void)windowDidLoad
{
    [super windowDidLoad];
    
    // Implement this method to handle any initialization after 
    // your window controller's window has been loaded from its nib file.
    
    NSArray *subs1 = [[[self window] contentView] subviews];
    
    NSScrollView * scv = [subs1 objectAtIndex:0];
    NSArray * subs2 = [scv subviews];
    NSClipView * clv = [subs2 objectAtIndex:0];
    NSArray * subs3 = [clv subviews];
    NSTableView * myTable = [subs3 objectAtIndex:0];
    
    /*
    indent = 0;
    
    for(NSView *v in subs2)
    {
        [self listSubviewClasses: clipview];
    }
    */

    [myTable setDataSource: [self document]];
    
    NSLog( @"%@ [%04d] table dataSource set",[self class], __LINE__ );
    
    [myTable reloadData];
    
    NSLog( @"%@ [%04d] windowDidLoad complete",[self class], __LINE__ );
}

@end
