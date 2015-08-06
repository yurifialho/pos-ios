//
//  TelaDoisViewController.m
//  HelloiOSUI
//
//  Created by ios on 11/04/15.
//  Copyright (c) 2015 ios. All rights reserved.
//

#import "TelaDoisViewController.h"

@interface TelaDoisViewController()
- (IBAction)voltar:(id)sender;

@end

@implementation TelaDoisViewController

- (IBAction)voltar:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
