//
//  main.m
//  Calculadora
//
//  Created by ios on 21/03/15.
//  Copyright (c) 2015 ios. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Calculadora+Math.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
       //Testar calculadora
        Calculadora * calc = [[Calculadora alloc] init];
        
        [calc somar:5];
        NSLog(@"Resultado: %f", calc.acumulador);
        [calc subtrair:2];
        NSLog(@"Resultado: %f", calc.acumulador);
        [calc multiplicar:100];
        NSLog(@"Resultado: %f", calc.acumulador);
        [calc dividir:10];
        NSLog(@"Resultado: %f", calc.acumulador);
        
        Calculadora * calc2 = [[Calculadora alloc] initAcumulador: 10];
        
        [calc2 somar:5];
        NSLog(@"Resultado2: %f", calc2.acumulador);
        [calc2 subtrair:2];
        NSLog(@"Resultado2: %f", calc2.acumulador);
        [calc2 multiplicar:100];
        NSLog(@"Resultado2: %f", calc2.acumulador);
        [calc2 dividir:10];
        NSLog(@"Resultado2: %f", calc2.acumulador);
        
        Calculadora * calc3 = [[Calculadora alloc] initAcumulador: 10];
        
        [calc3 raiz];
        NSLog(@"Resultado3: %f", calc3.acumulador);
        [calc3 potencia:2];
        NSLog(@"Resultado3: %f", calc3.acumulador);
        [calc3 tangente];
        NSLog(@"Resultado3: %f", calc3.acumulador);
        [calc3 cosseno];
        NSLog(@"Resultado3: %f", calc3.acumulador);
        [calc3 seno];
        NSLog(@"Resultado3: %f", calc3.acumulador);

    }
    return 0;
}
