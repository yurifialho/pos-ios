//
//  main.m
//  HelloObjC
//
//  Created by ios on 21/03/15.
//  Copyright (c) 2015 ios. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Fraction.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
    
        Fraction *f = [[Fraction alloc] init];
        [f setNumerator:2 denominator:6];
        
        [f print];
        
        Fraction * frac2 = [[Fraction alloc] initWithNumerator:20 denominator:10];
        
        if([frac2 conformsToProtocol:@protocol(Printable) ])
        {
            [frac2 print];

            if([frac2 respondsToSelector:@selector(print:)])
            {
                [frac2 print: 10];
            }
        }
  
    }
    return 0;
}
