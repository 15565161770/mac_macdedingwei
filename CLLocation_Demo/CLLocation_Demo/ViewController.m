//
//  ViewController.m
//  CLLocation_Demo
//
//  Created by 仝兴伟 on 2017/7/26.
//  Copyright © 2017年 仝兴伟. All rights reserved.
//

#import "ViewController.h"
#import "LocationInterface.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//        LocationInterface* li = [[LocationInterface alloc] init];
//        [li printLocation];

    [[LocationInterface sharedSocketManger]printLocation];
    NSLog(@"---经度---%@", [[LocationInterface sharedSocketManger]longitude]);
    NSLog(@"---纬度---%@", [[LocationInterface sharedSocketManger]latitude]);

    if ([[LocationInterface sharedSocketManger]longitude]) {
        NSLog(@"1111---获取到了地理位置");
    } else {
        NSLog(@"222---没有获取到地理位置");
    }
    
}

#pragma mark -- delegate













- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}


@end
