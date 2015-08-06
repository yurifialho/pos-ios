//
//  HabilitacaoTableViewController.m
//  My Application Test
//
//  Created by Daniel Oliveira on 28/04/15.
//  Copyright (c) 2015 Daniel Oliveira. All rights reserved.
//

#import "HabilitacaoTableViewController.h"
#import "ResultHabilitacaoTableViewController.h"
#import <AFNetworking.h>
#import <MRProgress/MRProgress.h>
#import <MRProgress/MRProgressOverlayView+AFNetworking.h>

@interface HabilitacaoTableViewController ()

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *loading;
@property (weak, nonatomic) IBOutlet UITextField *txtCpf;

@property (strong, nonatomic) NSDictionary *dados;

- (IBAction)consultarHabilitacao:(id)sender;
@end

@implementation HabilitacaoTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.loading setHidden:YES];
    self.txtCpf.delegate = self;
    [self.txtCpf becomeFirstResponder];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender {
    if([identifier isEqualToString:@"resultadoHabilitacao"] && [self.txtCpf.text isEqualToString:@""]) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Cpf Invalido" message:@"Cpf e obrigatorio" delegate:self cancelButtonTitle:@"Cancelar" otherButtonTitles:@"Ok", nil];
        [alert show];
        return NO;
    }
    
    return YES;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"resultadoHabilitacao"]) {
        ResultHabilitacaoTableViewController *resHabController = segue.destinationViewController;
        resHabController.dadosHabilitacao = self.dados;
    }
}


- (IBAction)consultarHabilitacao:(id)sender {
    [self.loading setHidden:NO];
    [self.loading startAnimating];
    
    [MRProgressOverlayView showOverlayAddedTo:self.view animated:YES];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    NSString *url = [[@"http://10.54.40.5:3000/habilitacoes/" stringByAppendingString: self.txtCpf.text]
                     stringByAppendingString: @".json"];
    
    [manager GET:url parameters:Nil
         success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         self.dados = responseObject;

         [self performSegueWithIdentifier:@"resultadoHabilitacao" sender:self];
         [self.loading stopAnimating];
         [self.loading setHidden:YES];
         [MRProgressOverlayView dismissOverlayForView:self.view animated:YES];
     }
         failure:^(AFHTTPRequestOperation *operation, NSError *error)
     {

         UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Aviso" message:@"Cpf não econtrado" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"Ok", nil];
         [alert show];
         
         [self.loading stopAnimating];
         [self.loading setHidden:YES];
         [MRProgressOverlayView dismissOverlayForView:self.view animated:YES];
         
     }];
    
    
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    // Prevent crashing undo bug – see note below.
    if(range.length + range.location > textField.text.length)
    {
        return NO;
    }
    
    NSUInteger newLength = [textField.text length] + [string length] - range.length;
    return newLength <= 11;
}
@end
