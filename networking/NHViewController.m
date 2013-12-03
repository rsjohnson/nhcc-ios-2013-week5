//
//  NHViewController.m
//  networking
//
//  Created by Ryan Johnson on 11/25/13.
//  Copyright (c) 2013 NHCC. All rights reserved.
//

#import "NHViewController.h"
#import "NHNetworkManager.h"

@interface NHViewController ()

@end

@implementation NHViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [[NHNetworkManager sharedManager] downloadGoogle];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
