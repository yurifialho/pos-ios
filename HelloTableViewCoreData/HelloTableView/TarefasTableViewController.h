//
//  TarefasTableViewController.h
//  HelloTableView
//
//  Created by ios on 25/04/15.
//  Copyright (c) 2015 ios. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddTarefasTableViewController.h"
#import "Categoria.h"

@interface TarefasTableViewController : UITableViewController <UIAlertViewDelegate, AddTarefasTableViewControllerDelegate>

@property (weak, nonatomic) Categoria *categoria;

@end
