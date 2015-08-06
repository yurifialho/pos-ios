//
//  Retangulo.h
//  Shape
//
//  Created by ios on 21/03/15.
//  Copyright (c) 2015 ios. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Imprimivel.h"

@interface Retangulo : NSObject <Imprimivel>

@property int altura;
@property int largura;

- (id) initAltura: (int) a largura: (int) l;

- (int) area;
- (int) perimetro;

- (int) compare: (Retangulo *) r;

@end
