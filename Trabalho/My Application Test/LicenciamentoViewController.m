//
//  LicenciamentoViewController.m
//  My Application Test
//
//  Created by Daniel Oliveira on 30/05/15.
//  Copyright (c) 2015 Daniel Oliveira. All rights reserved.
//

#import "LicenciamentoViewController.h"

@interface LicenciamentoViewController ()
@property (weak, nonatomic) IBOutlet UIWebView *myWebView;

@end

@implementation LicenciamentoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSString *urlAddress = @"http://erenavam.detran.ce.gov.br/getran/fin/boletoLicenciamento.do?method=visualizar&NUMERO_EXTRATO=4501201589";
    
    //Create a URL object.
    NSURL *url = [NSURL URLWithString:urlAddress];
    
    //URL Requst Object
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    
    //Load the request in the UIWebView.
    [self.myWebView loadRequest:requestObj];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
