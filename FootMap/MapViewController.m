//
//  MapViewController.m
//  FootMap
//
//  Created by davidBear on 14-3-25.
//  Copyright (c) 2014年 Atirun. All rights reserved.
//

#import "MapViewController.h"
#import <YMapKit/YMapKit.h>

@interface MapViewController ()
@property (strong, nonatomic) YMKMapView *cityMap;
@property (strong, nonatomic) CLLocationManager *locationManager;
@property(strong, nonatomic) UIPanGestureRecognizer *navigationBarPanGestureRecognizer;
@end

@implementation MapViewController
@synthesize navigationBarPanGestureRecognizer;
@synthesize cityMap;
@synthesize locationManager; // use to obtain the axis

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
        
        if (![self.navigationItem rightBarButtonItem]) {
            UIBarButtonItem *locationButton =[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSearch target:self action:@selector(update)];
            self.navigationItem.rightBarButtonItem = locationButton;
        }
        
    }
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    //--- Require the nowa position axis ---//
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    self.locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters; //
    self.locationManager.distanceFilter = kCLDistanceFilterNone;  // 5m移動するごとに取得
    
    //--- Display the position ---//
    self.cityMap = [[YMKMapView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height-64) appid:@"dj0zaiZpPVpUVXlhMFlTaDRNUCZzPWNvbnN1bWVyc2VjcmV0Jng9MWI-"];
    cityMap.mapType = YMKMapTypeStandard;
    cityMap.delegate = self;
    cityMap.zoomEnabled = TRUE;
    cityMap.showsUserLocation = TRUE;
    // initialize the position
    [self.locationManager startUpdatingLocation];
    [self.view addSubview:self.cityMap];
    
    
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Chasing the nowa position

- (void)update {
    [self.locationManager startUpdatingLocation];
}

- (void)stopLocation {
    [self.locationManager stopUpdatingLocation];
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation {
    CLLocationCoordinate2D coordinate;
    coordinate.latitude = newLocation.coordinate.latitude;
    coordinate.longitude = newLocation.coordinate.longitude;
    
    self.cityMap.region = YMKCoordinateRegionMake(coordinate, YMKCoordinateSpanMake(0.005, 0.005));
    
    YMKCircle *circle = [YMKCircle circleWithCenterCoordinate:coordinate radius:50];
    [self.cityMap addOverlay: circle];
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    [self.locationManager stopUpdatingLocation];
}

#pragma mark - Define the circle
- (YMKOverlayView*)mapView:(YMKMapView *)mapView viewForOverlay:(id <YMKOverlay>)overlay
{
    //追加されたoverlayがYMKCircleか確認
    if([overlay isKindOfClass:[YMKCircle class]] ){
        //YMKCircleViewを作成
        YMKCircleView *wkYMKCircleView = [[YMKCircleView alloc] initWithCircle:overlay];
        //ラインの色を青に設定
        wkYMKCircleView.strokeColor = [UIColor colorWithRed:0.0 green:0.0 blue:1.0 alpha:0.1];
        wkYMKCircleView.fillColor =  [UIColor colorWithRed:0.0 green:0.0 blue:1.0 alpha:0.1];
        //ラインの太さ
        wkYMKCircleView.lineWidth = 5;
        return wkYMKCircleView;
    }
    return nil;
}


@end
























