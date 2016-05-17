A Dart wrapper for [Google Sign In](https://developers.google.com/identity/).

The Google Sign-In SDK is currently only supported on iOS.

#### Installing

Add google_sign_in as a dependency in your pubspec.yaml.

Ensure that ```google_sign_in``` is listed in the ```services``` section of
your flutter.yaml:
```yaml
    services:
      - google_sign_in
```
Go to the [Google Sign-In SDK instructions](https://developers.google.com/identity/sign-in/ios/sdk/)
and follow the instructions to get a configuration file.

Add the following to your ios/Info.plist:
```
    <key>CFBundleURLTypes</key>
    <array>
      <dict>
        <key>CFBundleTypeRole</key>
        <string>Editor</string>
        <key>CFBundleURLSchemes</key>
        <array>
          <string>BUNDLE_ID_FROM_CONFIGURATION_FILE</string>
        </array>
      </dict>
      <dict>
        <key>CFBundleTypeRole</key>
        <string>Editor</string>
        <key>CFBundleURLSchemes</key>
        <array>
          <string>REVERSED_CLIENT_ID_FROM_CONFIGURATION_FILE</string>
        </array>
      </dict>
    </array>
    <key>LSApplicationQueriesSchemes</key>
    <array>
        <string>com-google-gidconsent-google</string>
        <string>com-google-gidconsent-youtube</string>
        <string>com-google-gidconsent</string>
        <string>com.google.gppconsent.2.4.1</string>
        <string>com.google.gppconsent.2.4.0</string>
        <string>googlechrome</string>
        <string>googlechrome-x-callback</string>
        <string>hasgplus4</string>
        <string>com.google.gppconsent.2.3.0</string>
        <string>com.google.gppconsent.2.2.0</string>
        <string>com.google.gppconsent</string>
    </array>
```

### Building generated files from source

Files in the lib/generated folder require a Flutter engine to build.

Clone this repository into your Flutter engine repository's ```third_party/google_sign_in``` directory.

To build for iOS:
```
./sky/tools/gn --ios --simulator --enable-google-sign-in
ninja -C out/ios_debug_sim/ third_party/google_sign_in
./sky/tools/gn --ios --runtime-mode release --enable-google-sign-in
ninja -C out/ios_release/ third_party/google_sign_in
lipo out/ios_debug_sim/libGoogleSignIn.dylib out/ios_release/libGoogleSignIn.dylib -create -output third_party/google_sign_in/lib/generated/ios/libGoogleSignIn.dylib 
cp out/ios_debug_sim/gen/third_party/google_sign_in/mojom/google_sign_in.mojom.dart third_party/google_sign_in/lib/generated
```

To build for Android:
```
./sky/tools/gn --android --enable-google-sign-in
ninja -C out/android_debug/
cp out/android_debug//gen/third_party/google_sign_in/interfaces_java.jar third_party/google_sign_in/android/mojo/libs
cp out/android_debug//gen/mojo/public/java/bindings.jar third_party/google_sign_in/android/mojo/libs
cp out/android_debug//gen/mojo/public/java/system.jar third_party/google_sign_in/android/mojo/libs
cp out/android_debug/gen/third_party/google_sign_in/mojom/google_sign_in.mojom.dart third_party/google_sign_in/lib/generated
(cd third_party/google_sign_in/android && ./gradlew build)
cp -r third_party/google_sign_in/android/mojo/build/intermediates/ third_party/google_sign_in/lib/generated/android/ 2>&1 | grep -v 'Permission denied'
```

