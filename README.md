A Dart wrapper for [Google Sign In](https://developers.google.com/identity/).

#### Installing

Add the google_sign_in package to your pubspec.yaml.

#### Using Google with Flutter

This package supports a subset of the Sign In + Identity APIs.

    class Google {
      void setClientId(String clientId);
      Future<GoogleSignInResult> signIn();
    }
    
    class GoogleSignInResult {
      GoogleSignInAccount get account;
      int get statusCode;
      bool get isSuccess;
    }

    class GoogleSignInAccount {
      String displayName;
      String email;
      String id;
      String idToken;
      string photoUrl;
      String serverAuthCode;
    }
