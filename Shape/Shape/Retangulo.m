//
//  Retangulo.m
//  Shape
//
//  Created by ios on 21/03/15.
//  Copyright (c) 2015 ios. All rights reserved.
//

#import "Retangulo.h"

@implementation Retangulo

- (id) initAltura: (int) a largura: (int) l
{
    if(self = [super init])
    {
        self.altura = a;
        self.largura = l;
    }
    return self;
}

- (int) area
{
    return self.altura * self.largura;
}

- (int) perimetro
{
    return 2 * self.altura + 2 * self.largura;
}

- (int) compare: (Retangulo *) r
{
    int area1 = [self area];
    int area2 = [r area];
    
    if( area1 > area2) return 1 ;
    if( area2 > area1) return -1;
    
    return 0;
    
}

- (void) imprimir
{
    
    for(int x = 1; x <= self.altura; x++) {
        NSString * valor = @"";
        for(int y = 1; y <= self.largura; y++)
        {
            if((x == 1 && y == 1) || (x == 1 && y == self.largura) ||
               (x == self.altura && y == 1) || (x == self.altura && y == self.largura))
            {
                valor = [valor stringByAppendingString: @"†"];
            } else if (x == 1 || x == self.altura) {
                valor = [valor stringByAppendingString: @"-"];
            } else if (y == 1 || y == self.largura) {
                valor = [valor stringByAppendingString: @"|"];
            } else {
                valor = [valor stringByAppendingString: @"0"];
            }
        }
        NSLog(@"%@", valor);
    }
}

@end
