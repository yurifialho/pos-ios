//
//  Calculadora.m
//  Calculadora
//
//  Created by ios on 21/03/15.
//  Copyright (c) 2015 ios. All rights reserved.
//

#import "Calculadora.h"

@implementation Calculadora

- (id) initAcumulador: (float) n
{
    if (self = [super init])
    {
        self.acumulador = n;
    }
    return self;
}

- (float) somar : (float) n
{
    return self.acumulador += n;
}

- (float) subtrair : (float) n
{
    return self.acumulador -= n;
}

- (float) multiplicar : (float) n
{
    return self.acumulador *= n;
}

- (float) dividir : (float) n
{
    return self.acumulador /= n;
}

@end
