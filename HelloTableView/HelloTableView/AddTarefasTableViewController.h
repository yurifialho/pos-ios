//
//  AddTarefasTableViewController.h
//  HelloTableView
//
//  Created by ios on 25/04/15.
//  Copyright (c) 2015 ios. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AddTarefasTableViewController;

@protocol AddTarefasTableViewControllerDelegate <NSObject>

- (void) novoItem: (NSMutableDictionary *) dic controller: (AddTarefasTableViewController *) controller;

@end

@interface AddTarefasTableViewController : UITableViewController

@property (weak, nonatomic) id <AddTarefasTableViewControllerDelegate> delegate;

@end
