#
# Be sure to run `pod lib lint GoogleSignIn.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'FlutterGoogleSignIn'
  s.version          = '0.0.2'
  s.summary          = 'Convenience wrapper for the Google/SignIn API in Flutter apps.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
FlutterGoogleSignIn helps Flutter iOS apps use the Dart google_sign_in API to authenticate users.
                       DESC

  s.homepage         = 'https://github.com/flutter/google_sign_in'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'BSD', :file => 'LICENSE' }
  s.author           = { 'Collin Jackson' => 'jackson@google.com' }
  s.source           = { :git => 'https://github.com/flutter/google_sign_in.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/flutterio'

  s.ios.deployment_target = '7.0'

  s.source_files = 'ios/FlutterGoogleSignIn/Classes/**/*'
  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit'
  s.dependency 'Google/SignIn', '~> 2.0.4'
end
