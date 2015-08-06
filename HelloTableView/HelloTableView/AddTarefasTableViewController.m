//
//  AddTarefasTableViewController.m
//  HelloTableView
//
//  Created by ios on 25/04/15.
//  Copyright (c) 2015 ios. All rights reserved.
//

#import "AddTarefasTableViewController.h"

@interface AddTarefasTableViewController ()
- (IBAction)saveItem:(UIBarButtonItem *)sender;
@property (weak, nonatomic) IBOutlet UITextField *titulo;
@property (weak, nonatomic) IBOutlet UITextField *descricao;
@property (weak, nonatomic) IBOutlet UISegmentedControl *prioridade;


@end

@implementation AddTarefasTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)saveItem:(UIBarButtonItem *)sender {
    NSMutableDictionary * novoItem = [NSMutableDictionary dictionary];
    [novoItem setObject:self.titulo.text forKey:@"titulo"];
    [novoItem setObject:self.descricao.text forKey:@"descricao"];
    
    [novoItem setObject:[NSNumber numberWithInt:self.prioridade.selectedSegmentIndex] forKey:@"prioridade"];
    
    if(self.delegate) {
        [self.delegate novoItem:novoItem controller:self];
    }
}
@end
