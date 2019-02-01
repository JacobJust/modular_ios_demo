//
//  Framework2ViewController.m
//  DynamicFramework2
//
//  Created by Kevin Bertholio on 01/02/2019.
//  Copyright © 2019 CarmineStudios. All rights reserved.
//

#import "Framework2ViewController.h"

@interface Framework2ViewController ()

@end

@implementation Framework2ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

+(void)load
{
    [super load];
    NSLog(@"Loading Framework2ViewController in dynamic-framework-1");
}

+ (UIViewController *) controller
{
    NSBundle *bundz = [NSBundle bundleForClass:[self class]] ;
    
    return [[Framework2ViewController alloc] initWithNibName:@"Framework2ViewController" bundle:bundz] ;
    
}

@end
