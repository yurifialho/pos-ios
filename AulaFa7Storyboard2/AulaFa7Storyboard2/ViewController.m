//
//  ViewController.m
//  AulaFa7Storyboard2
//
//  Created by ios on 25/04/15.
//  Copyright (c) 2015 ios. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UISwitch *meuSwitch;
- (IBAction)executaSegue:(UIButton *)sender;
- (IBAction)chamaTelaSemSegue:(UIButton *)sender;


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


- (IBAction)executaSegue:(UIButton *)sender {
    if(self.meuSwitch.on) {
        [self performSegueWithIdentifier:@"on" sender:self];
        
    } else {
        [self performSegueWithIdentifier:@"off" sender:self];
    }
}

- (IBAction)chamaTelaSemSegue:(UIButton *)sender {
    UIViewController * newController = [self.storyboard instantiateViewControllerWithIdentifier:@"TelaLaranja"];
    [self.navigationController pushViewController:newController animated:YES];
}
@end
