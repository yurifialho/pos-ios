//
//  ViewController.m
//  HelloiOSUI
//
//  Created by ios on 11/04/15.
//  Copyright (c) 2015 ios. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property int contador;
@property (weak, nonatomic) IBOutlet UILabel *meuLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.contador = 0;
    // Do any additional setup after loading the view, typically from a nib.
}

- (void) viewWillAppear:(BOOL)animated
{
//    [super viewWillAppear:<#animated#>];
    self.contador++;
    NSLog(@"Contador: %d", self.contador);
    self.meuLabel.text= [NSString stringWithFormat: @"Contador: %d", self.contador];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
