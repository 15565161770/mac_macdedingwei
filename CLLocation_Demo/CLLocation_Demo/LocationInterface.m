//
//  LocationInterface.m
//  cloudscreen
//
//  Created by 仝兴伟 on 2017/7/26.
//  Copyright © 2017年 仝兴伟. All rights reserved.
//

#import "LocationInterface.h"
#import <AppKit/AppKit.h>
@interface LocationInterface ()

@end

@implementation LocationInterface
+(instancetype)sharedSocketManger {
    static LocationInterface *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc]init];
    });
    return instance;
}

- (void) printLocation {
    
    if ([CLLocationManager locationServicesEnabled]) {
        printf("location service enabled\n");
        manager = [[CLLocationManager alloc] init];
        manager.delegate = self;
        locationObtained = NO;
        errorOccurred = NO;
        
        [manager startUpdatingLocation];
        
        while(!locationObtained && !errorOccurred) {
            CFRunLoopRun();
        }
        
    } else {
        printf("location service  not enabled\n");
        // 这里可以弹出一个alert提示用户去打开
    }
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation  {
    if (oldLocation != nil) {
        
        self.latitude = [NSString stringWithFormat:@"%f",newLocation.coordinate.latitude];
        self.longitude = [NSString stringWithFormat:@"%f",newLocation.coordinate.longitude];
        printf("%s\n",[[NSString stringWithFormat:@"%f,%f", newLocation.coordinate.latitude, newLocation.coordinate.longitude] UTF8String]);
        locationObtained = YES;
        CFRunLoopStop(CFRunLoopGetCurrent());
    }
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    fprintf(stderr,"%s\n",[[NSString stringWithFormat:@"%@: %@",[error localizedDescription],[error localizedFailureReason]] UTF8String]);
    switch ([error code]) {
        case kCLErrorLocationUnknown:
            printf("Unknown");
            
        case kCLErrorDenied:
            printf("Not allowed");
            
        default:
            break;
    }
    errorOccurred = YES;
    CFRunLoopStop(CFRunLoopGetCurrent());
}

@end
