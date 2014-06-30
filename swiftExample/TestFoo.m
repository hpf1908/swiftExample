//
//  TestFoo.m
//  swiftExample
//
//  Created by pengfei huang on 14-6-30.
//  Copyright (c) 2014年 pengfei huang. All rights reserved.
//

#import "TestFoo.h"
#import "swiftExample-Swift.h"

@implementation TestFoo

- (void)sayHello:(NSString*)str
{
    NSLog(@"hello from swift :%@",str);
}

- (void)testCallSwift
{
    SwiftFoo* foo = [[SwiftFoo alloc] init];
    [foo hello:@"flyhuang"];
}

@end