//
//  ViewController.m
//  HelloCocoapods
//
//  Created by ios on 16/05/15.
//  Copyright (c) 2015 ios. All rights reserved.
//

#import "ViewController.h"
#import <UIImageView+AFNetworking.h>
#import <FMDB.h>
#import <AFNetworking.h>

@interface ViewController ()
- (IBAction)testarFMDB:(UIButton *)sender;
- (IBAction)testarWebservices:(UIButton *)sender;
- (IBAction)testarWebservicesAFN:(UIButton *)sender;
- (IBAction)carregarImagem:(UIButton *)sender;

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *progress;
@property (weak, nonatomic) IBOutlet UIImageView *imagem;

@end

@implementation ViewController

#pragma mark - AFNetworking

//IOS Native
- (IBAction)testarWebservices:(UIButton *)sender {
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://rest-service.guides.spring.io/greeting"]];
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler: ^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        NSLog(@"JSON Native Value: %@", [json objectForKey:@"content"]);
    }];
    
}

//AFN
- (IBAction)testarWebservicesAFN:(UIButton *)sender {
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    self.progress.hidden = NO;
    [self.progress startAnimating];
    
    [manager GET: @"http://rest-service.guides.spring.io/greeting" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON AFN: %@", [responseObject objectForKey:@"content"]);
        [self.progress stopAnimating];
        self.progress.hidden = YES;
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
}
//load Image
- (IBAction)carregarImagem:(UIButton *)sender {
    
    [self.imagem setImageWithURL:[NSURL URLWithString:@"http://www.mikedm.com/wp-content/uploads/2014/04/monstre-2-150x150.gif"] placeholderImage: [UIImage imageNamed:@"placeholder.png"]];
}



#pragma mark - FMDB

- (NSString *) dbPath
{
    //Pasta destino do simulador: ~/Library/Application Suport/iPhone Simulator
    NSArray * dbPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    //~/Library/Application Support/iPhone Simulator/
    NSString * dbDocumentsDirectory = [dbPaths objectAtIndex:0];
    
    //~/Library/Application Support/iPhone Simulator/Checklists.plist
    NSString * dbPath = [dbDocumentsDirectory stringByAppendingPathComponent:@"Pods.db"];
    
    NSLog(@"%@", dbPath);
    return dbPath;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)testarFMDB:(UIButton *)sender {
    FMDatabase *db = [FMDatabase databaseWithPath:[self dbPath]];
    
    if(![db open]) {
        return;
    }
    
    NSString *sqlCreateTable = @"create table cliente (id integer primary key autoincrement, nome text, idade integer);";
    BOOL success = [db executeStatements:sqlCreateTable];
    
    NSDictionary *dicCliente = [NSDictionary dictionaryWithObjectsAndKeys:@"Gerardo", @"nome", [NSNumber numberWithInt:47], @"idade", nil];
    
    success = [db executeUpdate:@"Insert Into cliente (nome, idade) values (:nome, :idade)" withParameterDictionary:dicCliente];
    
    FMResultSet *s = [db executeQuery:@"Select * From cliente"];
    while ([s next]) {
        NSLog(@"Nome: %@ Idade: %i", [s stringForColumn:@"nome"], [s intForColumn:@"idade"]);
    }
}


@end
