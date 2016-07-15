#import <Flutter/Flutter.h>
#include "AppDelegate.h"

#import <FlutterGoogleSignIn/FlutterGoogleSignIn.h>

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

@end
