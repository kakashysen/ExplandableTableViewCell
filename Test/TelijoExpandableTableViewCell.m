//
//  DetailTableViewCell.m
//  Test
//
//  Created by Jose Aponte on 12/29/16.
//  Copyright © 2016 jappsku. All rights reserved.
//

#import "TelijoExpandableTableViewCell.h"

@interface TelijoExpandableTableViewCell()<UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIButton *buttonSelectDriver;

@end

@implementation TelijoExpandableTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.layer.cornerRadius = 2.0;
    self.layer.shadowRadius = 2.0;
    self.layer.shadowOpacity = 0.5;
    self.layer.shadowColor = [UIColor lightGrayColor].CGColor;
    self.layer.shadowOffset = CGSizeMake(2, 2);
    
    self.buttonSelectDriver.layer.cornerRadius = 2;
    self.buttonSelectDriver.layer.shadowRadius = 2;
    self.buttonSelectDriver.layer.shadowOpacity = 0.5;
    self.buttonSelectDriver.layer.shadowColor = [UIColor lightGrayColor].CGColor;
    self.buttonSelectDriver.layer.shadowOffset = CGSizeMake(2, 2);
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


- (IBAction)actionButton:(id)sender
{
  NSLog(@"action Button clicked");
}

#pragma mark - Table View DataSource Methods

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString* cellIdentifier = @"MyCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    cell.textLabel.text = @"Credit Card";
    
    return cell;
}



@end
