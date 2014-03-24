//
//  RearViewController.m
//  FootMap
//
//  Created by davidBear on 14-3-25.
//  Copyright (c) 2014年 Atirun. All rights reserved.
//
// 这个页面是后面的页面


#import "RearViewController.h"
#import "MapViewController.h"
#import "FrontViewController.h"

@interface RearViewController ()
@property(strong, nonatomic) UITableView *rearTableView;
@property (strong, nonatomic) MapViewController *mapViewController;
@property (strong, nonatomic) FrontViewController *frontViewController;

@end

@implementation RearViewController
@synthesize rearTableView;
@synthesize mapViewController;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.view.backgroundColor = [UIColor colorWithRed:189 green:195 blue:199 alpha:1.0];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.rearTableView =[[UITableView alloc] initWithFrame:CGRectMake(0, 44, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    self.rearTableView.delegate = self;
    self.rearTableView.dataSource = self;
    //self.rearTableView.scrollEnabled = FALSE;
    [self.rearTableView setSeparatorInset:UIEdgeInsetsZero];
    [self.view addSubview:self.rearTableView];
    
    self.frontViewController = [[FrontViewController alloc] initWithNibName:NULL bundle:nil];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - TableView Method
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
     /*
     0. 喜欢的
     1. 最近看过的
     2. 通知
     3. 设置&通知
     */
    return 4;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"rearCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (nil == cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    //--- Define the cell.textLabel---//
    cell.textLabel.textColor = [UIColor grayColor];
    CGFloat fontSize = 15.0f;
    cell.textLabel.font = [UIFont systemFontOfSize:fontSize];
    
    UIImage *profileImage = [UIImage imageNamed:@"boy.png"];
    UIImage *mapImage = [UIImage imageNamed:@"map.png"];
    UIImage *analyticImage = [UIImage imageNamed:@"analytic.png"];
    UIImage *recommendImage = [UIImage imageNamed: @"recommend.png"];
    switch (indexPath.row) {
        case 0:
            // name here
            cell.imageView.image = profileImage;
            CGFloat fontSize = 25.0f;
            cell.textLabel.font = [UIFont systemFontOfSize:fontSize];
            cell.textLabel.text = @"Mr.Footmap";
            break;
        case 1:
            // name here
            cell.textLabel.text = @"WHERE AM I?";
            cell.imageView.image = mapImage;
            break;
        case 2:
            // name here
            cell.imageView.image = analyticImage;
            cell.textLabel.text = @"ANALITICS";
            break;
        case 3:
            // name here
            cell.imageView.image = recommendImage;
            cell.textLabel.text = @"RECOMMENDING";
            break;
    }
    
    //--- Define the accessory Type ---//
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
    
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat heightForRow = 0.0f;
    if (indexPath.row==0) {
        heightForRow = 100.0f;
    }
    else{
        heightForRow = 44.0f;
    }
    return heightForRow;
}

#pragma mark - enter the next view;
- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([tableView isEqual:self.rearTableView]) {
        switch (indexPath.row) {
            case 1:
                /*
                self.mapViewController = [[MapViewController alloc] initWithNibName:NULL bundle:nil];
                UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:self.mapViewController ];
                [self setFrontViewController:navigationController];
                */
                break;
                
        }
    }
}

@end







































