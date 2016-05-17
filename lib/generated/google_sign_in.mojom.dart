// Copyright 2014 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

library google_sign_in_mojom;
import 'dart:async';
import 'package:mojo/bindings.dart' as bindings;
import 'package:mojo/core.dart' as core;
import 'package:mojo/mojo/bindings/types/service_describer.mojom.dart' as service_describer;



class GoogleSignInUser extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(56, 0)
  ];
  String displayName = null;
  String email = null;
  String id = null;
  String idToken = null;
  String accessToken = null;
  String photoUrl = null;

  GoogleSignInUser() : super(kVersions.last.size);

  static GoogleSignInUser deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static GoogleSignInUser decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    GoogleSignInUser result = new GoogleSignInUser();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if (mainDataHeader.version <= kVersions.last.version) {
      // Scan in reverse order to optimize for more recent versions.
      for (int i = kVersions.length - 1; i >= 0; --i) {
        if (mainDataHeader.version >= kVersions[i].version) {
          if (mainDataHeader.size == kVersions[i].size) {
            // Found a match.
            break;
          }
          throw new bindings.MojoCodecError(
              'Header size doesn\'t correspond to known version size.');
        }
      }
    } else if (mainDataHeader.size < kVersions.last.size) {
      throw new bindings.MojoCodecError(
        'Message newer than the last known version cannot be shorter than '
        'required by the last known version.');
    }
    if (mainDataHeader.version >= 0) {
      
      result.displayName = decoder0.decodeString(8, false);
    }
    if (mainDataHeader.version >= 0) {
      
      result.email = decoder0.decodeString(16, false);
    }
    if (mainDataHeader.version >= 0) {
      
      result.id = decoder0.decodeString(24, false);
    }
    if (mainDataHeader.version >= 0) {
      
      result.idToken = decoder0.decodeString(32, false);
    }
    if (mainDataHeader.version >= 0) {
      
      result.accessToken = decoder0.decodeString(40, false);
    }
    if (mainDataHeader.version >= 0) {
      
      result.photoUrl = decoder0.decodeString(48, false);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    try {
      encoder0.encodeString(displayName, 8, false);
    } on bindings.MojoCodecError catch(e) {
      e.message = "Error encountered while encoding field "
          "displayName of struct GoogleSignInUser: $e";
      rethrow;
    }
    try {
      encoder0.encodeString(email, 16, false);
    } on bindings.MojoCodecError catch(e) {
      e.message = "Error encountered while encoding field "
          "email of struct GoogleSignInUser: $e";
      rethrow;
    }
    try {
      encoder0.encodeString(id, 24, false);
    } on bindings.MojoCodecError catch(e) {
      e.message = "Error encountered while encoding field "
          "id of struct GoogleSignInUser: $e";
      rethrow;
    }
    try {
      encoder0.encodeString(idToken, 32, false);
    } on bindings.MojoCodecError catch(e) {
      e.message = "Error encountered while encoding field "
          "idToken of struct GoogleSignInUser: $e";
      rethrow;
    }
    try {
      encoder0.encodeString(accessToken, 40, false);
    } on bindings.MojoCodecError catch(e) {
      e.message = "Error encountered while encoding field "
          "accessToken of struct GoogleSignInUser: $e";
      rethrow;
    }
    try {
      encoder0.encodeString(photoUrl, 48, false);
    } on bindings.MojoCodecError catch(e) {
      e.message = "Error encountered while encoding field "
          "photoUrl of struct GoogleSignInUser: $e";
      rethrow;
    }
  }

  String toString() {
    return "GoogleSignInUser("
           "displayName: $displayName" ", "
           "email: $email" ", "
           "id: $id" ", "
           "idToken: $idToken" ", "
           "accessToken: $accessToken" ", "
           "photoUrl: $photoUrl" ")";
  }

  Map toJson() {
    Map map = new Map();
    map["displayName"] = displayName;
    map["email"] = email;
    map["id"] = id;
    map["idToken"] = idToken;
    map["accessToken"] = accessToken;
    map["photoUrl"] = photoUrl;
    return map;
  }
}


