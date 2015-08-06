//
//  DetranCell.h
//
//
//  Created by Yuri Fialho on 23/05/15.
//  Copyright (c) 2015 ios. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetranCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *titulo;
@property (weak, nonatomic) IBOutlet UILabel *descricao;
@property (weak, nonatomic) IBOutlet UIImageView *icone;
@property (weak, nonatomic) IBOutlet UIView *barra;

- (void) changeColorWith: (UIColor *) color;

@end
