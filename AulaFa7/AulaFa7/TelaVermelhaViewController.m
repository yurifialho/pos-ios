//
//  TelaVermelhaViewController.m
//  AulaFa7
//
//  Created by ios on 25/04/15.
//  Copyright (c) 2015 ios. All rights reserved.
//

#import "TelaVermelhaViewController.h"

@interface TelaVermelhaViewController ()
- (IBAction)cliqueSendEvento:(id)sender;
- (IBAction)cliqueSendEventoComParametros:(UIButton *)sender;
- (IBAction)botaoBarItem:(UIBarButtonItem *)sender;


@property (strong, nonatomic) IBOutlet UIBarButtonItem *btAction;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *btCompose;


@end

@implementation TelaVermelhaViewController

- (void) viewDidLoad
{
    [super viewDidLoad];
    NSArray * barButtons = [NSArray arrayWithObjects:self.btAction, self.btCompose, nil];
    [self.navigationItem setRightBarButtonItems: barButtons];
}

- (IBAction)cliqueSendEvento:(id)sender {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"notificacaoTeste" object:nil];
}

- (IBAction)cliqueSendEventoComParametros:(UIButton *)sender {
    
    NSMutableDictionary * info = [NSMutableDictionary dictionary];
    
    [info setObject:@"Yuri" forKey:@"nome"];
    [info setObject:@"Fialho" forKey:@"sobrenome"];
    
    NSNotification * notification = [[NSNotification alloc] initWithName:@"notificacaoTesteComParametro" object:self userInfo:info];
    
    [[NSNotificationCenter defaultCenter] postNotification:notification];
}

- (IBAction)botaoBarItem:(UIBarButtonItem *)sender {
    
    NSLog(@"Compartilhando!!!");
    
}
@end
