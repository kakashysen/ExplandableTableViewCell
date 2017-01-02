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
#import "Driver.h"

@interface TelijoTableTableViewController ()<UISearchBarDelegate>
{
    NSMutableArray<NSMutableArray*> *data;
    NSMutableArray<NSMutableArray*> *allData;
    UISearchBar *searchBar;
    BOOL resizeCell;
    NSIndexPath *indexPathRowOpen;
    TelijoTableViewCell *lastCellOpen;
}


@end

@implementation TelijoTableTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    data = [NSMutableArray arrayWithObjects:
            [NSMutableArray arrayWithObjects:[[Driver alloc] initWithName:@"Juan" urlImage:@"" distance:@10 taxiPlates:@"QWE123"], nil],
            [NSMutableArray arrayWithObjects:[[Driver alloc] initWithName:@"Pedro" urlImage:@"" distance:@15 taxiPlates:@"RTE546"], nil],
            [NSMutableArray arrayWithObjects:[[Driver alloc] initWithName:@"Carlos" urlImage:@"" distance:@23 taxiPlates:@"PHK574"], nil],
            [NSMutableArray arrayWithObjects:[[Driver alloc] initWithName:@"Camilo" urlImage:@"" distance:@29 taxiPlates:@"SDA879"], nil],
            [NSMutableArray arrayWithObjects:[[Driver alloc] initWithName:@"Jairo" urlImage:@"" distance:@35 taxiPlates:@"ASS000"], nil],
            [NSMutableArray arrayWithObjects:[[Driver alloc] initWithName:@"Andres" urlImage:@"" distance:@42 taxiPlates:@"TTY054"], nil],
            [NSMutableArray arrayWithObjects:[[Driver alloc] initWithName:@"Jorge" urlImage:@"" distance:@45 taxiPlates:@"CVX324"],nil], nil];
    
    allData = [data mutableCopy];
    
    self.tableView.estimatedRowHeight = UITableViewAutomaticDimension;
    
    [self setupSearchBar];
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard)];
    tapGesture.cancelsTouchesInView = NO;
    [self.view addGestureRecognizer:tapGesture];
    
}


-(void)dismissKeyboard
{
    [searchBar resignFirstResponder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setupSearchBar
{
    searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 45)];
    searchBar.delegate = self;
    searchBar.placeholder = NSLocalizedString(@"Search by plate", nil);
    self.navigationItem.titleView = searchBar;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return data.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [data objectAtIndex:section].count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    Driver *driver = [[data objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
    
    if ([driver.name isEqualToString:@"-- new cell --"])
    {
        static NSString *CellExpandableIdentifer = @"telijoExplandableCell";
        TelijoExpandableTableViewCell *cell = (TelijoExpandableTableViewCell*)[tableView dequeueReusableCellWithIdentifier:CellExpandableIdentifer];
        if (cell == nil)
        {
            cell = (TelijoExpandableTableViewCell*) [[[NSBundle mainBundle] loadNibNamed:@"TelijoExpandableTableViewCell" owner:self options:nil] firstObject];
        }
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    else
    {
        static NSString *CellIdentifer = @"telijoCell";
        TelijoTableViewCell *cell = (TelijoTableViewCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifer];
        if (cell == nil)
        {
            cell = (TelijoTableViewCell*) [[[NSBundle mainBundle] loadNibNamed:@"TelijoTableViewCell" owner:self options:nil] firstObject];
        }
        cell.driverName.text = driver.name;
        cell.taxiPlates.text = driver.taxiPlates;
        cell.distance.text = [NSString stringWithFormat:@"%@mts", driver.distance];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
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
                Driver *driverDetail = [[Driver alloc] initWithName:@"-- new cell --"];
                [arrayRows insertObject:driverDetail atIndex:indexPathNew.row];
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
        return 80;
    }
}

#pragma mark - UISearchBar Delegate Methods
-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    if (searchText.length == 0)
    {
        data = [allData mutableCopy];
    }
    else
    {
        NSPredicate *predicate = [NSPredicate predicateWithFormat:[NSString stringWithFormat:@"ANY taxiPlates contains[c] '%@'",searchText]];
        data = [[allData filteredArrayUsingPredicate:predicate] mutableCopy];
    }
    [self.tableView reloadData];
}

-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [self dismissKeyboard];
}


@end
