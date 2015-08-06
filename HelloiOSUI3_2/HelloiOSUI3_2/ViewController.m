//
//  ViewController.m
//  HelloiOSUI3_2
//
//  Created by ios on 11/04/15.
//  Copyright (c) 2015 ios. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (strong, nonatomic) IBOutletCollection(UITextField) NSArray *textFields;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    NSLog(@"Total: %i", self.textFields count)
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL) textFieldShouldReturn:(UITextField *)textField
{
    int nextIndex = -1;
//    [textField resignFirstResponder];
    for(int x = 0; x < [self.textFields count]; x++)
    {
        if(self.textFields[x] == textField) {
            nextIndex = x+1;
            break;
        }
    }
    
    if(nextIndex >= [self.textFields count]) {
        [textField resignFirstResponder];
    } else {
        [self.textFields[nextIndex] becomeFirstResponder];
    }
    return YES;
}

@end
