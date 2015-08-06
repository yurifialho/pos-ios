//
//  TarefasTableViewController.m
//  HelloTableView
//
//  Created by ios on 25/04/15.
//  Copyright (c) 2015 ios. All rights reserved.
//

#import "TarefasTableViewController.h"
#import "AppDelegate.h"
#import "Item.h"

@interface TarefasTableViewController ()
- (IBAction)adicionarTarefa:(UIBarButtonItem *)sender;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *btAddTask;
@property NSMutableArray *se;

@property (weak, nonatomic) NSManagedObjectContext *managedObjectContext;

@end

@implementation TarefasTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    if(self.categoria){
        self.title = self.categoria.nome;
    }
    
    AppDelegate * delegate = [UIApplication sharedApplication].delegate;
    self.managedObjectContext = delegate.managedObjectContext;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.categoria.itens.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellTarefa" forIndexPath:indexPath];
    
    Item * item = self.categoria.itens[indexPath.row];
    cell.textLabel.text = item.titulo;
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/


// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        Item * item = self.categoria.itens[indexPath.row];
        [self.categoria removeItensObject:item];
        
        NSError *error;
        if(![self.managedObjectContext save:&error]) {
            NSLog(@"Erro ao remover item");
        }
        
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        
        [self.tableView reloadData];
        
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)adicionarTarefa:(UIBarButtonItem *)sender {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Nova Tarefa" message:@"Digite uma tarefa" delegate:self cancelButtonTitle:@"Fechar" otherButtonTitles:@"Ok", nil];
    
    alert.alertViewStyle = UIAlertViewStylePlainTextInput;
    
    [alert show];
    
}

#pragma mark - delegate alert view

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if(buttonIndex == 1) { //ok
        /*
        
        
        NSString * novoNome = [alertView textFieldAtIndex:0].text;
        
        [self.categoria[@"itens"] addObject:novoNome];
        
        [self.tableView reloadData];
        
        if([self.dic[@"itens"] count] != 0 && [self.se count] == 1) {
            [self.se addObject: self.editButtonItem];
            self.navigationItem.rightBarButtonItems = self.se;
        } */
    }
}

- (void) novoItem: (Item *) item controller: (AddTarefasTableViewController *) controller{
    
    [self.categoria addItensObject:item];
    
    NSError * error;
    if(![self.managedObjectContext save:&error]) {
        NSLog(@"Erro ao incluir item");
    }
    
    [self.navigationController popViewControllerAnimated: YES];
    [self.tableView reloadData];
    
}

- (void) alterarItem : (Item *) item controller: (AddTarefasTableViewController *) controller{
    
    NSError * error;
    if(![self.managedObjectContext save:&error]){
        NSLog(@"Erro ao alterar o item");
    }
    
    [self.navigationController popViewControllerAnimated: YES];
    [self.tableView reloadData];
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"novoItem"]) {
        AddTarefasTableViewController * controller = segue.destinationViewController;
        controller.delegate = self;
    } else if([segue.identifier isEqualToString:@"alterarItem"]) {
        AddTarefasTableViewController * controller = segue.destinationViewController;
        
        NSIndexPath * index = [self.tableView indexPathForCell: sender];

        Item * item = self.categoria.itens[index.row];
        
        controller.alterarItem = item;
        controller.delegate = self;
    }
}
@end
