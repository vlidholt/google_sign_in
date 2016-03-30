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
