//
//  ViewController.m
//  SESample
//
//  Created by Yukinaga Azuma on 2014/01/11.
//  Copyright (c) 2014年 Yukinaga Azuma. All rights reserved.
//

#import "ViewController.h"
#import "SEManager.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

-(IBAction)button1Tapped:(id)sender{
    [[SEManager sharedManager] playSound:@"yeah.m4a"];
}

-(IBAction)button2Tapped:(id)sender{
    [[SEManager sharedManager] playSound:@"boo.m4a"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
