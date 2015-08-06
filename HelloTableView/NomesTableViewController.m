//
//  NomesTableViewController.m
//  HelloTableView
//
//  Created by ios on 25/04/15.
//  Copyright (c) 2015 ios. All rights reserved.
//

#import "NomesTableViewController.h"
#import "TarefasTableViewController.h"
#import "AppDelegate.h"

@interface NomesTableViewController ()

@property (weak, nonatomic) NSMutableArray * listaCategoria;
- (IBAction)adicionarNome:(UIBarButtonItem *)sender;

@end

@implementation NomesTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    AppDelegate * delegate = [UIApplication sharedApplication].delegate;
    self.listaCategoria = delegate.categorias;
    //self.listaCategoria = [NSMutableArray array];
    //self.navigationItem.leftBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.listaCategoria.count;
}




- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellNome" forIndexPath:indexPath];
    
    NSMutableDictionary *dic = self.listaCategoria[indexPath.row];
    cell.textLabel.text = dic[@"nome"];
    
    return cell;
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"showTarefas"]) {
        TarefasTableViewController * controller = segue.destinationViewController;
        
        NSIndexPath * index = [self.tableView indexPathForCell: sender];
        
        controller.dic = self.listaCategoria[index.row];
    }
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
        [self.listaCategoria removeObjectAtIndex: indexPath.row];
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

- (IBAction)adicionarNome:(UIBarButtonItem *)sender {
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Novo Nome" message:@"Digite um nome" delegate:self cancelButtonTitle:@"Fechar" otherButtonTitles:@"Ok", nil];
    
    alert.alertViewStyle = UIAlertViewStylePlainTextInput;
    
    [alert show];
}

#pragma mark - delegate alert view

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if(buttonIndex == 1) { //ok
        
        NSMutableDictionary *novoDic = [NSMutableDictionary dictionary];
        
        NSString * novoNome = [alertView textFieldAtIndex:0].text;
        [novoDic setObject:novoNome forKey:@"nome"];
        [novoDic setObject:[NSMutableArray array] forKey:@"itens"];
        
        [self.listaCategoria addObject:novoDic];
                
        AppDelegate * delegate = [UIApplication sharedApplication].delegate;
        [delegate salvarCategorias];
        
        [self.tableView reloadData];
    }
}

@end
