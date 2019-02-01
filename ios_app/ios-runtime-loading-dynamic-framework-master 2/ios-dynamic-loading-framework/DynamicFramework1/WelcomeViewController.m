//
//  WelcomeViewController.m
//  DynamicFramework1
//
//  Created by Glussian on 1/2/19.
//  Copyright © 2019 CarmineStudios. All rights reserved.
//

#import "WelcomeViewController.h"

@interface WelcomeViewController ()

@end

@implementation WelcomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

+(void)load
    {
        [super load];
        NSLog(@"Loading WelcomeViewController in dynamic-framework-1");
    }
    
+ (UIViewController *) controller
    {
        NSBundle *bundz = [NSBundle bundleForClass:[self class]] ;
        
        return [[WelcomeViewController alloc] initWithNibName:@"WelcomeViewController" bundle:bundz] ;
        
    }
    
    



@end
