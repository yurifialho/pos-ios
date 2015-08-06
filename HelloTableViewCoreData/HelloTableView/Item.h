//
//  Item.h
//  HelloTableView
//
//  Created by ios on 16/05/15.
//  Copyright (c) 2015 ios. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Categoria;

@interface Item : NSManagedObject

@property (nonatomic, retain) NSString * titulo;
@property (nonatomic, retain) NSString * descricao;
@property (nonatomic, retain) NSNumber * prioridade;
@property (nonatomic, retain) Categoria *categoria;

@end