class GoogleSignInResult extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(24, 0)
  ];
  GoogleSignInUser user = null;
  bool isSuccess = false;

  GoogleSignInResult() : super(kVersions.last.size);

  static GoogleSignInResult deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static GoogleSignInResult decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    GoogleSignInResult result = new GoogleSignInResult();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if (mainDataHeader.version <= kVersions.last.version) {
      // Scan in reverse order to optimize for more recent versions.
      for (int i = kVersions.length - 1; i >= 0; --i) {
        if (mainDataHeader.version >= kVersions[i].version) {
          if (mainDataHeader.size == kVersions[i].size) {
            // Found a match.
            break;
          }
          throw new bindings.MojoCodecError(
              'Header size doesn\'t correspond to known version size.');
        }
      }
    } else if (mainDataHeader.size < kVersions.last.size) {
      throw new bindings.MojoCodecError(
        'Message newer than the last known version cannot be shorter than '
        'required by the last known version.');
    }
    if (mainDataHeader.version >= 0) {
      
      var decoder1 = decoder0.decodePointer(8, true);
      result.user = GoogleSignInUser.decode(decoder1);
    }
    if (mainDataHeader.version >= 0) {
      
      result.isSuccess = decoder0.decodeBool(16, 0);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    try {
      encoder0.encodeStruct(user, 8, true);
    } on bindings.MojoCodecError catch(e) {
      e.message = "Error encountered while encoding field "
          "user of struct GoogleSignInResult: $e";
      rethrow;
    }
    try {
      encoder0.encodeBool(isSuccess, 16, 0);
    } on bindings.MojoCodecError catch(e) {
      e.message = "Error encountered while encoding field "
          "isSuccess of struct GoogleSignInResult: $e";
      rethrow;
    }
  }

  String toString() {
    return "GoogleSignInResult("
           "user: $user" ", "
           "isSuccess: $isSuccess" ")";
  }

  Map toJson() {
    Map map = new Map();
    map["user"] = user;
    map["isSuccess"] = isSuccess;
    return map;
  }
}


class _GoogleSignInListenerOnSignInParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  GoogleSignInResult result = null;

  _GoogleSignInListenerOnSignInParams() : super(kVersions.last.size);

  static _GoogleSignInListenerOnSignInParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static _GoogleSignInListenerOnSignInParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    _GoogleSignInListenerOnSignInParams result = new _GoogleSignInListenerOnSignInParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if (mainDataHeader.version <= kVersions.last.version) {
      // Scan in reverse order to optimize for more recent versions.
      for (int i = kVersions.length - 1; i >= 0; --i) {
        if (mainDataHeader.version >= kVersions[i].version) {
          if (mainDataHeader.size == kVersions[i].size) {
            // Found a match.
            break;
          }
          throw new bindings.MojoCodecError(
              'Header size doesn\'t correspond to known version size.');
        }
      }
    } else if (mainDataHeader.size < kVersions.last.size) {
      throw new bindings.MojoCodecError(
        'Message newer than the last known version cannot be shorter than '
        'required by the last known version.');
    }
    if (mainDataHeader.version >= 0) {
      
      var decoder1 = decoder0.decodePointer(8, false);
      result.result = GoogleSignInResult.decode(decoder1);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    try {
      encoder0.encodeStruct(result, 8, false);
    } on bindings.MojoCodecError catch(e) {
      e.message = "Error encountered while encoding field "
          "result of struct _GoogleSignInListenerOnSignInParams: $e";
      rethrow;
    }
  }

  String toString() {
    return "_GoogleSignInListenerOnSignInParams("
           "result: $result" ")";
  }

  Map toJson() {
    Map map = new Map();
    map["result"] = result;
    return map;
  }
}


class _GoogleSignInListenerOnDisconnectedParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  GoogleSignInResult result = null;

  _GoogleSignInListenerOnDisconnectedParams() : super(kVersions.last.size);

  static _GoogleSignInListenerOnDisconnectedParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static _GoogleSignInListenerOnDisconnectedParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    _GoogleSignInListenerOnDisconnectedParams result = new _GoogleSignInListenerOnDisconnectedParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if (mainDataHeader.version <= kVersions.last.version) {
      // Scan in reverse order to optimize for more recent versions.
      for (int i = kVersions.length - 1; i >= 0; --i) {
        if (mainDataHeader.version >= kVersions[i].version) {
          if (mainDataHeader.size == kVersions[i].size) {
            // Found a match.
            break;
          }
          throw new bindings.MojoCodecError(
              'Header size doesn\'t correspond to known version size.');
        }
      }
    } else if (mainDataHeader.size < kVersions.last.size) {
      throw new bindings.MojoCodecError(
        'Message newer than the last known version cannot be shorter than '
        'required by the last known version.');
    }
    if (mainDataHeader.version >= 0) {
      
      var decoder1 = decoder0.decodePointer(8, false);
      result.result = GoogleSignInResult.decode(decoder1);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    try {
      encoder0.encodeStruct(result, 8, false);
    } on bindings.MojoCodecError catch(e) {
      e.message = "Error encountered while encoding field "
          "result of struct _GoogleSignInListenerOnDisconnectedParams: $e";
      rethrow;
    }
  }

  String toString() {
    return "_GoogleSignInListenerOnDisconnectedParams("
           "result: $result" ")";
  }

  Map toJson() {
    Map map = new Map();
    map["result"] = result;
    return map;
  }
}


class _GoogleSignInInitParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(24, 0)
  ];
  String clientId = null;
  Object listener = null;

  _GoogleSignInInitParams() : super(kVersions.last.size);

  static _GoogleSignInInitParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static _GoogleSignInInitParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    _GoogleSignInInitParams result = new _GoogleSignInInitParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if (mainDataHeader.version <= kVersions.last.version) {
      // Scan in reverse order to optimize for more recent versions.
      for (int i = kVersions.length - 1; i >= 0; --i) {
        if (mainDataHeader.version >= kVersions[i].version) {
          if (mainDataHeader.size == kVersions[i].size) {
            // Found a match.
            break;
          }
          throw new bindings.MojoCodecError(
              'Header size doesn\'t correspond to known version size.');
        }
      }
    } else if (mainDataHeader.size < kVersions.last.size) {
      throw new bindings.MojoCodecError(
        'Message newer than the last known version cannot be shorter than '
        'required by the last known version.');
    }
    if (mainDataHeader.version >= 0) {
      
      result.clientId = decoder0.decodeString(8, false);
    }
    if (mainDataHeader.version >= 0) {
      
      result.listener = decoder0.decodeServiceInterface(16, false, GoogleSignInListenerProxy.newFromEndpoint);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    try {
      encoder0.encodeString(clientId, 8, false);
    } on bindings.MojoCodecError catch(e) {
      e.message = "Error encountered while encoding field "
          "clientId of struct _GoogleSignInInitParams: $e";
      rethrow;
    }
    try {
      encoder0.encodeInterface(listener, 16, false);
    } on bindings.MojoCodecError catch(e) {
      e.message = "Error encountered while encoding field "
          "listener of struct _GoogleSignInInitParams: $e";
      rethrow;
    }
  }

  String toString() {
    return "_GoogleSignInInitParams("
           "clientId: $clientId" ", "
           "listener: $listener" ")";
  }

  Map toJson() {
    throw new bindings.MojoCodecError(
        'Object containing handles cannot be encoded to JSON.');
  }
}


class _GoogleSignInSignInSilentlyParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(8, 0)
  ];

  _GoogleSignInSignInSilentlyParams() : super(kVersions.last.size);

  static _GoogleSignInSignInSilentlyParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static _GoogleSignInSignInSilentlyParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    _GoogleSignInSignInSilentlyParams result = new _GoogleSignInSignInSilentlyParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if (mainDataHeader.version <= kVersions.last.version) {
      // Scan in reverse order to optimize for more recent versions.
      for (int i = kVersions.length - 1; i >= 0; --i) {
        if (mainDataHeader.version >= kVersions[i].version) {
          if (mainDataHeader.size == kVersions[i].size) {
            // Found a match.
            break;
          }
          throw new bindings.MojoCodecError(
              'Header size doesn\'t correspond to known version size.');
        }
      }
    } else if (mainDataHeader.size < kVersions.last.size) {
      throw new bindings.MojoCodecError(
        'Message newer than the last known version cannot be shorter than '
        'required by the last known version.');
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    encoder.getStructEncoderAtOffset(kVersions.last);
  }

  String toString() {
    return "_GoogleSignInSignInSilentlyParams("")";
  }

  Map toJson() {
    Map map = new Map();
    return map;
  }
}


