// Copyright 2016, the Flutter project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

library google_sign_in;

import 'dart:async';

import 'package:flutter/services.dart';
import 'package:sky_services/google/google_sign_in.mojom.dart' as mojom;

export 'package:sky_services/google/google_sign_in.mojom.dart'
  show GoogleSignInUser, GoogleSignInResult;

class _Listener implements mojom.GoogleSignInListener {
  StreamController<mojom.GoogleSignInUser> _streamController;
  _Listener(this._streamController);

  void onCancelled() => _streamController.close();

  void onSignIn(mojom.GoogleSignInResult result) {
    if (result.isSuccess)
      _streamController.add(result.user);
  }

  void onDisconnected(mojom.GoogleSignInResult result) {
    if (result.isSuccess)
      _streamController.add(null);
  }
}

/// GoogleSignIn allows you to authenticate Google users.
class GoogleSignIn {
  GoogleSignIn(String clientID)
    : _streamController = new StreamController<mojom.GoogleSignInUser>.broadcast(),
      _proxy = new mojom.GoogleSignInProxy.unbound() {
    shell.connectToService("google::GoogleSignIn", _proxy);
    mojom.GoogleSignInListenerStub stub = new mojom.GoogleSignInListenerStub.unbound()
      ..impl = new _Listener(_streamController);
    _proxy.ptr.init(clientID, stub);
  }

  mojom.GoogleSignInProxy _proxy;
  StreamController<mojom.GoogleSignInUser> _streamController;

  /// Attempts to sign in a previously authenticated user without interaction.
  void signInSilently() => _proxy.ptr.signInSilently();

  /// Starts the sign-in process.
  void signIn() => _proxy.ptr.signIn();

  /// Marks current user as being in the signed out state.
  void signOut() => _proxy.ptr.signOut();

  /// Disconnects the current user from the app and revokes previous authentication.
  void disconnect() => _proxy.ptr.disconnect();

  /// Stream for changes in current user
  Stream<mojom.GoogleSignInUser> get onCurrentUserChanged => _streamController.stream;
}
