//
//  RevealViewController.m
//  FootMap
//
//  Created by davidBear.ZhangLab on 3/25/14.
//  Copyright (c) 2014 Atirun. All rights reserved.
//

#import "RevealViewController.h"
#import "FrontViewController.h"
#import "RearViewController.h"

@interface RevealViewController ()

@end

@implementation RevealViewController

- (id)initWithFrontViewController:(UIViewController *)aFrontViewController rearViewController:(UIViewController *)aBackViewController
{
	self = [super initWithFrontViewController:aFrontViewController rearViewController:aBackViewController];
	
	if (nil != self)
	{
		self.delegate = self;
	}
	
	return self;
}

#pragma mark - View lifecycle


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
	return (toInterfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}


@end
