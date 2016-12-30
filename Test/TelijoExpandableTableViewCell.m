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

@end

@implementation TelijoExpandableTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
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
