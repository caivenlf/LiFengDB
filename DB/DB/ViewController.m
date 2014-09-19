//
//  ViewController.m
//  DB
//
//  Created by Vincent on 14-9-18.
//  Copyright (c) 2014年 Vicent. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [DBOperation shareInstance];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)firstAction:(id)sender {
    [DBOperation refreshDatabase:@"first" InitTable:YES];
    [DBOperation shareInstance];
}
- (IBAction)secondAction:(id)sender {
    [DBOperation refreshDatabase:@"second" InitTable:YES];
    [DBOperation shareInstance];
}
- (IBAction)thirdAction:(id)sender {
}
- (IBAction)forthAction:(id)sender {
}
@end
