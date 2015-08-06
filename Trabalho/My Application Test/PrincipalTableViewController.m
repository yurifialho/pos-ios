//
//  PrincipalTableViewController.m
//  My Application Test
//
//  Created by Daniel Oliveira on 28/04/15.
//  Copyright (c) 2015 Daniel Oliveira. All rights reserved.
//

#import "PrincipalTableViewController.h"
#import "DetranCell.h"

@interface PrincipalTableViewController ()

@end

@implementation PrincipalTableViewController

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

#pragma mark - Table view data source

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.row == 0) {
        [self performSegueWithIdentifier:@"segueHabilitacao" sender: self];
    } else if(indexPath.row ==1){
        [self performSegueWithIdentifier:@"segueVeiculo" sender:self];
    }

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"SimpleTableCell";
    
    DetranCell *cell = (DetranCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"DetranCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
    
    
    if(indexPath.row ==0) {
        cell.icone.image =[UIImage imageNamed:@"habilitacao.gif"];
        cell.titulo.text = @"Habilitação";
        cell.descricao.text = @"Consulta pontos, vencimento...";
    } else if(indexPath.row ==1 ){
        cell.icone.image =[UIImage imageNamed:@"veiculo.gif"];
        [cell changeColorWith: [UIColor colorWithRed: 255.0f/255.0f green:199.0f/255.0f blue: 0.0f alpha:1.0f]];
        cell.titulo.text = @"Veículos";
        cell.descricao.text = @"Consulta, Multas, Taxas...";
        
    } else if(indexPath.row ==2 ){
        cell.icone.image =[UIImage imageNamed:@"transporte.gif"];
        [cell changeColorWith: [UIColor colorWithRed: 230.0f/255.0f green:154.0f/255.0f blue:108.0f/255.0f alpha:1.0f]];
        cell.titulo.text = @"Transportes";
        cell.descricao.text = @"Taxas e Liceciamentos";
    } else {
        cell.icone.image =[UIImage imageNamed:@"faleconosco.gif"];
        [cell changeColorWith: [UIColor colorWithRed: 72.0f/255.0f green:133.0f/255.0f blue:141.0f/255.0f alpha:1.0f]];
        cell.titulo.text = @"Fale Conosco!";
        cell.descricao.text = @"Meios de comunicação";
    }
    //if(indexPath.row%2 == 0) {
    //    cell.backgroundColor = [UIColor grayColor];
    //}
    
    
    
    return cell;
}

@end
