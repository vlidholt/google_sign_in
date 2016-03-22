library google_sign_in;

import 'dart:async';

import 'package:flutter/services.dart';
import 'package:sky_services/google/google_sign_in.mojom.dart' as mojo;

export 'package:sky_services/google/google_sign_in.mojom.dart'
  show GoogleSignInUser, GoogleSignInResult;

class _Listener implements mojo.GoogleSignInListener {
  StreamController<mojo.GoogleSignInUser> _streamController;
  _Listener(this._streamController);

  void onCancelled() => _streamController.close();

  void onSignIn(mojo.GoogleSignInResult result) {
    if (result.isSuccess)
      _streamController.add(result.user);
  }

  void onDisconnected(mojo.GoogleSignInResult result) {
    if (result.isSuccess)
      _streamController.add(null);
  }
}

/**
 * GoogleSignIn allows you to authenticate Google users.
 */
class GoogleSignIn {
  GoogleSignIn(String clientID)
    : _streamController = new StreamController<mojo.GoogleSignInUser>.broadcast(),
      _proxy = new mojo.GoogleSignInProxy.unbound() {
    shell.connectToService("google::GoogleSignIn", _proxy);
    mojo.GoogleSignInListenerStub stub = new mojo.GoogleSignInListenerStub.unbound()
      ..impl = new _Listener(_streamController);
    _proxy.ptr.init(clientID, stub);
  }

  mojo.GoogleSignInProxy _proxy;
  StreamController<mojo.GoogleSignInUser> _streamController;

  /**
   * Attempts to sign in a previously authenticated user without interaction.
   */
  void signInSilently() => _proxy.ptr.signInSilently();

  /**
   * Starts the sign-in process.
   */
  void signIn() => _proxy.ptr.signIn();

  /**
   * Marks current user as being in the signed out state.
   */
  void signOut() => _proxy.ptr.signOut();

  /**
   * Disconnects the current user from the app and revokes previous authentication.
   */
  void disconnect() => _proxy.ptr.disconnect();

  /**
   * Stream for changes in current user
   */
  Stream<mojo.GoogleSignInUser> get onCurrentUserChanged => _streamController.stream;
}
