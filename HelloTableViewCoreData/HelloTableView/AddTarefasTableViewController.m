//
//  AddTarefasTableViewController.m
//  HelloTableView
//
//  Created by ios on 25/04/15.
//  Copyright (c) 2015 ios. All rights reserved.
//

#import "AddTarefasTableViewController.h"
#import "AppDelegate.h"

@interface AddTarefasTableViewController ()
- (IBAction)saveItem:(UIBarButtonItem *)sender;
- (IBAction)alterarItem:(UIBarButtonItem *)sender;

@property (weak, nonatomic) IBOutlet UITextField *titulo;
@property (weak, nonatomic) IBOutlet UITextField *descricao;
@property (weak, nonatomic) IBOutlet UISegmentedControl *prioridade;


@end

@implementation AddTarefasTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if(self.alterarItem) {
        self.titulo.text = self.alterarItem.titulo;
        self.descricao.text = self.alterarItem.descricao;
        [self.prioridade setSelectedSegmentIndex:[self.alterarItem.prioridade integerValue]];
        
        UIBarButtonItem * alterarButton = [[UIBarButtonItem alloc] initWithTitle:@"Alterar" style:UIBarButtonItemStylePlain target:self action:@selector(alterarItem:)];
        self.navigationItem.rightBarButtonItem = alterarButton;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)saveItem:(UIBarButtonItem *)sender {
    
    Item * novoItem = [NSEntityDescription insertNewObjectForEntityForName:@"Item" inManagedObjectContext:self.managedObjectContext];
    novoItem.titulo = self.titulo.text;
    novoItem.descricao = self.descricao.text;
    novoItem.prioridade = [NSNumber numberWithInt:self.prioridade.selectedSegmentIndex];
    
    if(self.delegate) {
        [self.delegate novoItem:novoItem controller:self];
    }
}

- (IBAction)alterarItem:(UIBarButtonItem *)sender
{
    self.alterarItem.titulo = self.titulo.text;
    self.alterarItem.descricao = self.descricao.text;
    self.alterarItem.prioridade = [NSNumber numberWithInt:self.prioridade.selectedSegmentIndex];
    
    if(self.delegate) {
        [self.delegate alterarItem:self.alterarItem controller:self];
    }
}
@end
