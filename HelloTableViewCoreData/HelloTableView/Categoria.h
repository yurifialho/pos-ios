//
//  Categoria.h
//  HelloTableView
//
//  Created by ios on 16/05/15.
//  Copyright (c) 2015 ios. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Item;

@interface Categoria : NSManagedObject

@property (nonatomic, retain) NSString * nome;
@property (nonatomic, retain) NSOrderedSet *itens;

- (void)addItensObject:(Item *)value;
- (void)removeItensObject:(Item *)value;

@end

@interface Categoria (CoreDataGeneratedAccessors)

- (void)insertObject:(Item *)value inItensAtIndex:(NSUInteger)idx;
- (void)removeObjectFromItensAtIndex:(NSUInteger)idx;
- (void)insertItens:(NSArray *)value atIndexes:(NSIndexSet *)indexes;
- (void)removeItensAtIndexes:(NSIndexSet *)indexes;
- (void)replaceObjectInItensAtIndex:(NSUInteger)idx withObject:(Item *)value;
- (void)replaceItensAtIndexes:(NSIndexSet *)indexes withItens:(NSArray *)values;
- (void)addItens:(NSOrderedSet *)values;
- (void)removeItens:(NSOrderedSet *)values;
@end
