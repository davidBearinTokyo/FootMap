//
//  MapViewController.m
//  FootMap
//
//  Created by davidBear on 14-3-25.
//  Copyright (c) 2014年 Atirun. All rights reserved.
//

#import "MapViewController.h"

@interface MapViewController ()
@property(strong, nonatomic) UIPanGestureRecognizer *navigationBarPanGestureRecognizer;
@end

@implementation MapViewController
@synthesize navigationBarPanGestureRecognizer;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
       self.view.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    if ([self.navigationController.parentViewController respondsToSelector:@selector(revealGesture:)] && [self.navigationController.parentViewController respondsToSelector:@selector(revealToggle:)]){
        if (![[self.navigationController.navigationBar gestureRecognizers] containsObject: self.navigationBarPanGestureRecognizer]) {
            self.navigationBarPanGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self.navigationController.parentViewController action:@selector(revealGesture:)];
            [self.navigationController.navigationBar addGestureRecognizer:self.navigationBarPanGestureRecognizer];
        }
        if(![[self.view gestureRecognizers] containsObject: self.navigationBarPanGestureRecognizer]){
            self.navigationBarPanGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self.navigationController.parentViewController action:@selector(revealGesture:)];
            [self.view addGestureRecognizer:self.navigationBarPanGestureRecognizer];
        }
        if (![self.navigationItem leftBarButtonItem]) {
            UIBarButtonItem *revealButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"Details.png"] style:UIBarButtonItemStyleBordered target:self.navigationController.parentViewController action:@selector(revealToggle:)];
            self.navigationItem.leftBarButtonItem = revealButton;
        }
    }
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"Map View awaken!");
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
