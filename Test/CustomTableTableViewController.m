//
//  CustomTableTableViewController.m
//  Test
//
//  Created by Jose Aponte on 12/29/16.
//  Copyright © 2016 jappsku. All rights reserved.
//

#import "CustomTableTableViewController.h"
#import "DetailTableViewCell.h"

@interface CustomTableTableViewController ()
{
  NSMutableArray<NSMutableArray*> *data;
  
  BOOL resizeCell;
  NSIndexPath *indexPathRowSelected;
}


@end

@implementation CustomTableTableViewController

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
    cell = (DetailTableViewCell*) [[[NSBundle mainBundle] loadNibNamed:@"DetailTableViewCell" owner:self options:nil] firstObject];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
  }
  else
  {
      cell = [tableView dequeueReusableCellWithIdentifier:@"MyCell" forIndexPath:indexPath];
      cell.selectionStyle = UITableViewCellSelectionStyleNone;
  }
  
  
  cell.textLabel.text = text;
  return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
  
  UITableViewCell *selectedCell = [tableView cellForRowAtIndexPath:indexPath];
  
  if (![selectedCell isKindOfClass:[DetailTableViewCell class]])
  {
    resizeCell = !resizeCell;
    NSIndexPath *indexPathNew = [NSIndexPath indexPathForRow:indexPath.row + 1 inSection:indexPath.section];
    NSMutableArray *arrayRows = [data objectAtIndex:indexPath.section];
    indexPathRowSelected = indexPathNew;
    if (resizeCell)
    {
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

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
  if (resizeCell)
  {
    if (indexPath == indexPathRowSelected)
    {
      return 200;
    }
    else
    {
      return 100;
    }
  }
  else
  {
    return 100;
  }
}

/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 } else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
