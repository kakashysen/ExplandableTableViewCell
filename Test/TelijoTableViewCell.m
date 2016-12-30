//
//  TelijoTableViewCell.m
//  Test
//
//  Created by Jose Aponte on 12/30/16.
//  Copyright © 2016 jappsku. All rights reserved.
//

#import "TelijoTableViewCell.h"

@implementation TelijoTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.driverImage.layer.cornerRadius = self.driverImage.frame.size.height / 2;
    self.driverImage.layer.masksToBounds = YES;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
