//
//  TelijoTableViewCell.h
//  Test
//
//  Created by Jose Aponte on 12/30/16.
//  Copyright © 2016 jappsku. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TelijoTableViewCell : UITableViewCell

@property(assign) BOOL isOpen;
@property (weak, nonatomic) IBOutlet UIImageView *driverImage;
@property (weak, nonatomic) IBOutlet UILabel *driverName;
@property (weak, nonatomic) IBOutlet UILabel *taxiPlates;
@property (weak, nonatomic) IBOutlet UILabel *distance;

@end
