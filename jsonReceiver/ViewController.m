//
//  ViewController.m
//  jsonReceiver
//
//  Created by ohtake shingo on 2014/03/15.
//  Copyright (c) 2014年 ohtake shingo. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    WebApiAccess* aaa = [[WebApiAccess alloc]init];
    aaa.delegate = self;
    [aaa getJson];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)didFinishedGetJson:(NSArray*)data{
    
    for (NSString*s in data) {
        NSLog(@"OOOKKK%@",s);
    }
    
}

@end
