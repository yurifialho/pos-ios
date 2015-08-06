//
//  DetranCell.m
//  
//
//  Created by Yuri Fialho on 23/05/15.
//  Copyright (c) 2015 ios. All rights reserved.
//

#import "DetranCell.h"

@implementation DetranCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

- (void) changeColorWith: (UIColor *) color {
    self.titulo.textColor = color;
    self.descricao.textColor = color;
    
    self.barra.backgroundColor = color;
}

@end
