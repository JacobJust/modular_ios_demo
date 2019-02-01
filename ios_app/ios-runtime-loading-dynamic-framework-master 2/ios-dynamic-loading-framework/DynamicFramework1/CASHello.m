//
//  CASHello.m
//  ios-dynamic-loading-framework
//
//  Created by Patrik Nyblad on 18/05/16.
//  Copyright © 2016 CarmineStudios. All rights reserved.
//

#import "CASHello.h"

@implementation CASHello

+(void)load
{
    [super load];
    NSLog(@"Loading CASHello in dynamic-framework-1");
}

+(NSString *)hello
{
    return @"Super ca marche" ;
}

@end