class _GoogleSignInSignInParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(8, 0)
  ];

  _GoogleSignInSignInParams() : super(kVersions.last.size);

  static _GoogleSignInSignInParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static _GoogleSignInSignInParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    _GoogleSignInSignInParams result = new _GoogleSignInSignInParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if (mainDataHeader.version <= kVersions.last.version) {
      // Scan in reverse order to optimize for more recent versions.
      for (int i = kVersions.length - 1; i >= 0; --i) {
        if (mainDataHeader.version >= kVersions[i].version) {
          if (mainDataHeader.size == kVersions[i].size) {
            // Found a match.
            break;
          }
          throw new bindings.MojoCodecError(
              'Header size doesn\'t correspond to known version size.');
        }
      }
    } else if (mainDataHeader.size < kVersions.last.size) {
      throw new bindings.MojoCodecError(
        'Message newer than the last known version cannot be shorter than '
        'required by the last known version.');
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    encoder.getStructEncoderAtOffset(kVersions.last);
  }

  String toString() {
    return "_GoogleSignInSignInParams("")";
  }

  Map toJson() {
    Map map = new Map();
    return map;
  }
}


class _GoogleSignInSignOutParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(8, 0)
  ];

  _GoogleSignInSignOutParams() : super(kVersions.last.size);

  static _GoogleSignInSignOutParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static _GoogleSignInSignOutParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    _GoogleSignInSignOutParams result = new _GoogleSignInSignOutParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if (mainDataHeader.version <= kVersions.last.version) {
      // Scan in reverse order to optimize for more recent versions.
      for (int i = kVersions.length - 1; i >= 0; --i) {
        if (mainDataHeader.version >= kVersions[i].version) {
          if (mainDataHeader.size == kVersions[i].size) {
            // Found a match.
            break;
          }
          throw new bindings.MojoCodecError(
              'Header size doesn\'t correspond to known version size.');
        }
      }
    } else if (mainDataHeader.size < kVersions.last.size) {
      throw new bindings.MojoCodecError(
        'Message newer than the last known version cannot be shorter than '
        'required by the last known version.');
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    encoder.getStructEncoderAtOffset(kVersions.last);
  }

  String toString() {
    return "_GoogleSignInSignOutParams("")";
  }

  Map toJson() {
    Map map = new Map();
    return map;
  }
}


class _GoogleSignInDisconnectParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(8, 0)
  ];

  _GoogleSignInDisconnectParams() : super(kVersions.last.size);

  static _GoogleSignInDisconnectParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static _GoogleSignInDisconnectParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    _GoogleSignInDisconnectParams result = new _GoogleSignInDisconnectParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if (mainDataHeader.version <= kVersions.last.version) {
      // Scan in reverse order to optimize for more recent versions.
      for (int i = kVersions.length - 1; i >= 0; --i) {
        if (mainDataHeader.version >= kVersions[i].version) {
          if (mainDataHeader.size == kVersions[i].size) {
            // Found a match.
            break;
          }
          throw new bindings.MojoCodecError(
              'Header size doesn\'t correspond to known version size.');
        }
      }
    } else if (mainDataHeader.size < kVersions.last.size) {
      throw new bindings.MojoCodecError(
        'Message newer than the last known version cannot be shorter than '
        'required by the last known version.');
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    encoder.getStructEncoderAtOffset(kVersions.last);
  }

  String toString() {
    return "_GoogleSignInDisconnectParams("")";
  }

  Map toJson() {
    Map map = new Map();
    return map;
  }
}


class _GoogleSignInSetScopesParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  List<String> scopes = null;

  _GoogleSignInSetScopesParams() : super(kVersions.last.size);

  static _GoogleSignInSetScopesParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static _GoogleSignInSetScopesParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    _GoogleSignInSetScopesParams result = new _GoogleSignInSetScopesParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if (mainDataHeader.version <= kVersions.last.version) {
      // Scan in reverse order to optimize for more recent versions.
      for (int i = kVersions.length - 1; i >= 0; --i) {
        if (mainDataHeader.version >= kVersions[i].version) {
          if (mainDataHeader.size == kVersions[i].size) {
            // Found a match.
            break;
          }
          throw new bindings.MojoCodecError(
              'Header size doesn\'t correspond to known version size.');
        }
      }
    } else if (mainDataHeader.size < kVersions.last.size) {
      throw new bindings.MojoCodecError(
        'Message newer than the last known version cannot be shorter than '
        'required by the last known version.');
    }
    if (mainDataHeader.version >= 0) {
      
      var decoder1 = decoder0.decodePointer(8, false);
      {
        var si1 = decoder1.decodeDataHeaderForPointerArray(bindings.kUnspecifiedArrayLength);
        result.scopes = new List<String>(si1.numElements);
        for (int i1 = 0; i1 < si1.numElements; ++i1) {
          
          result.scopes[i1] = decoder1.decodeString(bindings.ArrayDataHeader.kHeaderSize + bindings.kPointerSize * i1, false);
        }
      }
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    try {
      if (scopes == null) {
        encoder0.encodeNullPointer(8, false);
      } else {
        var encoder1 = encoder0.encodePointerArray(scopes.length, 8, bindings.kUnspecifiedArrayLength);
        for (int i0 = 0; i0 < scopes.length; ++i0) {
          encoder1.encodeString(scopes[i0], bindings.ArrayDataHeader.kHeaderSize + bindings.kPointerSize * i0, false);
        }
      }
    } on bindings.MojoCodecError catch(e) {
      e.message = "Error encountered while encoding field "
          "scopes of struct _GoogleSignInSetScopesParams: $e";
      rethrow;
    }
  }

  String toString() {
    return "_GoogleSignInSetScopesParams("
           "scopes: $scopes" ")";
  }

  Map toJson() {
    Map map = new Map();
    map["scopes"] = scopes;
    return map;
  }
}

const int _googleSignInListenerMethodOnSignInName = 0;
const int _googleSignInListenerMethodOnDisconnectedName = 1;

class _GoogleSignInListenerServiceDescription implements service_describer.ServiceDescription {
  dynamic getTopLevelInterface([Function responseFactory]) =>
      responseFactory(null);

  dynamic getTypeDefinition(String typeKey, [Function responseFactory]) =>
      responseFactory(null);

  dynamic getAllTypeDefinitions([Function responseFactory]) =>
      responseFactory(null);
}

abstract class GoogleSignInListener {
  static const String serviceName = null;
  void onSignIn(GoogleSignInResult result);
  void onDisconnected(GoogleSignInResult result);
}


class _GoogleSignInListenerProxyImpl extends bindings.Proxy {
  _GoogleSignInListenerProxyImpl.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) : super.fromEndpoint(endpoint);

  _GoogleSignInListenerProxyImpl.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  _GoogleSignInListenerProxyImpl.unbound() : super.unbound();

  static _GoogleSignInListenerProxyImpl newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) {
    assert(endpoint.setDescription("For _GoogleSignInListenerProxyImpl"));
    return new _GoogleSignInListenerProxyImpl.fromEndpoint(endpoint);
  }

  service_describer.ServiceDescription get serviceDescription =>
    new _GoogleSignInListenerServiceDescription();

  void handleResponse(bindings.ServiceMessage message) {
    switch (message.header.type) {
      default:
        proxyError("Unexpected message type: ${message.header.type}");
        close(immediate: true);
        break;
    }
  }

  String toString() {
    var superString = super.toString();
    return "_GoogleSignInListenerProxyImpl($superString)";
  }
}


class _GoogleSignInListenerProxyCalls implements GoogleSignInListener {
  _GoogleSignInListenerProxyImpl _proxyImpl;

  _GoogleSignInListenerProxyCalls(this._proxyImpl);
    void onSignIn(GoogleSignInResult result) {
      if (!_proxyImpl.isBound) {
        _proxyImpl.proxyError("The Proxy is closed.");
        return;
      }
      var params = new _GoogleSignInListenerOnSignInParams();
      params.result = result;
      _proxyImpl.sendMessage(params, _googleSignInListenerMethodOnSignInName);
    }
    void onDisconnected(GoogleSignInResult result) {
      if (!_proxyImpl.isBound) {
        _proxyImpl.proxyError("The Proxy is closed.");
        return;
      }
      var params = new _GoogleSignInListenerOnDisconnectedParams();
      params.result = result;
      _proxyImpl.sendMessage(params, _googleSignInListenerMethodOnDisconnectedName);
    }
}


class GoogleSignInListenerProxy implements bindings.ProxyBase {
  final bindings.Proxy impl;
  GoogleSignInListener ptr;

