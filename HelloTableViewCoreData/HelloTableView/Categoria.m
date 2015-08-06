//
//  Categoria.m
//  HelloTableView
//
//  Created by ios on 16/05/15.
//  Copyright (c) 2015 ios. All rights reserved.
//

#import "Categoria.h"
#import "Item.h"


@implementation Categoria

@dynamic nome;
@dynamic itens;


- (void)addItensObject:(Item *)value{
    NSMutableOrderedSet *newSet = [NSMutableOrderedSet orderedSetWithOrderedSet:self.itens];
    
    [newSet addObject:value];
    self.itens = newSet;
}
- (void)removeItensObject:(Item *)value{
    NSMutableOrderedSet *newSet = [NSMutableOrderedSet orderedSetWithOrderedSet:self.itens];
    
    [newSet removeObject:value];
    self.itens = newSet;
}

@end
