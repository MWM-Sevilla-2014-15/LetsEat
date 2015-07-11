//
//  CustomCell.m
//  LetsEat
//
//  Created by Daniel Martin Jimenez on 8/7/15.
//  Copyright (c) 2015 Daniel Martin Jimenez. All rights reserved.
//

#import "CustomCell.h"
#import "UIColor+MyColor.h"
#import "JSBadgeView.h"

@implementation CustomCell

- (void)awakeFromNib {
    // Initialization code
    
    //Aplicar Sombra a la View
    self.customView.layer.shadowOffset = CGSizeMake(1, 0);
    self.customView.layer.shadowColor = [[UIColor customSecondColor] CGColor];
    self.customView.layer.shadowRadius = 5;
    self.customView.layer.shadowOpacity = 1.0;
    self.customView.layer.cornerRadius = 5.0;
    
    //Configurar labels
    self.labelName.font = [UIFont fontWithName:@"AppleSDGothicNeo-SemiBold" size:24];
    self.labelType.font = [UIFont fontWithName:@"AppleSDGothicNeo-Medium" size:14];
    self.labelHour.font = [UIFont fontWithName:@"AppleSDGothicNeo-Light" size:12];
    self.labelTables.font = [UIFont fontWithName:@"AppleSDGothicNeo-Medium" size:18];
    self.labelNumberTables.font = [UIFont fontWithName:@"AppleSDGothicNeo-Light" size:14];
    self.labelDesc.font = [UIFont fontWithName:@"AppleSDGothicNeo-Medium" size:18];
    self.labelInfoDesc.font = [UIFont fontWithName:@"AppleSDGothicNeo-Light" size:14];
    
    self.labelName.textColor = [UIColor customThirdColor];
    self.labelType.textColor = [UIColor customThirdColor];
    self.labelHour.textColor = [UIColor customThirdColor];
    self.labelTables.textColor = [UIColor customThirdColor];
    self.labelNumberTables.textColor = [UIColor customThirdColor];
    self.labelDesc.textColor = [UIColor customThirdColor];
    self.labelInfoDesc.textColor = [UIColor customThirdColor];
    
    self.imageRest.contentMode   = UIViewContentModeScaleAspectFit;
    self.imageRest.clipsToBounds = YES;
    
    self.badgeView = [[JSBadgeView alloc] initWithParentView:self.customView alignment:JSBadgeViewAlignmentTopRight];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
