//
//  Calculadora.h
//  Calculadora
//
//  Created by ios on 21/03/15.
//  Copyright (c) 2015 ios. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Calculadora : NSObject

@property float acumulador;

- (id) initAcumulador: (float) n;

- (float) somar : (float) n;
- (float) subtrair : (float) n;
- (float) multiplicar : (float) n;
- (float) dividir : (float) n;

@end
