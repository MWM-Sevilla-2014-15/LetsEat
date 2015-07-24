//
//  CustomEmpyCell.m
//  LetsGoEat
//
//  Created by Daniel Martin Jimenez on 24/7/15.
//  Copyright (c) 2015 Daniel Martin Jimenez. All rights reserved.
//

#import "CustomEmpyCell.h"
#import "UIColor+MyColor.h"

@implementation CustomEmpyCell

- (void)awakeFromNib {
    // Initialization code
    
    //Aplicar Sombra a la View
    self.customView.layer.shadowOffset = CGSizeMake(1, 0);
    self.customView.layer.shadowColor = [[UIColor customShadowColor] CGColor];
    self.customView.layer.shadowRadius = 5;
    self.customView.layer.shadowOpacity = 1.0;
    self.customView.layer.cornerRadius = 5.0;
    
    self.labelDisp.font = [UIFont fontWithName:@"Dosis-SemiBold" size:14];
    self.labelDisp.textColor = [UIColor customThirdColor];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
