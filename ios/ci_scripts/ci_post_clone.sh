#!/bin/sh
set -e
set -x

cd "$CI_PRIMARY_REPOSITORY_PATH"

git clone https://github.com/flutter/flutter.git --depth 1 -b stable "$HOME/flutter"

export PATH="$PATH:$HOME/flutter/bin"
export FLUTTER_XCODE_USE_CORE_DEVICE=true

flutter doctor -v

flutter config --no-enable-swift-package-manager

flutter clean

rm -f .flutter-plugins
rm -f .flutter-plugins-dependencies

flutter pub get

flutter precache --ios

HOMEBREW_NO_AUTO_UPDATE=1 brew install cocoapods

cd ios

rm -rf Pods
rm -rf Podfile.lock
rm -rf .symlinks

# pod install with retry: Xcode Cloud occasionally hits transient
# "Connection reset by peer - SSL_connect" errors against
# cdn.cocoapods.org during dependency resolution. Retrying a few
# times with a short backoff clears it without failing the build.
# (Dropped the earlier `pod repo update` step too — it forces a full
# CDN metadata pull right before install and was the likely trigger
# for the SSL reset; `pod install` alone resolves fine against the
# CDN trunk source without it.)
for i in 1 2 3; do
  pod install --verbose && break
  echo "pod install failed (attempt $i/3), retrying in 10s..."
  sleep 10
done