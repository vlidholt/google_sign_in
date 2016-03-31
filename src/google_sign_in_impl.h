// Copyright 2015 Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#ifndef THIRDPARTY_GOOGLESIGNIN_SRC_GOOGLESIGNINIMPL_H_
#define THIRDPARTY_GOOGLESIGNIN_SRC_GOOGLESIGNINIMPL_H_

#include "base/macros.h"
#include "mojo/public/cpp/application/interface_factory.h"
#include "mojo/public/cpp/bindings/strong_binding.h"
#include "third_party/google_sign_in/mojom/google_sign_in.mojom.h"

#if __OBJC__
@class GoogleSignIn;
#else   // __OBJC__
class GoogleSignIn;
#endif  // __OBJC__

namespace sky {
namespace services {
namespace google {

class GoogleSignInImpl : public ::google::GoogleSignIn {
 public:
  explicit GoogleSignInImpl(mojo::InterfaceRequest<GoogleSignIn> request);
  ~GoogleSignInImpl() override;

  void Init(const mojo::String& clientID,
            mojo::InterfaceHandle<::google::GoogleSignInListener> listener) override;
  void SignInSilently() override;
  void SignIn() override;
  void SignOut() override;
  void Disconnect() override;
 private:
  mojo::StrongBinding<::google::GoogleSignIn> binding_;

  DISALLOW_COPY_AND_ASSIGN(GoogleSignInImpl);
};

class GoogleSignInFactory
    : public mojo::InterfaceFactory<::google::GoogleSignIn> {
 public:
  void Create(mojo::ApplicationConnection* connection,
              mojo::InterfaceRequest<::google::GoogleSignIn> request) override;
};

}  // namespace google
}  // namespace services
}  // namespace sky

#endif  // THIRDPARTY_GOOGLESIGNIN_SRC_GOOGLESIGNINIMPL_H_
