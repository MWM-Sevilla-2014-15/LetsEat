//
//  CustomCell.m
//  LetsEat
//
//  Created by Daniel Martin Jimenez on 8/7/15.
//  Copyright (c) 2015 Daniel Martin Jimenez. All rights reserved.
//

#import "CustomCell.h"
#import "UIColor+MyColor.h"

@implementation CustomCell

- (void)awakeFromNib {
    // Initialization code
    
    //Aplicar Sombra a la View
    self.customView.layer.shadowOffset = CGSizeMake(1, 0);
    self.customView.layer.shadowColor = [[UIColor customThirdColor] CGColor];
    self.customView.layer.shadowRadius = 5;
    self.customView.layer.shadowOpacity = .25;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
