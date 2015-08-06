//
//  ViewController.m
//  HelloiOSUI3
//
//  Created by ios on 11/04/15.
//  Copyright (c) 2015 ios. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

- (IBAction)segmentedControlChanged:(id)sender;
- (IBAction)slideControlChanged:(id)sender;
- (IBAction)hideKeyboard:(id)sender;

@property (weak, nonatomic) IBOutlet UIProgressView *progress;
@property (weak, nonatomic) IBOutlet UITextField *textField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)segmentedControlChanged:(id)sender {
    UISegmentedControl * segControl = sender;
    
    NSLog(@"SegmentedControlChanged: %ld", segControl.selectedSegmentIndex);
}

- (IBAction)slideControlChanged:(id)sender {
    UISlider * sliderCtrl = sender;

    self.progress.progress = sliderCtrl.value;
    NSLog(@"Slide value: %f", sliderCtrl.value);
    
}

- (IBAction)hideKeyboard:(id)sender {
    [self.textField resignFirstResponder];
}
/* Método para remover o teclado da tela quando o ruturn for pressionado */
- (BOOL) textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (BOOL) textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    NSLog(@"Text has changed!");
    return YES;
}

@end
