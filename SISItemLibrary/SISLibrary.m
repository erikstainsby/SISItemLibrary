//
//  SISLibrary.m
//  SISItemLibrary
//
//  Created by Erik Stainsby on 2011/07/31.
//  Copyright 2011 Roaring Sky Software. All rights reserved.
//

#import "SISLibrary.h"
#import "SISLibraryWindowController.h"
#import "SISLibraryTVCellWindowController.h"
#import "SISItem.h"

@implementation SISLibrary

@synthesize myModel;  /* mutable array of SIS Item objects  */

- (id)init
{
    if( nil != (self = [super init])) 
    {
        // Add your subclass-specific initialization here.
        // If an error occurs here, send a [self release] message and return nil.
        
        myModel = [NSMutableArray array];
        
        [self populateMyModelArray];
        
        NSLog( @"%@ [%04d] myModel count: %lu",[self class], __LINE__, [myModel count]);
        
        NSLog( @"%@ [%04d] init complete",[self class], __LINE__ );
    }
    return self;
}


-(NSImage *) imageFromIconName: (id) sender
{
    SISItem * item = (SISItem *) sender;
    NSString * iconName = [item icon];
    NSString * path = [[NSBundle mainBundle] pathForImageResource:iconName];
    
    NSLog( @"%@ [%04d] icon name: %@ full path: %@", [self class], __LINE__, [sender icon], path);
    
    NSURL * imgURL = [[NSURL alloc] initFileURLWithPath: path];
    NSImage * img = [[NSImage alloc] initWithContentsOfURL: imgURL];
    return img;
}

-(void) populateMyModelArray
{
    SISItem * i0 = [[SISItem alloc] init];
    SISItem * i1 = [[SISItem alloc] init];
    SISItem * i2 = [[SISItem alloc] init];
    SISItem * i3 = [[SISItem alloc] init];

    [i0 setName: @"Page"];
    [i1 setName: @"Head"];
    [i2 setName: @"Body"];
    [i3 setName: @"Paragraph"];
    
    [i0 setCategory:@"container"];
    [i1 setCategory:@"metadata"];
    [i2 setCategory:@"structure"];
    [i3 setCategory:@"flow"];
    
    [i0 setUsage: @"container for an HTML document"];
    [i1 setUsage: @"container for document metadata"];
    [i2 setUsage: @"container for HTML content"];
    [i3 setUsage: @"container for author content"];
    
    [i0 setIcon: @"page.png"];
    [i1 setIcon: @"head.png"];
    [i2 setIcon: @"body.png"];
    [i3 setIcon: @"p.png"];
    
    [i0 setImage: [self imageFromIconName: i0]];
    [i1 setImage: [self imageFromIconName: i1]];
    [i2 setImage: [self imageFromIconName: i2]];
    [i3 setImage: [self imageFromIconName: i3]];
    
    [i0 setParent: nil];
    [i1 setParent: i0];
    [i2 setParent: i0];
    [i3 setParent: i2];
    
    [i0 setChildren: [NSMutableArray arrayWithObjects:i1, i2,nil]];
    [i1 setChildren: [NSMutableArray array]];
    [i2 setChildren: [NSMutableArray arrayWithObjects:i3, nil]];
    [i3 setChildren: [NSMutableArray array]];
    
    
    //NSLog( @"%@ [%04d] my model element i0: %@",[self class], __LINE__, i0);
    
    
    [myModel addObject: i0];
    [myModel addObject: i1];
    [myModel addObject: i2];
    [myModel addObject: i3];
    
    
    [i0 release];
    [i1 release];
    [i2 release];
    [i3 release];
    
    NSLog( @"%@ [%04d] populatemyModelArray complete",[self class], __LINE__);
}


- (void) makeWindowControllers {
    
    NSLog(@"%@ [%04d] makeWindowControllers started",[self class], __LINE__ );
    
    SISLibraryWindowController * ctlr01 = [[SISLibraryWindowController alloc] initWithWindowNibName: @"SISLibraryWindow"];
    
    [self addWindowController: ctlr01];
    [ctlr01 setContent: myModel];
    [ctlr01 showWindow:self];
    [ctlr01 release];
    
    SISLibraryTVCellWindowController * ctlr02 = [[SISLibraryTVCellWindowController alloc] initWithWindowNibName: @"SISLibraryTVCellWindow"];
    
    [self addWindowController: ctlr02];
    [ctlr02 setContent: myModel];
    [ctlr02 showWindow:self];
    [ctlr02 release];
    
    NSLog( @"%@ [%04d] makeWindowControllers complete",[self class], __LINE__ );
}


-(void) windowControllerWillLoadNib:(NSWindowController *)windowController 
{    
    NSLog( @"%@ [%04d] windowControllerWillLoadNib complete",[self class], __LINE__ );
}

-(void) windowControllerDidLoadNib:(NSWindowController *)windowController 
{    
    NSLog( @"%@ [%04d] windowControllerDidLoadNib complete",[self class], __LINE__ );
}

- (NSData *)dataOfType:(NSString *)typeName error:(NSError **)outError
{
    /*
     Insert code here to write your document to data of the specified type. If outError != NULL, ensure that you create and set an appropriate error when returning nil.
    You can also choose to override -fileWrapperOfType:error:, -writeToURL:ofType:error:, or -writeToURL:ofType:forSaveOperation:originalContentsURL:error: instead.
    */
    if (outError) {
        *outError = [NSError errorWithDomain:NSOSStatusErrorDomain code:unimpErr userInfo:NULL];
    }
    return nil;
}

- (BOOL)readFromData:(NSData *)data ofType:(NSString *)typeName error:(NSError **)outError
{
    /*
    Insert code here to read your document from the given data of the specified type. If outError != NULL, ensure that you create and set an appropriate error when returning NO.
    You can also choose to override -readFromFileWrapper:ofType:error: or -readFromURL:ofType:error: instead.
    If you override either of these, you should also override -isEntireFileLoaded to return NO if the contents are lazily loaded.
    */
    if (outError) {
        *outError = [NSError errorWithDomain:NSOSStatusErrorDomain code:unimpErr userInfo:NULL];
    }
    return YES;
}

+ (BOOL)autosavesInPlace
{
    return YES;
}



@end


