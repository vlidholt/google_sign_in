// Copyright 2015 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#include "google_sign_in_impl.h"

#import <GoogleSignIn.h>

// TODO(jackson): Allow configuring the image dimensions.
// 256px is probably more than needed for most devices (64dp @ 320dpi = 128px)
static const int kProfileImageURLDimension = 256;

::google::GoogleSignInUserPtr toMojoUser(GIDGoogleUser *user) {
  ::google::GoogleSignInUserPtr mojoUser(::google::GoogleSignInUser::New());
  mojoUser->displayName = user.profile.name.UTF8String;
  mojoUser->email = user.profile.email.UTF8String;
  if (user.profile.hasImage) {
    NSURL *url = [user.profile imageURLWithDimension:kProfileImageURLDimension];
    mojoUser->photoUrl = [url absoluteString].UTF8String;
  }
  mojoUser->id = user.userID.UTF8String;
  mojoUser->idToken = user.authentication.idToken.UTF8String;
  mojoUser->accessToken = user.authentication.accessToken.UTF8String;
  return mojoUser;
}

::google::GoogleSignInResultPtr toMojoSignInResult(
  GIDSignIn *signIn,
  GIDGoogleUser *user,
  NSError *error) {
  ::google::GoogleSignInResultPtr mojoSignInResult(::google::GoogleSignInResult::New());
  if (user != nil)
    mojoSignInResult->user = toMojoUser(user);
  mojoSignInResult->isSuccess = (error == nil);
  return mojoSignInResult.Pass();
}

@interface GoogleSignInDelegate : NSObject<GIDSignInDelegate, GIDSignInUIDelegate>
@end

@implementation GoogleSignInDelegate {
  mojo::InterfacePtr<::google::GoogleSignInListener> _listener;
}

- (id)initWithListener:(mojo::InterfacePtr<::google::GoogleSignInListener>)listener {
  if (self = [super init]) {
    _listener = listener.Pass();
    id delegate = [UIApplication sharedApplication].delegate;
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(openURL:)
                                                 name:@"openURL"
                                               object:delegate];
  }
  return self;
}

- (void)signIn:(GIDSignIn *)signIn didSignInForUser:(GIDGoogleUser *)user withError:(NSError *)error {
  _listener->OnSignIn(toMojoSignInResult(signIn, user, error));
}

- (void)signIn:(GIDSignIn *)signIn didDisconnectWithUser:(GIDGoogleUser *)user withError:(NSError *)error {
  _listener->OnDisconnected(toMojoSignInResult(signIn, user, error));
}

- (void)openURL:(NSNotification *)notification
{
  NSDictionary *userInfo = notification.userInfo;
  NSURL *url = userInfo[@"url"];
  NSString *sourceApplication = userInfo[@"sourceApplication"];
  id annotation = userInfo[@"annotation"];
  if ([[GIDSignIn sharedInstance] handleURL:url
                          sourceApplication:sourceApplication
                                 annotation:annotation])
    userInfo[@"handled"][@"value"] = [NSNumber numberWithBool:YES];
}

- (void) dealloc {
  [[NSNotificationCenter defaultCenter] removeObserver:self];
  [super dealloc];
}
@end

namespace google {

GoogleSignInImpl::GoogleSignInImpl(mojo::InterfaceRequest<::google::GoogleSignIn> request)
    : binding_(this, request.Pass()) {
}

GoogleSignInImpl::~GoogleSignInImpl() {
}

// TODO(jackson): This service is designed to be a singleton, which is why
// it doesn't know how to clean up after itself. We may want to enforce this.
void GoogleSignInImpl::Init(const mojo::String& clientID,
                            mojo::InterfaceHandle<::google::GoogleSignInListener> listener) {
  GIDSignIn *gid = [GIDSignIn sharedInstance];
  gid.clientID = @(clientID.data());
  mojo::InterfacePtr<::google::GoogleSignInListener> ptr =
    mojo::InterfacePtr<::google::GoogleSignInListener>::Create(listener.Pass());
  GoogleSignInDelegate *delegate =
    [[GoogleSignInDelegate alloc] initWithListener:ptr.Pass()];
  gid.delegate = delegate;
  gid.uiDelegate = (id)[UIApplication sharedApplication].delegate.window.rootViewController;
}

void GoogleSignInImpl::SignInSilently() {
  [[GIDSignIn sharedInstance] signInSilently];
}

void GoogleSignInImpl::SignIn() {
  [[GIDSignIn sharedInstance] signIn];
}

void GoogleSignInImpl::SignOut() {
  [[GIDSignIn sharedInstance] signOut];
}

void GoogleSignInImpl::Disconnect() {
  [[GIDSignIn sharedInstance] disconnect];
}

void GoogleSignInImpl::SetScopes(mojo::Array<mojo::String> mojoScopes) {
  NSMutableArray *scopes = [NSMutableArray array];
  for (size_t i = 0; i < mojoScopes.size(); i++)
    [scopes addObject:@(mojoScopes[i].data())];
  [GIDSignIn sharedInstance].scopes = scopes;
}

}  // namespace google

void FlutterServicePerform(mojo::ScopedMessagePipeHandle client_handle,
                           const mojo::String& service_name) {
  if (service_name == google::GoogleSignIn::Name_) {
    new google::GoogleSignInImpl(
        mojo::MakeRequest<google::GoogleSignIn>(client_handle.Pass()));
    return;
  }
}
