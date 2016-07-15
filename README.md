A Dart wrapper for [Google Sign In](https://developers.google.com/identity/).

### Building the example

#### Android

Update android/local.properties to add flutter.sdk=/path/to/flutter/sdk

Go to the [Android Sign-In SDK instructions](https://developers.google.com/identity/sign-in/android/start)
and follow the instructions to download a google-services.json file. Move this file
to ```android/app/google-services.json```. You can now open the example/android folder in Android Studio and run the app on an Android device.

#### iOS

Make sure you have CocoaPods installed and run ```pod install``` in the example/ios folder. You can now open ```example/ios/GoogleSignInExample.xcworkspace``` in Xcode. Go to the [iOS Sign-In SDK instructions](https://developers.google.com/identity/sign-in/ios/start) and follow the instructions to add a GoogleServices-Info.plist file to your project and to set up a URL type for REVERSED_CLIENT_ID to handle the callback.

Use ```flutter run``` to create the Generated.xcconfig file, build the example, and install it on the iOS simulator or device. You should be able to sign in successfully.

### Adding to an existing project

#### Android

Go to the [Android Sign-In SDK instructions](https://developers.google.com/identity/sign-in/android/start)
and follow the instructions to download a google-services.json file. Move this file
to your application's ```android/app/google-services.json``` directory.

Add google_sign_in as a dependency in your pubspec.yaml.

Add the following to your Android buildscript dependencies in the project root build.gradle:

```
    classpath 'com.google.gms:google-services:3.0.0'
```

Add the following to your application's build.gradle. [WARNING: google-sign-in module has not yet been published to jcenter, so you'll need to follow the "Compiling from source" instructions instead.]

```
dependencies {
    compile 'com.google.android.gms:play-services-auth:9.0.2'
    compile 'io.flutter.google_sign_in:google-sign-in:0.0.1'
}
apply plugin: 'com.google.gms.google-services'
```

In your activity class, add the following:

```
    private FlutterGoogleSignIn mGoogleSignIn;
    private static final int RC_SIGN_IN = 9001;  // Can be any integer you're not using as a request code
    @Override
    public void onActivityResult(int requestCode, int resultCode, Intent data) {
        super.onActivityResult(requestCode, resultCode, data);
        mGoogleSignIn.onActivityResult(requestCode, resultCode, data);
    }
```

At the end of your activity's onCreate method, add the following:

```
        GoogleSignInOptions options = new GoogleSignInOptions.Builder(GoogleSignInOptions.DEFAULT_SIGN_IN)
                .requestEmail()
                // Request additional scopes like this:
                // .requestScopes(new Scope("..."))
                .build();
        mGoogleSignIn = new FlutterGoogleSignIn(this, flutterView, options, RC_SIGN_IN);
```

In your Dart code, you can now call APIs like GoogleSignIn.signIn(). Refer to the example app or the [API documentation](http://flutter.github.io/google_sign_in/) for usage.

#### iOS

Make sure you have CocoaPods installed and run ```pod init``` in your ios folder.
Edit your Podfile to add ```pod 'Flutter/GoogleSignIn``` and run ```pod install```.
You can now open ```example/ios/GoogleSignInExample.xcworkspace``` in Xcode.

Go to the [iOS Sign-In SDK instructions](https://developers.google.com/identity/sign-in/ios/start) and follow the instructions to add a GoogleServices-Info.plist file to your project and to set up a URL type for REVERSED_CLIENT_ID to handle the callback.

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

#### Android

In your application's build.gradle, change ```compile 'io.flutter.google_sign_in:google-sign-in:9.0.2``` to ```compile project(':googleSignIn')```.

Create a soft link called googleSignIn in the ```android``` folder of your application. It should point to the ```android``` folder in the root of this repository.

Add ':googleSignIn' to the list of includes in your application's settings.gradle.

Copy bin/cache/artifacts/engine/android-arm/flutter.jar from your Flutter SDK into android/libs.

Run ```zip -d flutter.jar "assets/*" "lib/*"``` in the android/libs directory.

You should now be able to build from source using Android Studio.

#### iOS

Change the reference Podfile to ```pod 'Flutter/GoogleSignIn', :path => '/path/to/google_sign_in'``` and run ```pod install```.
