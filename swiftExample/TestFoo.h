//
//  TestFoo.h
//  swiftExample
//
//  Created by pengfei huang on 14-6-30.
//  Copyright (c) 2014年 pengfei huang. All rights reserved.
//
#import <Foundation/Foundation.h>

@interface TestFoo : NSObject

@property (strong, nonatomic) NSString* name;

- (void)sayHello:(NSString*)str;

- (void)testCallSwift;

@end