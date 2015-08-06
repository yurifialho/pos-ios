//
//  TelaAmarelaViewController.m
//  AulaFa7
//
//  Created by ios on 25/04/15.
//  Copyright (c) 2015 ios. All rights reserved.
//

#import "TelaAmarelaViewController.h"
#import "TelaAzulViewController.h"

@interface TelaAmarelaViewController ()

@end

@implementation TelaAmarelaViewController

#pragma mark - Constructors

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Navigator

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    if([segue.identifier isEqualToString:@"segueTelaAzul"]) {
        NSLog(@"Segue correto");
        
        TelaAzulViewController * controller = (TelaAzulViewController *)segue.destinationViewController;
        
        controller.texto = @"Olá mundo!";
        
    }
    
}

@end
