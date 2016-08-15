A Flutter wrapper for [Google Sign In](https://developers.google.com/identity/).

Note: This is a work-in-progress, and is not fully supported by the Flutter team.
(For example, we don't have this under continuous integration and testing.)


### Building the example

You will need to register a new application in the Google Developer console to run the example in this repository.

#### iOS

Make sure you have CocoaPods installed and run ```pod install``` in the example/ios folder. You can now open ```example/ios/GoogleSignInExample.xcworkspace``` in Xcode. Go to the [iOS Sign-In SDK instructions](https://developers.google.com/identity/sign-in/ios/start) and follow the instructions to add a GoogleServices-Info.plist file to your project and to set up a URL type for REVERSED_CLIENT_ID to handle the callback.

Use ```flutter run``` to create the Generated.xcconfig file, build the example, and install it on the iOS simulator or device. You should be able to sign in successfully.

### Adding to an existing project

#### iOS

Make sure you have CocoaPods installed and run ```pod init``` in your ios folder.
Edit your Podfile to add ```pod 'FlutterGoogleSignIn``` and run ```pod install```.
You can now open ```example/ios/Runner.xcworkspace``` in Xcode.

Go to the [iOS Sign-In SDK instructions](https://developers.google.com/identity/sign-in/ios/start) and follow the instructions to add a GoogleServices-Info.plist file to your Runner project and to set up a URL type for REVERSED_CLIENT_ID to handle the callback.

Modify your AppDelegate.m to pass your view controller to the FLTGoogleSignIn shared instance and notify it when your application is opened with a URL:

```objective-c
#import <GoogleSignIn/FLTGoogleSignIn.h>

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    FlutterViewController *controller = (FlutterViewController*)self.window.rootViewController;
    [controller addAsyncMessageListener:[FLTGoogleSignIn sharedInstance]];
    [FLTGoogleSignIn sharedInstance].uiDelegate = controller;
    return YES;
}

- (BOOL)application:(UIApplication *)app
            openURL:(NSURL *)url
            options:(NSDictionary *)options {
    return [[FLTGoogleSignIn sharedInstance] handleURL:url
                                     sourceApplication:options[UIApplicationOpenURLOptionsSourceApplicationKey]
                                            annotation:options[UIApplicationOpenURLOptionsAnnotationKey]];
}
```

### Compiling from source

If you want to make changes to the FlutterGoogleSignIn class, you'll need to build from source rather than using the published binaries.
You'll need a local checkout of the google_sign_in repository, which can be in any location.

#### iOS

Change the reference Podfile to ```pod 'FlutterGoogleSignIn', :path => '/path/to/google_sign_in'``` and run ```pod install```.

You should now be able to build from source using Xcode or ```flutter run```.

## Issues and feedback

Please file [issues](https://github.com/flutter/flutter/issues/new)
to send feedback or report a bug. Thank you!
