//
//  CustomTableTableViewController.m
//  Test
//
//  Created by Jose Aponte on 12/29/16.
//  Copyright © 2016 jappsku. All rights reserved.
//

#import "TelijoTableTableViewController.h"
#import "TelijoTableViewCell.h"
#import "TelijoExpandableTableViewCell.h"

@interface TelijoTableTableViewController ()
{
    NSMutableArray<NSMutableArray*> *data;
    
    BOOL resizeCell;
    NSIndexPath *indexPathRowOpen;
    TelijoTableViewCell *lastCellOpen;
}


@end

@implementation TelijoTableTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    data = [NSMutableArray arrayWithObjects:
            [NSMutableArray arrayWithObjects:@"1", nil],
            [NSMutableArray arrayWithObjects:@"1", nil],
            [NSMutableArray arrayWithObjects:@"1", nil],
            [NSMutableArray arrayWithObjects:@"1", nil], nil];
    
    self.tableView.estimatedRowHeight = UITableViewAutomaticDimension;
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return data.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [data objectAtIndex:section].count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *text = [[data objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
    
    UITableViewCell *cell;
    
    if ([text isEqualToString:@"-- new cell --"])
    {
        static NSString *CellExpandableIdentifer = @"telijoExplandableCell";
        cell = (TelijoExpandableTableViewCell*)[tableView dequeueReusableCellWithIdentifier:CellExpandableIdentifer];
        if (cell == nil)
        {
            cell = (TelijoExpandableTableViewCell*) [[[NSBundle mainBundle] loadNibNamed:@"TelijoExpandableTableViewCell" owner:self options:nil] firstObject];
        }
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    else
    {
        static NSString *CellIdentifer = @"telijoCell";
        cell = (TelijoTableViewCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifer];
        if (cell == nil)
        {
            cell = (TelijoTableViewCell*) [[[NSBundle mainBundle] loadNibNamed:@"TelijoTableViewCell" owner:self options:nil] firstObject];
        }
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }

    //cell.textLabel.text = text;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    if ([cell isKindOfClass:[TelijoTableViewCell class]])
    {
        
        TelijoTableViewCell *selectedCell = (TelijoTableViewCell*) cell;
        
        if (selectedCell == lastCellOpen)
        {
            [self collapseOpenCell];
        }
        else
        {
            [self collapseOpenCell];
            selectedCell.isOpen = !selectedCell.isOpen;
            resizeCell = selectedCell.isOpen;
            
            NSIndexPath *indexPathNew = [NSIndexPath indexPathForRow:indexPath.row + 1 inSection:indexPath.section];
            NSMutableArray *arrayRows = [data objectAtIndex:indexPath.section];
            indexPathRowOpen = indexPathNew;
            if (selectedCell.isOpen)
            {
                lastCellOpen = selectedCell;
                [arrayRows insertObject:@"-- new cell --" atIndex:indexPathNew.row];
                [tableView insertRowsAtIndexPaths:@[indexPathNew] withRowAnimation:UITableViewRowAnimationFade];
            }
            else
            {
                [arrayRows removeObjectAtIndex:indexPathNew.row];
                [tableView deleteRowsAtIndexPaths:@[indexPathNew] withRowAnimation:UITableViewRowAnimationFade];
            }
            
            if (indexPath.section == data.count - 1)
            {
                [tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionTop animated:YES];
            }
        }
    }
}

-(void)collapseOpenCell
{
    if (lastCellOpen && lastCellOpen.isOpen)
    {
        lastCellOpen.isOpen = NO;
        NSMutableArray *arrayRows = [data objectAtIndex:indexPathRowOpen.section];
        [arrayRows removeObjectAtIndex:indexPathRowOpen.row];
        [self.tableView deleteRowsAtIndexPaths:@[indexPathRowOpen] withRowAnimation:UITableViewRowAnimationFade];
        lastCellOpen = nil;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (resizeCell && indexPath.section == indexPathRowOpen.section && indexPath.row == indexPathRowOpen.row)
    {
        return 200;
    }
    else
    {
        return 60;
    }
}


@end