  GoogleSignInListenerProxy(_GoogleSignInListenerProxyImpl proxyImpl) :
      impl = proxyImpl,
      ptr = new _GoogleSignInListenerProxyCalls(proxyImpl);

  GoogleSignInListenerProxy.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) :
      impl = new _GoogleSignInListenerProxyImpl.fromEndpoint(endpoint) {
    ptr = new _GoogleSignInListenerProxyCalls(impl);
  }

  GoogleSignInListenerProxy.fromHandle(core.MojoHandle handle) :
      impl = new _GoogleSignInListenerProxyImpl.fromHandle(handle) {
    ptr = new _GoogleSignInListenerProxyCalls(impl);
  }

  GoogleSignInListenerProxy.unbound() :
      impl = new _GoogleSignInListenerProxyImpl.unbound() {
    ptr = new _GoogleSignInListenerProxyCalls(impl);
  }

  factory GoogleSignInListenerProxy.connectToService(
      bindings.ServiceConnector s, String url, [String serviceName]) {
    GoogleSignInListenerProxy p = new GoogleSignInListenerProxy.unbound();
    s.connectToService(url, p, serviceName);
    return p;
  }

  static GoogleSignInListenerProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) {
    assert(endpoint.setDescription("For GoogleSignInListenerProxy"));
    return new GoogleSignInListenerProxy.fromEndpoint(endpoint);
  }

  String get serviceName => GoogleSignInListener.serviceName;

  Future close({bool immediate: false}) => impl.close(immediate: immediate);

  Future responseOrError(Future f) => impl.responseOrError(f);

  Future get errorFuture => impl.errorFuture;

  int get version => impl.version;

  Future<int> queryVersion() => impl.queryVersion();

  void requireVersion(int requiredVersion) {
    impl.requireVersion(requiredVersion);
  }

  String toString() {
    return "GoogleSignInListenerProxy($impl)";
  }
}


class GoogleSignInListenerStub extends bindings.Stub {
  GoogleSignInListener _impl;

  GoogleSignInListenerStub.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint, [GoogleSignInListener impl])
      : super.fromEndpoint(endpoint, autoBegin: impl != null) {
    _impl = impl;
  }

  GoogleSignInListenerStub.fromHandle(
      core.MojoHandle handle, [GoogleSignInListener impl])
      : super.fromHandle(handle, autoBegin: impl != null) {
    _impl = impl;
  }

  GoogleSignInListenerStub.unbound() : super.unbound();

  static GoogleSignInListenerStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) {
    assert(endpoint.setDescription("For GoogleSignInListenerStub"));
    return new GoogleSignInListenerStub.fromEndpoint(endpoint);
  }



  dynamic handleMessage(bindings.ServiceMessage message) {
    if (bindings.ControlMessageHandler.isControlMessage(message)) {
      return bindings.ControlMessageHandler.handleMessage(this,
                                                          0,
                                                          message);
    }
    if (_impl == null) {
      throw new core.MojoApiError("$this has no implementation set");
    }
    switch (message.header.type) {
      case _googleSignInListenerMethodOnSignInName:
        var params = _GoogleSignInListenerOnSignInParams.deserialize(
            message.payload);
        _impl.onSignIn(params.result);
        break;
      case _googleSignInListenerMethodOnDisconnectedName:
        var params = _GoogleSignInListenerOnDisconnectedParams.deserialize(
            message.payload);
        _impl.onDisconnected(params.result);
        break;
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
    return null;
  }

  GoogleSignInListener get impl => _impl;
  set impl(GoogleSignInListener d) {
    if (d == null) {
      throw new core.MojoApiError("$this: Cannot set a null implementation");
    }
    if (isBound && (_impl == null)) {
      beginHandlingEvents();
    }
    _impl = d;
  }

  @override
  void bind(core.MojoMessagePipeEndpoint endpoint) {
    super.bind(endpoint);
    if (!isOpen && (_impl != null)) {
      beginHandlingEvents();
    }
  }

  String toString() {
    var superString = super.toString();
    return "GoogleSignInListenerStub($superString)";
  }

  int get version => 0;

  static service_describer.ServiceDescription _cachedServiceDescription;
  static service_describer.ServiceDescription get serviceDescription {
    if (_cachedServiceDescription == null) {
      _cachedServiceDescription = new _GoogleSignInListenerServiceDescription();
    }
    return _cachedServiceDescription;
  }
}

