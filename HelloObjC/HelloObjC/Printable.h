//
//  Printable.h
//  HelloObjC
//
//  Created by ios on 21/03/15.
//  Copyright (c) 2015 ios. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol Printable <NSObject>

@required
- (void) print;

@optional
- (void) print: (int) n;


@end
