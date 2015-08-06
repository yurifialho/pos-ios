//
//  Calculadora+Math.m
//  Calculadora
//
//  Created by ios on 21/03/15.
//  Copyright (c) 2015 ios. All rights reserved.
//

#import "Calculadora+Math.h"

@implementation Calculadora (Math)

- (float) raiz
{
    return self.acumulador = sqrtf(self.acumulador);
}

- (float) potencia: (float) n
{
    return self.acumulador = powf(self.acumulador,n);
}
- (float) tangente
{
    return self.acumulador = tanf(self.acumulador);
}

- (float) cosseno
{
    return self.acumulador = cosf(self.acumulador);
}

- (float) seno
{
    return self.acumulador = sinf(self.acumulador);
}


@end
