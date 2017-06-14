
#import "SMOSmPermission.h"
#import <CoreLocation/CoreLocation.h>
#import <AVFoundation/AVFoundation.h>
#import <UIKit/UIKit.h>
#import <AddressBook/AddressBook.h>


@implementation SMOSmPermission

- (dispatch_queue_t)methodQueue
{
    return dispatch_get_main_queue();
}

RCT_EXPORT_MODULE()
      
RCT_EXPORT_METHOD(getLocationEnable:(NSDictionary *)params callback:(RCTResponseSenderBlock)callback)
{
    if([CLLocationManager authorizationStatus] == kCLAuthorizationStatusAuthorizedWhenInUse ||
       [CLLocationManager authorizationStatus] == kCLAuthorizationStatusAuthorizedAlways)
    {
        callback(@[@{@"enable":@true}]);
    }else{
        callback(@[@{@"enable":@false}]);
    }
}
      
RCT_EXPORT_METHOD(getAlbumEnable:(NSDictionary *)params callback:(RCTResponseSenderBlock)callback)
{
    if([CLLocationManager authorizationStatus] == kCLAuthorizationStatusAuthorizedWhenInUse ||
       [CLLocationManager authorizationStatus] == kCLAuthorizationStatusAuthorizedAlways)
    {
        callback(@[@{@"enable":@true}]);
    }else{
        callback(@[@{@"enable":@false}]);
    }
}

RCT_EXPORT_METHOD(getCameraEnable:(NSDictionary *)params callback:(RCTResponseSenderBlock)callback)
{
    AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
    if (authStatus != AVAuthorizationStatusAuthorized)
    {
        callback(@[@{@"enable":@false}]);
    }else{
        callback(@[@{@"enable":@true}]);
    }
}

RCT_EXPORT_METHOD(getInformEnable:(NSDictionary *)params callback:(RCTResponseSenderBlock)callback)
{
    UIUserNotificationSettings *setting = [[UIApplication sharedApplication] currentUserNotificationSettings];
    if (UIUserNotificationTypeNone != setting.types)
    {
        callback(@[@{@"enable":@true}]);
    }else{
        callback(@[@{@"enable":@false}]);
    }
}
      
RCT_EXPORT_METHOD(getRecordEnable:(NSDictionary *)params callback:(RCTResponseSenderBlock)callback)
{
    AVAudioSessionRecordPermission permissionStatus = [[AVAudioSession sharedInstance] recordPermission];
    if (permissionStatus == AVAudioSessionRecordPermissionGranted)
    {
        callback(@[@{@"enable":@true}]);
    }else{
        callback(@[@{@"enable":@false}]);
    }
}
      
RCT_EXPORT_METHOD(getPhoneEnable:(NSDictionary *)params callback:(RCTResponseSenderBlock)callback)
{
    callback(@[@{@"enable":@true}]);
}

RCT_EXPORT_METHOD(getAddressEnable:(NSDictionary *)params callback:(RCTResponseSenderBlock)callback)
{
    ABAuthorizationStatus authStatus = ABAddressBookGetAuthorizationStatus();
    if (kABAuthorizationStatusAuthorized == authStatus)
    {
        callback(@[@{@"enable":@true}]);
    }else{
        callback(@[@{@"enable":@false}]);
    }
}
      
RCT_EXPORT_METHOD(getReadStorage:(NSDictionary *)params callback:(RCTResponseSenderBlock)callback)
{
    callback(@[@{@"enable":@true}]);
}

@end
  
