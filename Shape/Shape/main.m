//
//  main.m
//  Shape
//
//  Created by ios on 21/03/15.
//  Copyright (c) 2015 ios. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Retangulo.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Retangulo * r1 = [[Retangulo alloc] initAltura:10 largura: 20];
        NSLog(@" Altura: %i Largura: %i Area: %i Perimetro: %i",
              r1.altura, r1.largura, [r1 area], [r1 perimetro]);

        Retangulo * r2 = [[Retangulo alloc] initAltura:100 largura:100];
        NSLog(@" Altura: %i Largura: %i Area: %i Perimetro: %i",
              r2.altura, r2.largura, [r2 area], [r2 perimetro]);
        
        if([r1 compare:r2] == 1) {
            NSLog(@"Retangulo 1 maior que Retangulo 2");
        } else if ([r1 compare:r2] == -1) {
            NSLog(@"Retangulo 2 maior que Retangulo 1");
        } else {
            NSLog(@"Retangulo 1 igual Retangulo 2");
        }
        
        [r1 imprimir];
        [r2 imprimir];
        
    }
    return 0;
}
