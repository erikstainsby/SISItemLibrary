//
//  SISItemArrayController.m
//  SISItemLibrary
//
//  Created by Erik Stainsby on 2011/08/07.
//  Copyright 2011 Roaring Sky Software. All rights reserved.
//

#import "SISItemArrayController.h"
#import "SISItem.h"

@implementation SISItemArrayController

- (id)init
{
    if( nil != (self = [super init])) 
    {
        // eventually this will look for a stored document which represents the library view as the user last saved it;
        // currently however, we always initialize from scanning the mainBundle for plug-in plist files to load from scratch
        
        NSLog( @"%@ [%04d] init called",[self class], __LINE__ );
        
        NSError ** err;
        NSBundle * myBundle = [NSBundle mainBundle];
        NSString * resPath = [myBundle resourcePath];
        NSString * startupDir = [resPath stringByAppendingPathComponent:@"Startup"];
        
        NSLog( @"%@ [%04d] resource path: %@",[self class], __LINE__, startupDir);
        
        NSArray * startupFiles = [NSBundle pathsForResourcesOfType: @"plist" inDirectory: resPath];
        NSLog( @"%@ [%04d] located %lu start up files",[self class], __LINE__,[startupFiles count]);

        NSRange ofInterest = NSMakeRange(0,8);
        NSString * myPrefix = @"SISItem-";
        for( NSString * fPath in startupFiles)
        {
            NSString * lastComponent = [fPath lastPathComponent];
            NSString *pref = [lastComponent substringWithRange: ofInterest];
            NSLog( @"%@ [%04d] examining file: %@",[self class],__LINE__,lastComponent);
            if( [pref isEqualToString: myPrefix] ) 
            {
                NSData * xmlData = [NSData dataWithContentsOfFile:fPath];
                NSLog( @"\t\t-- have xml data");
                
                NSDictionary * dict = (NSDictionary *)[NSPropertyListSerialization propertyListWithData:xmlData 
                                                                            options:NSPropertyListMutableContainersAndLeaves 
                                                                             format:NULL
                                                                              error: err];
                if(!dict) {
                    NSLog( @"%@ [%04d] Error reading plist: %@", [self class], __LINE__, err);
                }
                NSLog( @"\t\t-- have dictionary"); // :\n%@", dict);
                
                NSDictionary * d = [dict objectForKey:@"item"];
                SISItem * item = [[SISItem alloc] initWithDictionary: d];
                [self addObject: item];
                NSLog( @"\t\t-- added to model item: %@, in categories: %@",[item name],[item categoryList]);
                [item release];
                [d release];
                [dict release];
                [xmlData release];
            }
            else {
                NSLog( @"%@ [%04d] was not a file of interest to us",[self class],__LINE__);
            }
        }
    }
    NSLog( @"%@ [%04d] init complete",[self class], __LINE__ );
    return self;
}


@end
