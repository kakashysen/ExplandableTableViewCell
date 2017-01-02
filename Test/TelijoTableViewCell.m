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
    self.layer.cornerRadius = 2.0;
    self.layer.shadowOffset = CGSizeMake(2, 2);
    self.layer.shadowColor = [UIColor lightGrayColor].CGColor;
    self.layer.shadowRadius = 2.0;
    self.layer.shadowOpacity = 0.5;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setFrame:(CGRect)frame {
    if (self.superview) {
        float cellWidth = self.superview.frame.size.width - 20;
        frame.origin.x = (self.superview.frame.size.width - cellWidth) / 2;
        frame.size.width = cellWidth;
    }
    
    [super setFrame:frame];
}


@end
