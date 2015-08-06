//
//  ResultVeiculoTableViewController.m
//  My Application Test
//
//  Created by Daniel Oliveira on 04/05/15.
//  Copyright (c) 2015 Daniel Oliveira. All rights reserved.
//

#import "FormVeiculoTableViewController.h"
#import "ResultVeiculoTableViewController.h"
#import <AFNetworking.h>
#import <MRProgress/MRProgress.h>
#import <MRProgress/MRProgressOverlayView+AFNetworking.h>

@interface FormVeiculoTableViewController ()
- (IBAction)segmentedChangeConsula:(UISegmentedControl *)sender;
- (IBAction)consultaVeiculo:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIButton *btnConsulta;

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@property (weak, nonatomic) IBOutlet UITextField *txtPlaca;
@property (weak, nonatomic) IBOutlet UITextField *txtPlacaNumber;
@property (weak, nonatomic) IBOutlet UITextField *txtRenavam;

@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedConsulta;
@property (weak, nonatomic) NSDictionary *resultVeiculo;
@property (weak, nonatomic) IBOutlet UILabel *labelRenavam;
@property BOOL dadosOk;
-(void) verificarPlaca:(NSNotification *) n;

@end

@implementation FormVeiculoTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Loading
    self.activityIndicator.hidden = YES;
    [self.activityIndicator stopAnimating];
    
    // Habilitando campos
    [self.txtRenavam setEnabled:NO];
    [self.labelRenavam setEnabled:NO];
    
    self.dadosOk = NO;
    
    // Delegates
    self.txtPlaca.delegate = self;
    self.txtPlacaNumber.delegate = self;
    self.txtRenavam.delegate = self;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(verificarPlaca:) name:@"UITextFieldTextDidChangeNotification" object:self.txtPlaca];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)segmentedChangeConsula:(UISegmentedControl *)sender {
//    NSString * title = [sender titleForSegmentAtIndex:sender.selectedSegmentIndex];
    if (self.segmentedConsulta.selectedSegmentIndex == 0) {
        self.txtRenavam.text = @"";
        [self.txtRenavam setEnabled:NO];
        [self.labelRenavam setEnabled:NO];

    } else {
        [self.txtRenavam setEnabled:YES];
        [self.labelRenavam setEnabled:YES];
    }
    
}

- (IBAction)consultaVeiculo:(UIButton *)sender {

    self.activityIndicator.hidden = NO;
    [self.activityIndicator startAnimating];
    
    [self.btnConsulta setHidden:YES];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    

    
    

    if([self.txtPlaca.text isEqualToString:@""] || [self.txtPlacaNumber.text isEqualToString:@""]) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Placa" message:@"Placa deve ser preenchida" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
        self.dadosOk = NO;
        [self.btnConsulta setHidden:NO];
    }else {
        self.dadosOk = YES;
    }
    
    if ((self.segmentedConsulta.selectedSegmentIndex == 1) && [self.txtRenavam.text isEqualToString:@""] ) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Renavam" message:@"Deve ser preenchido" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
        self.dadosOk = NO;
        [self.btnConsulta setHidden:NO];
    }

    if (self.dadosOk) {
        [MRProgressOverlayView showOverlayAddedTo:self.view animated:YES];
        NSString *placa = [[self.txtPlaca.text uppercaseString]stringByAppendingString:self.txtPlacaNumber.text];

        NSString *url = [[@"http://10.54.40.5:3000/veiculos/" stringByAppendingString:placa] stringByAppendingString:@".json"];
//        NSLog(@" >>> URL: %@", url);
    
        [manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
            NSLog(@"JSON Value: %@", responseObject);
            
            if ([responseObject count] == 0) {
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Dados do Veiculo" message:@"Incorreto ou Inexistente" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                [alert show];

            } else {
                
                self.resultVeiculo = responseObject;
                
                
                if (self.segmentedConsulta.selectedSegmentIndex == 0) {
                    [self performSegueWithIdentifier:@"resultadoVeiculoSimples" sender:self];
                } else {
                    if (![self.txtRenavam.text isEqualToString:responseObject[@"renavam"]]) {
                        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Placa/Renavam" message:@"Dados Incorretos" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                        [alert show];
                    } else {
                        [self performSegueWithIdentifier:@"resultadoVeiculoCompleta" sender:self];
                    }
                    
                }
                //            self.txtPlaca.text = @"";
                //            self.txtPlacaNumber.text = @"";
                //            self.txtRenavam.text = @"";
                
            }
            [self.btnConsulta setHidden:NO];
            [MRProgressOverlayView dismissOverlayForView:self.view animated:YES];
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            NSLog(@"Error: %@", error);
            [MRProgressOverlayView dismissOverlayForView:self.view animated:YES];
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Base de dados" message:@"Erro ao conectar" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
            [self.btnConsulta setHidden:NO];
            
        }];
    
        
    }
    self.activityIndicator.hidden = YES;
    [self.activityIndicator stopAnimating];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([[segue identifier] isEqualToString:@"resultadoVeiculoSimples"] || [[segue identifier] isEqualToString:@"resultadoVeiculoCompleta"]) {
        // Get destination view controller and don't forget
        // to cast it to the right class
        ResultVeiculoTableViewController *viewResult = [segue destinationViewController];
        // Pass data
        viewResult.resultVeiculo = self.resultVeiculo;
    }
}


- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    // Prevent crashing undo bug – see note below.
    if(range.length + range.location > textField.text.length)
    {
        return NO;
    }
    
    NSUInteger newLength = [textField.text length] + [string length] - range.length;
    if (textField == self.txtPlaca) {
        return newLength <= 3;
        
    // LOGICA PARA PASSAR PARA OUTRO FIELD COM TEMPORIZADOR
//        BOOL valid = newLength == 3 ? true : false;
//        if (valid) {
//            //[self.txtPlacaNumber becomeFirstResponder];
//            [self.txtPlacaNumber performSelector:@selector(becomeFirstResponder) withObject:nil afterDelay:.05];
//        }
        
        

    } else if (textField == self.txtPlacaNumber) {
        return newLength <= 4;
    } else if (textField == self.txtRenavam) {
        return newLength <= 11;
    }
    
    return newLength <= 10;
    
}

-(void) verificarPlaca:(NSNotification *) n {
    if (self.txtPlaca.text.length >= 3) {
        [self.txtPlacaNumber becomeFirstResponder];
    }
    
}

@end
