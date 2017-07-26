//
//  LocationInterface.h
//  cloudscreen
//
//  Created by 仝兴伟 on 2017/7/26.
//  Copyright © 2017年 仝兴伟. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface LocationInterface : NSObject<CLLocationManagerDelegate>{
    CLLocationManager * manager;
    BOOL locationObtained, errorOccurred;
}
@property (nonatomic, strong)NSString *latitude;
@property (nonatomic, strong)NSString *longitude;
+ (instancetype)sharedSocketManger;

- (void) printLocation;
@end
