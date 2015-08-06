//
//  AddTarefasTableViewController.h
//  HelloTableView
//
//  Created by ios on 25/04/15.
//  Copyright (c) 2015 ios. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Item.h"

@class AddTarefasTableViewController;

@protocol AddTarefasTableViewControllerDelegate <NSObject>

- (void) novoItem: (Item *) item controller: (AddTarefasTableViewController *) controller;
- (void) alterarItem : (Item *) item controller: (AddTarefasTableViewController *) controller;

@end

@interface AddTarefasTableViewController : UITableViewController

@property (weak, nonatomic) Item *alterarItem;
@property (weak, nonatomic) id <AddTarefasTableViewControllerDelegate> delegate;
@property (weak, nonatomic) NSManagedObjectContext *managedObjectContext;

@end
