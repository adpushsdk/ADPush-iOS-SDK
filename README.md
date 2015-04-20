
#AfterPush iOS SDK
*By [AfterPush](http://www.afterpush.com/)*

Current SDK Version : *v1.0*

## Introduction
AfterPush is an Push Notification Service for all the iOS and Android developer to push notification to their users.

###Features
- Fast and lightweight library for push notifications.
- App version control with iTunes Store.
- Easy implementation in Xcode via CocoaPods.
- Live support and rapid updates!
- Push-on-the-go with our AfterPush apps.
- First ever, try pushing notification without having to implement our SDK.


###Change Logs
**Version 1.0**

- AfterPush first version launch
- Remote Push Notifications 
- App version control that syncs with iTunes Store.


##Installation
**1) Get p12 from Apple Developer**

Follow <a href="https://developer.apple.com/library/ios/documentation/IDEs/Conceptual/AppDistributionGuide/ConfiguringPushNotifications/ConfiguringPushNotifications.html">this guide</a> to create certificate for sandbox and production environment, dont forget to enable the push notification on your app id.
####Sandbox
 * Export p12 for your certificate and save as `anps-dev-cert.p12`
 * Export p12 for your private key and save as `apns-dev-key.12`
 
####Production
  * Export p12 for your certificate and save as `anps-pro-cert.p12`
  * Export p12 for your private key and save as `apns-pro-key.12`

  
**2) Convert p12 to PEM format**
######Sandbox:
```cmd
	openssl pkcs12 -clcerts -nokeys -out apns-dev-cert.pem -in apns-dev-cert.p12
	openssl pkcs12 -nocerts -out apns-dev-key.pem -in apns-dev-key.p12
	openssl rsa -in apns-dev-key.pem -out apns-dev-key-noenc.pem
	cat apns-dev-cert.pem apns-dev-key-noenc.pem > apns-dev.pem
```
#####Production:
```cmd
	openssl pkcs12 -clcerts -nokeys -out apns-pro-cert.pem -in apns-pro-cert.p12
	openssl pkcs12 -nocerts -out apns-pro-key.pem -in apns-pro-key.p12
	openssl rsa -in apns-pro-key.pem -out apns-pro-key-noenc.pem
	cat apns-pro-cert.pem apns-pro-key-noenc.pem > apns-pro.pem
```

    
**3) Register an account at AfterPush**
  - Proceed to <a href="http://panel.afterpush.com">AfterPush Panel</a> to create an account. It's quick and easy!

**4) Create your apps and upload pem file.**

![alt text](https://github.com/afterpush/AfterPush-iOS-SDK/blob/master/screenshots/create_app.png)
	
**5) Get your app key**

![alt text](https://github.com/afterpush/AfterPush-iOS-SDK/blob/master/screenshots/app_key.png)
	
**6) Implementing the SDK**

 * Add to your Podfile file.

	Pod 'AfterPushSDK', '~>1.0'
	
 * Download the `AfterPushSDK.h` and `libAfterPushSDK.a` and add to your project with two frameworks:
	CoreLocation.framework
	CoreTelephony.framework
  
**7) Modify Your AppDelegate.m**

#####Navigate to `AppDelegate.m` of your project and include : 
```objc

	#import "AfterPushSDK.h"
	- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
	    // Override point for customization after application launch.
	    
	    [[AfterPushSDK sharedInstance] initWithAppKey:@"YOUR_APP_KEY"];
		#ifdef __IPHONE_8_0
	    //Right, that is the point
	    UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:(UIRemoteNotificationTypeBadge
	                                                                                         |UIRemoteNotificationTypeSound
	                                                                                         |UIRemoteNotificationTypeAlert) categories:nil];
	    [[UIApplication sharedApplication] registerUserNotificationSettings:settings];
		#else
	    //register to receive notifications
	    UIRemoteNotificationType myTypes = UIRemoteNotificationTypeBadge | UIRemoteNotificationTypeAlert |UIRemoteNotificationTypeSound;
	    [[UIApplication sharedApplication] registerForRemoteNotificationTypes:myTypes];
		#endif
	}
	- (void)application:(UIApplication *)application
	didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
	    [[AfterPushSDK sharedInstance] registerDeviceToken:deviceToken];
	}
	- (void)application:(UIApplication *)application
	didReceiveRemoteNotification:(NSDictionary *)userInfo {
	    [[AfterPushSDK sharedInstance] notificationHandler:userInfo];
	}
	
```



***

##Support
Any Problem with SDK, please send your feed back to emai<support@afterpush.com> to us, that's important to us.

