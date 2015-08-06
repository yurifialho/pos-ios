//
//  ResultHabilitacaoTableViewController.m
//  My Application Test
//
//  Created by Daniel Oliveira on 29/04/15.
//  Copyright (c) 2015 Daniel Oliveira. All rights reserved.
//

#import "ResultHabilitacaoTableViewController.h"
#import <AFNetworking.h>

@interface ResultHabilitacaoTableViewController ()

@property (weak, nonatomic) IBOutlet UILabel *lbCpf;
@property (weak, nonatomic) IBOutlet UILabel *lbNome;
@property (weak, nonatomic) IBOutlet UILabel *lbCategoria;
@property (weak, nonatomic) IBOutlet UILabel *lbValidade;
@property (weak, nonatomic) IBOutlet UILabel *lbBloqueada;


@end

@implementation ResultHabilitacaoTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if(self.dadosHabilitacao != Nil) {
        self.lbCpf.text = [self.dadosHabilitacao objectForKey:@"cpf"];
        self.lbNome.text = [self.dadosHabilitacao objectForKey:@"nome"];
        self.lbCategoria.text = [self.dadosHabilitacao objectForKey:@"categoria"];
        self.lbValidade.text = [self.dadosHabilitacao objectForKey:@"validade_cnh"];
        self.lbBloqueada.text = [[self.dadosHabilitacao objectForKey:@"bloqueio"] isEqualToString:@"N"] ? @"NAO" : @"SIM" ;
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




@end
