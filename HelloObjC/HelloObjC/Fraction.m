//
//  Fraction.m
//  HelloObjC
//
//  Created by ios on 21/03/15.
//  Copyright (c) 2015 ios. All rights reserved.
//

#import "Fraction.h"

@implementation Fraction

- (id) initWithNumerator: (int)n denominator: (int) d
{
    self = [super init];
    if(self) {
        self.numerator   = n;
        self.denominator = d;
    }
    
    return self;
}

- (void) print
{
    NSLog(@"Numerator: %i, Denominator: %i", self.numerator, self.denominator);
}

- (void) print: (int) n
{
    NSLog(@"Chamou....: %i", n);
}

- (void) setNumerator: (int)n denominator:(int) d;
{
    self.numerator = n;
    self.denominator = d;
}

@end
