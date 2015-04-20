#
#  Be sure to run `pod spec lint AfterPushSDK.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|


  s.name         = "AfterPushSDK"
  s.version      = "0.0.4"
  s.summary      = "AfterPushSDK for iOS."

  s.description  = "AfterPush SDK for iOS. \nAfterPush is an Push Notification Service for all the iOS and Android developer to push notification to their users.\n           Please visithttp://www.afterpush.com/ \n"

  s.homepage     = "http://www.afterpush.com"

  s.license      = { :type => 'Copyright', :text => "LICENSE Copyright 2014 - 2015 Afterpush.com, Inc. All rights reserved"}


  s.author             = 'AfterPush'
  s.social_media_url   = "http://twitter.com/AfterPush"

  s.platform      = :ios, '7.0'
  s.source       = { :git => "https://github.com/afterpush/AfterPush-iOS-SDK.git", :tag => s.version.to_s }


  s.source_files  = "*.h"
  s.preserve_paths = "*.a"

  s.requires_arc = true

  s.xcconfig = { "HEADER_SEARCH_PATHS" => "$(PODS_ROOT)/AfterPushSDK/" }

end
