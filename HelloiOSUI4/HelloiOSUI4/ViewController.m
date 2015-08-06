//
//  ViewController.m
//  HelloiOSUI4
//
//  Created by ios on 11/04/15.
//  Copyright (c) 2015 ios. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property NSMutableArray * ano;
@property NSMutableArray * mes;
@property NSMutableArray * dia;

@property (weak, nonatomic) IBOutlet UIPickerView *datas;

- (IBAction)mostrarData:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.dia = [[NSMutableArray alloc] init];
    for (int x =0 ; x < 31; x++) {
        [self.dia addObject:[NSString stringWithFormat:@"%i", x+1]];
    }
    
    self.mes = [[NSMutableArray alloc] init];
    for (int x =0 ; x < 12; x++) {
        [self.mes addObject:[NSString stringWithFormat:@"%i", x+1]];
    }
    
    self.ano = [[NSMutableArray alloc] init];
    for (int x =0 ; x < 20; x++) {
        [self.ano addObject:[NSString stringWithFormat:@"%i", 2015-x]];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 3;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if(component == 0) { //dia
        return [self.dia count];
    } else if(component == 1) {
        return [self.mes count];
    } else if(component == 2){
        return [self.ano count];
    }
    
    return 0;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if(component == 0) { //dia
        return self.dia[row];
    } else if(component == 1) {
        return self.mes[row];
    } else if(component ==2) {
        return self.ano[row];
    }
    
    return @"";
}

- (IBAction)mostrarData:(id)sender {
    
    NSString * dia = self.dia[[self.datas selectedRowInComponent:0]];
    
    NSLog(@"Dia selecionado: %@", dia);
}
@end