const int _googleSignInMethodInitName = 0;
const int _googleSignInMethodSignInSilentlyName = 1;
const int _googleSignInMethodSignInName = 2;
const int _googleSignInMethodSignOutName = 3;
const int _googleSignInMethodDisconnectName = 4;
const int _googleSignInMethodSetScopesName = 5;

class _GoogleSignInServiceDescription implements service_describer.ServiceDescription {
  dynamic getTopLevelInterface([Function responseFactory]) =>
      responseFactory(null);

  dynamic getTypeDefinition(String typeKey, [Function responseFactory]) =>
      responseFactory(null);

  dynamic getAllTypeDefinitions([Function responseFactory]) =>
      responseFactory(null);
}

abstract class GoogleSignIn {
  static const String serviceName = "google::GoogleSignIn";
  void init(String clientId, Object listener);
  void signInSilently();
  void signIn();
  void signOut();
  void disconnect();
  void setScopes(List<String> scopes);
}


class _GoogleSignInProxyImpl extends bindings.Proxy {
  _GoogleSignInProxyImpl.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) : super.fromEndpoint(endpoint);

  _GoogleSignInProxyImpl.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  _GoogleSignInProxyImpl.unbound() : super.unbound();

  static _GoogleSignInProxyImpl newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) {
    assert(endpoint.setDescription("For _GoogleSignInProxyImpl"));
    return new _GoogleSignInProxyImpl.fromEndpoint(endpoint);
  }

  service_describer.ServiceDescription get serviceDescription =>
    new _GoogleSignInServiceDescription();

  void handleResponse(bindings.ServiceMessage message) {
    switch (message.header.type) {
      default:
        proxyError("Unexpected message type: ${message.header.type}");
        close(immediate: true);
        break;
    }
  }

  String toString() {
    var superString = super.toString();
    return "_GoogleSignInProxyImpl($superString)";
  }
}


class _GoogleSignInProxyCalls implements GoogleSignIn {
  _GoogleSignInProxyImpl _proxyImpl;

  _GoogleSignInProxyCalls(this._proxyImpl);
    void init(String clientId, Object listener) {
      if (!_proxyImpl.isBound) {
        _proxyImpl.proxyError("The Proxy is closed.");
        return;
      }
      var params = new _GoogleSignInInitParams();
      params.clientId = clientId;
      params.listener = listener;
      _proxyImpl.sendMessage(params, _googleSignInMethodInitName);
    }
    void signInSilently() {
      if (!_proxyImpl.isBound) {
        _proxyImpl.proxyError("The Proxy is closed.");
        return;
      }
      var params = new _GoogleSignInSignInSilentlyParams();
      _proxyImpl.sendMessage(params, _googleSignInMethodSignInSilentlyName);
    }
    void signIn() {
      if (!_proxyImpl.isBound) {
        _proxyImpl.proxyError("The Proxy is closed.");
        return;
      }
      var params = new _GoogleSignInSignInParams();
      _proxyImpl.sendMessage(params, _googleSignInMethodSignInName);
    }
    void signOut() {
      if (!_proxyImpl.isBound) {
        _proxyImpl.proxyError("The Proxy is closed.");
        return;
      }
      var params = new _GoogleSignInSignOutParams();
      _proxyImpl.sendMessage(params, _googleSignInMethodSignOutName);
    }
    void disconnect() {
      if (!_proxyImpl.isBound) {
        _proxyImpl.proxyError("The Proxy is closed.");
        return;
      }
      var params = new _GoogleSignInDisconnectParams();
      _proxyImpl.sendMessage(params, _googleSignInMethodDisconnectName);
    }
    void setScopes(List<String> scopes) {
      if (!_proxyImpl.isBound) {
        _proxyImpl.proxyError("The Proxy is closed.");
        return;
      }
      var params = new _GoogleSignInSetScopesParams();
      params.scopes = scopes;
      _proxyImpl.sendMessage(params, _googleSignInMethodSetScopesName);
    }
}


class GoogleSignInProxy implements bindings.ProxyBase {
  final bindings.Proxy impl;
  GoogleSignIn ptr;

  GoogleSignInProxy(_GoogleSignInProxyImpl proxyImpl) :
      impl = proxyImpl,
      ptr = new _GoogleSignInProxyCalls(proxyImpl);

