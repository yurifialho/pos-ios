//
//  ViewController.m
//  AulaFa7
//
//  Created by ios on 25/04/15.
//  Copyright (c) 2015 ios. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

- (void) testeDeNotificacao;
- (void) testeDeNotificacao: (NSNotification *) notification;

@end

@implementation ViewController

- (void) testeDeNotificacao:(NSNotification *)notification
{
    NSDictionary * dic = notification.userInfo;
    
    NSLog(@"Nome Setado: %@ %@", dic[@"nome"], dic[@"sobrenome"]);
}

- (void) testeDeNotificacao
{
    NSLog(@"Notificacao recebida com sucesso!");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter] addObserver: self selector:@selector(testeDeNotificacao)  name:@"notificacaoTeste" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver: self selector:@selector(testeDeNotificacao:) name:@"notificacaoTesteComParametro" object:nil];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
