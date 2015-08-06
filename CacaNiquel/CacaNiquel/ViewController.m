//
//  ViewController.m
//  CacaNiquel
//
//  Created by ios on 11/04/15.
//  Copyright (c) 2015 ios. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIPickerView *picker;
@property (weak, nonatomic) IBOutlet UILabel *msgResponse;
@property NSMutableArray * listaValues;

- (IBAction)jogar:(id)sender;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.listaValues = [[NSMutableArray alloc] init];
    for (int x = 0; x < 10; x++) {
        self.listaValues[x] = [NSString stringWithFormat: @"%i", x];
    }
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 3;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return 10;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    
    return [NSString stringWithFormat:@"%@", self.listaValues[row]];
  
}

- (IBAction)jogar:(id)sender {
    
    int value1 = arc4random()%10;
    [self.picker selectRow:value1 inComponent:0 animated:YES];
    
    int value2 = arc4random()%10;
    [self.picker selectRow:value2 inComponent:1 animated:YES];
    
    int value3 = arc4random()%10;
    [self.picker selectRow:value3 inComponent:2 animated:YES];
    
    if(value1 == value2 && value2 == value3) {
        self.msgResponse.text = @"You Win!";
    } else {
        self.msgResponse.text = @"You Loose!";
    }
}
@end