  GoogleSignInProxy.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) :
      impl = new _GoogleSignInProxyImpl.fromEndpoint(endpoint) {
    ptr = new _GoogleSignInProxyCalls(impl);
  }

  GoogleSignInProxy.fromHandle(core.MojoHandle handle) :
      impl = new _GoogleSignInProxyImpl.fromHandle(handle) {
    ptr = new _GoogleSignInProxyCalls(impl);
  }

  GoogleSignInProxy.unbound() :
      impl = new _GoogleSignInProxyImpl.unbound() {
    ptr = new _GoogleSignInProxyCalls(impl);
  }

  factory GoogleSignInProxy.connectToService(
      bindings.ServiceConnector s, String url, [String serviceName]) {
    GoogleSignInProxy p = new GoogleSignInProxy.unbound();
    s.connectToService(url, p, serviceName);
    return p;
  }

  static GoogleSignInProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) {
    assert(endpoint.setDescription("For GoogleSignInProxy"));
    return new GoogleSignInProxy.fromEndpoint(endpoint);
  }

  String get serviceName => GoogleSignIn.serviceName;

  Future close({bool immediate: false}) => impl.close(immediate: immediate);

  Future responseOrError(Future f) => impl.responseOrError(f);

  Future get errorFuture => impl.errorFuture;

  int get version => impl.version;

  Future<int> queryVersion() => impl.queryVersion();

  void requireVersion(int requiredVersion) {
    impl.requireVersion(requiredVersion);
  }

  String toString() {
    return "GoogleSignInProxy($impl)";
  }
}


class GoogleSignInStub extends bindings.Stub {
  GoogleSignIn _impl;

  GoogleSignInStub.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint, [GoogleSignIn impl])
      : super.fromEndpoint(endpoint, autoBegin: impl != null) {
    _impl = impl;
  }

  GoogleSignInStub.fromHandle(
      core.MojoHandle handle, [GoogleSignIn impl])
      : super.fromHandle(handle, autoBegin: impl != null) {
    _impl = impl;
  }

  GoogleSignInStub.unbound() : super.unbound();

  static GoogleSignInStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) {
    assert(endpoint.setDescription("For GoogleSignInStub"));
    return new GoogleSignInStub.fromEndpoint(endpoint);
  }



  dynamic handleMessage(bindings.ServiceMessage message) {
    if (bindings.ControlMessageHandler.isControlMessage(message)) {
      return bindings.ControlMessageHandler.handleMessage(this,
                                                          0,
                                                          message);
    }
    if (_impl == null) {
      throw new core.MojoApiError("$this has no implementation set");
    }
    switch (message.header.type) {
      case _googleSignInMethodInitName:
        var params = _GoogleSignInInitParams.deserialize(
            message.payload);
        _impl.init(params.clientId, params.listener);
        break;
      case _googleSignInMethodSignInSilentlyName:
        _impl.signInSilently();
        break;
      case _googleSignInMethodSignInName:
        _impl.signIn();
        break;
      case _googleSignInMethodSignOutName:
        _impl.signOut();
        break;
      case _googleSignInMethodDisconnectName:
        _impl.disconnect();
        break;
      case _googleSignInMethodSetScopesName:
        var params = _GoogleSignInSetScopesParams.deserialize(
            message.payload);
        _impl.setScopes(params.scopes);
        break;
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
    return null;
  }

  GoogleSignIn get impl => _impl;
  set impl(GoogleSignIn d) {
    if (d == null) {
      throw new core.MojoApiError("$this: Cannot set a null implementation");
    }
    if (isBound && (_impl == null)) {
      beginHandlingEvents();
    }
    _impl = d;
  }

  @override
  void bind(core.MojoMessagePipeEndpoint endpoint) {
    super.bind(endpoint);
    if (!isOpen && (_impl != null)) {
      beginHandlingEvents();
    }
  }

  String toString() {
    var superString = super.toString();
    return "GoogleSignInStub($superString)";
  }

  int get version => 0;

  static service_describer.ServiceDescription _cachedServiceDescription;
  static service_describer.ServiceDescription get serviceDescription {
    if (_cachedServiceDescription == null) {
      _cachedServiceDescription = new _GoogleSignInServiceDescription();
    }
    return _cachedServiceDescription;
  }
}



