//
//  Fraction.h
//  HelloObjC
//
//  Created by ios on 21/03/15.
//  Copyright (c) 2015 ios. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Printable.h"

@interface Fraction : NSObject <Printable>

@property int denominator;
@property int numerator;

- (id) initWithNumerator: (int)n denominator: (int) d;
- (void) setNumerator: (int)n denominator:(int) d;

@end
