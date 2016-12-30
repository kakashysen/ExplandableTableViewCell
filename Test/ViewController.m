//
//  ViewController.m
//  Test
//
//  Created by Jose Aponte on 12/29/16.
//  Copyright © 2016 jappsku. All rights reserved.
//

#import "ViewController.h"
#import "Test-Swift.h"

#import "CustomTableTableViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UIView *container;

@end

@implementation ViewController

#define screemSize [UIScreen mainScreen]

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view, typically from a nib.
  [self setupSegmentServiceOptions];
}


-(void)setupSegmentServiceOptions
{
  SMSegmentView *segment = [[SMSegmentView alloc]
                            initWithFrame:CGRectMake(0, 0, screemSize.bounds.size.width, 50)];
  
  segment.layer.cornerRadius = 5.0;
  segment.layer.borderColor = [UIColor colorWithWhite:0.85 alpha:1].CGColor;
  segment.layer.borderWidth = 1.0;
  
  segment.backgroundColor = [UIColor clearColor];
  SMSegmentAppearance *appearance = [SMSegmentAppearance new];
  [appearance setSegmentOnSelectionColour:[UIColor purpleColor]];
  [appearance setSegmentOffSelectionColour:[UIColor colorWithWhite:1.0 alpha:0.8]];
  [appearance setTitleOnSelectionFont:[UIFont systemFontOfSize:9]];
  [appearance setTitleOnSelectionFont:[UIFont systemFontOfSize:9]];
  [appearance setTitleOnSelectionColour:[UIColor whiteColor]];
  [appearance setTitleOnSelectionColour:[UIColor darkGrayColor]];
  [appearance setContentVerticalMargin:18.0]; 
  [segment setSegmentAppearance:appearance];
  
  [segment addSegmentWithTitle:@"Taxi" onSelectionImage:[UIImage imageNamed:@"taxi"] offSelectionImage:[UIImage imageNamed:@"taxi"]];
  [segment addSegmentWithTitle:@"Mensajeria" onSelectionImage:[UIImage imageNamed:@"email"] offSelectionImage:[UIImage imageNamed:@"email"]];
  [segment addSegmentWithTitle:@"T-Elijo" onSelectionImage:[UIImage imageNamed:@"elijo"] offSelectionImage:[UIImage imageNamed:@"elijo"]];
  
  [segment setSelectedSegmentIndex:0];
  
  [segment addTarget:self action:@selector(selectedSegment:) forControlEvents:UIControlEventValueChanged];
  [self.container addSubview:segment];
  
}

-(void)selectedSegment:(SMSegmentView*) segment
{
  UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
  CustomTableTableViewController *tbc = [storyboard instantiateViewControllerWithIdentifier:@"CustomTableTableViewController"];
  [self.navigationController pushViewController:tbc animated:YES];
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}


@end
