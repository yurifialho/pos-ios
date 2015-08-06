//
//  TarefasTableViewController.m
//  HelloTableView
//
//  Created by ios on 25/04/15.
//  Copyright (c) 2015 ios. All rights reserved.
//

#import "TarefasTableViewController.h"
#import "AppDelegate.h"

@interface TarefasTableViewController ()
- (IBAction)adicionarTarefa:(UIBarButtonItem *)sender;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *btAddTask;
@property NSMutableArray *se;

@end

@implementation TarefasTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    if(self.dic){
        self.title = [self.dic objectForKey:@"nome"];
    }
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    self.se = [NSMutableArray array];
    [self.se addObject: self.btAddTask];
    if([self.dic[@"itens"] count] != 0) {
        [self.se addObject: self.editButtonItem];
    }
    self.navigationItem.rightBarButtonItems = self.se;
//     [self.navigationItem.rightBarButtonItems.a] //leftBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSMutableArray * tarefas = self.dic[@"itens"];
    return tarefas.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellTarefa" forIndexPath:indexPath];
    
    NSMutableArray * tarefas = self.dic[@"itens"];
    cell.textLabel.text = tarefas[indexPath.row][@"titulo"];
    
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
        [self.dic[@"itens"] removeObjectAtIndex:indexPath.row];
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
        
        
        
        NSString * novoNome = [alertView textFieldAtIndex:0].text;
        
        [self.dic[@"itens"] addObject:novoNome];
        
        AppDelegate * delegate = [UIApplication sharedApplication].delegate;
        [delegate salvarCategorias];
        
        [self.tableView reloadData];
        
        if([self.dic[@"itens"] count] != 0 && [self.se count] == 1) {
            [self.se addObject: self.editButtonItem];
            self.navigationItem.rightBarButtonItems = self.se;
        } 
    }
}

- (void) novoItem: (NSMutableDictionary *) dic controller: (AddTarefasTableViewController *) controller{
    NSMutableArray * listaItens = [self.dic objectForKey:@"itens"];
    
    [listaItens addObject:dic];
    
    AppDelegate * delegate = [UIApplication sharedApplication].delegate;
    [delegate salvarCategorias];
    
    [self.tableView reloadData];
    
    [self.navigationController popViewControllerAnimated: YES];
    [self.tableView reloadData];
    
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"novoItem"]) {
        AddTarefasTableViewController * controller = segue.destinationViewController;
        controller.delegate = self;
    }
}
@end
