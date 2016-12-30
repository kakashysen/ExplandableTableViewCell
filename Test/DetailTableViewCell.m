//
//  DetailTableViewCell.m
//  Test
//
//  Created by Jose Aponte on 12/29/16.
//  Copyright © 2016 jappsku. All rights reserved.
//

#import "DetailTableViewCell.h"

@implementation DetailTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)actionButton:(id)sender
{
  NSLog(@"action Button clicked");
}

@end
