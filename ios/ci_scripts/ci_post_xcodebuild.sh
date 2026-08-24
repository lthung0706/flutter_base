#!/bin/sh

set -e

echo "--- ci_post_xcodebuild.sh ---"

if [ "$CI_XCODEBUILD_EXIT_CODE" -ne 0 ]; then
  echo "Build failed, skipping"
  exit 0
fi

PODS_ROOT="${CI_PRIMARY_REPOSITORY_PATH}/ios/Pods"
UPLOAD_SYMBOLS_BIN="$PODS_ROOT/FirebaseCrashlytics/upload-symbols"
GOOGLE_SERVICE_INFO="${CI_PRIMARY_REPOSITORY_PATH}/ios/Runner/GoogleService-Info.plist"

if [ ! -f "$UPLOAD_SYMBOLS_BIN" ]; then
  echo "upload-symbols binary not found, skipping"
  exit 0
fi

find "$CI_ARCHIVE_PATH" -name "*.dSYM" | while read dsym; do
  echo "Uploading: $dsym"
  "$UPLOAD_SYMBOLS_BIN" -gsp "$GOOGLE_SERVICE_INFO" -p ios "$dsym"
done

echo "--- Done ---"