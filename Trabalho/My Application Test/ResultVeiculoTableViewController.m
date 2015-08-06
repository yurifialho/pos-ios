//
//  ResultVeiculoTableViewController.m
//  My Application Test
//
//  Created by Daniel Oliveira on 22/05/15.
//  Copyright (c) 2015 Daniel Oliveira. All rights reserved.
//

#import "ResultVeiculoTableViewController.h"

@interface ResultVeiculoTableViewController ()
@property (weak, nonatomic) IBOutlet UILabel *resultPlaca;
@property (weak, nonatomic) IBOutlet UILabel *resultMarcaModelo;
@property (weak, nonatomic) IBOutlet UILabel *resultTipo;
@property (weak, nonatomic) IBOutlet UILabel *resultCor;
@property (weak, nonatomic) IBOutlet UILabel *resultAno;

@end

@implementation ResultVeiculoTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.resultPlaca.text = [self.resultVeiculo objectForKey:@"placa"];
    self.resultMarcaModelo.text = self.resultVeiculo[@"marca_modelo"];
    self.resultTipo.text = self.resultVeiculo[@"tipo"];
    self.resultCor.text = self.resultVeiculo[@"cor"];
    
    NSMutableString *anoFabMod = [NSMutableString string];
    [anoFabMod appendString:[NSString stringWithFormat:@"%@ ",self.resultVeiculo[@"ano_fab"]]];
    [anoFabMod appendString:@"/"];
    [anoFabMod appendString:[NSString stringWithFormat:@"%@ ",self.resultVeiculo[@"ano_modelo"]]];
    self.resultAno.text = anoFabMod;
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
