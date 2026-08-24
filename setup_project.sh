#!/bin/bash
# ==============================================================================
# Flutter Base Project Setup & Rebranding Script
# ==============================================================================
# Usage:
#   Interactive mode:
#     ./setup_project.sh
#
#   CLI Flags mode:
#     ./setup_project.sh \
#       --app-name "My App" \
#       --dart-name "my_app" \
#       --package-id "com.company.myapp" \
#       --base-url "https://api.myapp.com" \
#       --auth-base-url "https://api.myapp.com" \
#       --upload-url "https://upload.myapp.com" \
#       --firebase-project-id "my-app-firebase"
# ==============================================================================

set -e

BOLD="\033[1m"
GREEN="\033[0;32m"
BLUE="\033[0;34m"
YELLOW="\033[1;33m"
RED="\033[0;31m"
NC="\033[0m"

echo -e "${BOLD}${BLUE}======================================================${NC}"
echo -e "${BOLD}${BLUE}   🚀 FLUTTER BASE PROJECT CONFIGURATION & REBRANDING ${NC}"
echo -e "${BOLD}${BLUE}======================================================${NC}\n"

PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$PROJECT_ROOT"

# Ensure pub-cache bin is in PATH for flutterfire
export PATH="$PATH:$HOME/.pub-cache/bin"

OLD_DART_NAME=$(grep "^name:" pubspec.yaml | head -n 1 | awk '{print $2}' | tr -d '\r\n')
if [ -z "$OLD_DART_NAME" ]; then
    OLD_DART_NAME="sstrip"
fi

OLD_PACKAGE_ID=$(grep "namespace = " android/app/build.gradle.kts | head -n 1 | sed -E 's/.*namespace = "([^"]+)".*/\1/')
if [ -z "$OLD_PACKAGE_ID" ]; then
    OLD_PACKAGE_ID="com.lthung123.sstrip"
fi

APP_NAME=""
DART_NAME=""
PACKAGE_ID=""
BASE_URL=""
BASE_AUTH_URL=""
UPLOAD_URL=""
SUPABASE_URL=""
SUPABASE_ANON_KEY=""
SETUP_FIREBASE=""
FIREBASE_PROJECT_ID=""
CREATE_FIREBASE_PROJECT=false
GOOGLE_WEB_CLIENT_ID=""

while [[ "$#" -gt 0 ]]; do
    case $1 in
        --app-name) APP_NAME="$2"; shift ;;
        --dart-name) DART_NAME="$2"; shift ;;
        --package-id) PACKAGE_ID="$2"; shift ;;
        --base-url) BASE_URL="$2"; shift ;;
        --auth-base-url) BASE_AUTH_URL="$2"; shift ;;
        --upload-url) UPLOAD_URL="$2"; shift ;;
        --supabase-url) SUPABASE_URL="$2"; shift ;;
        --supabase-anon-key) SUPABASE_ANON_KEY="$2"; shift ;;
        --firebase-project-id) FIREBASE_PROJECT_ID="$2"; SETUP_FIREBASE="true"; shift ;;
        --create-firebase-project) CREATE_FIREBASE_PROJECT=true; SETUP_FIREBASE="true"; shift ;;
        --google-web-client-id) GOOGLE_WEB_CLIENT_ID="$2"; shift ;;
        --setup-firebase) SETUP_FIREBASE="true"; shift ;;
        --skip-firebase) SETUP_FIREBASE="false"; shift ;;
        -h|--help)
            echo "Usage: ./setup_project.sh [options]"
            echo "Options:"
            echo "  --app-name <name>               App display name (e.g., 'My Application')"
            echo "  --dart-name <name>              Dart package name (e.g., 'my_app')"
            echo "  --package-id <id>               Bundle/Application ID (e.g., 'com.example.myapp')"
            echo "  --base-url <url>                Backend API Base URL"
            echo "  --auth-base-url <url>           Backend Auth API Base URL"
            echo "  --upload-url <url>              Backend Upload API Base URL"
            echo "  --supabase-url <url>            Supabase Project URL (optional)"
            echo "  --supabase-anon-key <key>       Supabase Anon Key (optional)"
            echo "  --firebase-project-id <id>      Firebase Project ID to link"
            echo "  --create-firebase-project       Automatically create a new Firebase project"
            echo "  --google-web-client-id <id>     Google Web Client ID for Google Sign-In"
            echo "  --setup-firebase                Enable Firebase configuration step"
            echo "  --skip-firebase                 Skip Firebase configuration step"
            exit 0
            ;;
        *) echo "Unknown option: $1"; exit 1 ;;
    esac
    shift
done

if [ -z "$APP_NAME" ]; then
    read -p "$(echo -e "${YELLOW}👉 Enter App Display Name (e.g. My App): ${NC}")" APP_NAME
    if [ -z "$APP_NAME" ]; then
        APP_NAME="Flutter App"
    fi
fi

if [ -z "$DART_NAME" ]; then
    SUGGESTED_DART_NAME=$(echo "$APP_NAME" | tr '[:upper:]' '[:lower:]' | sed "s/[^a-z0-9]/_/g" | sed "s/__*/_/g" | sed "s/^_//;s/_$//")
    read -p "$(echo -e "${YELLOW}👉 Enter Dart Package Name [default: $SUGGESTED_DART_NAME]: ${NC}")" DART_NAME
    if [ -z "$DART_NAME" ]; then
        DART_NAME="$SUGGESTED_DART_NAME"
    fi
fi

if [ -z "$PACKAGE_ID" ]; then
    SUGGESTED_PKG="com.example.$(echo "$DART_NAME" | tr "_" "")"
    read -p "$(echo -e "${YELLOW}👉 Enter Package ID / Bundle ID [default: $SUGGESTED_PKG]: ${NC}")" PACKAGE_ID
    if [ -z "$PACKAGE_ID" ]; then
        PACKAGE_ID="$SUGGESTED_PKG"
    fi
fi

if [ -z "$BASE_URL" ]; then
    read -p "$(echo -e "${YELLOW}👉 Enter Backend API Base URL [default: https://api.example.com]: ${NC}")" BASE_URL
    if [ -z "$BASE_URL" ]; then
        BASE_URL="https://api.example.com"
    fi
fi

if [ -z "$BASE_AUTH_URL" ]; then
    read -p "$(echo -e "${YELLOW}👉 Enter Auth Base URL [default: $BASE_URL]: ${NC}")" BASE_AUTH_URL
    if [ -z "$BASE_AUTH_URL" ]; then
        BASE_AUTH_URL="$BASE_URL"
    fi
fi

if [ -z "$UPLOAD_URL" ]; then
    read -p "$(echo -e "${YELLOW}👉 Enter Upload Base URL [default: $BASE_URL]: ${NC}")" UPLOAD_URL
    if [ -z "$UPLOAD_URL" ]; then
        UPLOAD_URL="$BASE_URL"
    fi
fi

if [ -z "$SETUP_FIREBASE" ]; then
    echo -e "\n${BOLD}${BLUE}🔥 Firebase Setup Configuration:${NC}"
    echo "  1) Create a brand new Firebase project automatically (Recommended)"
    echo "  2) Connect to an existing Firebase project (by Project ID)"
    echo "  3) Run interactive flutterfire configure"
    echo "  4) Skip Firebase setup"
    read -p "$(echo -e "${YELLOW}👉 Choose an option [1-4, default: 1]: ${NC}")" FB_OPT
    FB_OPT=${FB_OPT:-1}
    case "$FB_OPT" in
        1)
            SETUP_FIREBASE="true"
            CREATE_FIREBASE_PROJECT=true
            SUGGESTED_FB_ID="$(echo "$DART_NAME" | tr '_' '-')-app"
            read -p "$(echo -e "${YELLOW}👉 Enter new Firebase Project ID [default: $SUGGESTED_FB_ID]: ${NC}")" CUSTOM_FB_ID
            FIREBASE_PROJECT_ID="${CUSTOM_FB_ID:-$SUGGESTED_FB_ID}"
            ;;
        2)
            SETUP_FIREBASE="true"
            read -p "$(echo -e "${YELLOW}👉 Enter existing Firebase Project ID: ${NC}")" FIREBASE_PROJECT_ID
            ;;
        3)
            SETUP_FIREBASE="true"
            FIREBASE_PROJECT_ID="interactive"
            ;;
        4)
            SETUP_FIREBASE="false"
            ;;
        *)
            SETUP_FIREBASE="true"
            CREATE_FIREBASE_PROJECT=true
            FIREBASE_PROJECT_ID="$(echo "$DART_NAME" | tr '_' '-')-app"
            ;;
    esac
    if [ "$SETUP_FIREBASE" = "true" ] && [ -z "$GOOGLE_WEB_CLIENT_ID" ]; then
        read -p "$(echo -e "${YELLOW}👉 Enter Google Web Client ID (optional, leave blank to auto-detect): ${NC}")" GOOGLE_WEB_CLIENT_ID
    fi
fi

echo -e "\n${BOLD}${BLUE}--- Review Configuration ---${NC}"
echo -e "📱 App Name:        ${GREEN}$APP_NAME${NC}"
echo -e "📦 Dart Package:    ${GREEN}$DART_NAME${NC} (Previous: $OLD_DART_NAME)"
echo -e "🆔 Package / ID:     ${GREEN}$PACKAGE_ID${NC} (Previous: $OLD_PACKAGE_ID)"
echo -e "🌐 API Base URL:    ${GREEN}$BASE_URL${NC}"
echo -e "🔐 Auth Base URL:   ${GREEN}$BASE_AUTH_URL${NC}"
echo -e "📤 Upload Base URL: ${GREEN}$UPLOAD_URL${NC}"
if [ -n "$GOOGLE_WEB_CLIENT_ID" ]; then
    echo -e "🔑 Web Client ID:   ${GREEN}$GOOGLE_WEB_CLIENT_ID${NC}"
fi
if [ "$SETUP_FIREBASE" = "true" ]; then
    if [ "$CREATE_FIREBASE_PROJECT" = true ]; then
        echo -e "🔥 Firebase:        ${GREEN}Create new project ($FIREBASE_PROJECT_ID)${NC}"
    elif [ "$FIREBASE_PROJECT_ID" = "interactive" ]; then
        echo -e "🔥 Firebase:        ${GREEN}Interactive configuration${NC}"
    else
        echo -e "🔥 Firebase:        ${GREEN}Link existing project ($FIREBASE_PROJECT_ID)${NC}"
    fi
else
    echo -e "🔥 Firebase:        ${YELLOW}Skipped${NC}"
fi
echo -e "----------------------------\n"

read -p "Proceed with configuration? (y/N): " CONFIRM
if [[ ! "$CONFIRM" =~ ^[Yy]$ ]]; then
    echo "Aborted by user."
    exit 0
fi

echo -e "\n${BOLD}🔄 Step 1: Updating pubspec.yaml...${NC}"
sed -i "" "s/^name: .*/name: $DART_NAME/" pubspec.yaml
sed -i "" "s/^description: .*/description: \"$APP_NAME base application\"/" pubspec.yaml
echo -e "${GREEN}✔ pubspec.yaml updated.${NC}"

echo -e "\n${BOLD}🔄 Step 2: Updating Dart imports (${OLD_DART_NAME} -> ${DART_NAME})...${NC}"
find lib test packages -name "*.dart" -type f | while read -r file; do
    if grep -q "package:$OLD_DART_NAME/" "$file"; then
        sed -i "" "s|package:$OLD_DART_NAME/|package:$DART_NAME/|g" "$file"
    fi
done

if [ -f "build.yaml" ]; then
    sed -i "" "s|$OLD_DART_NAME:|$DART_NAME:|g" build.yaml
fi
echo -e "${GREEN}✔ Dart imports updated to 'package:$DART_NAME/...\.${NC}"

echo -e "\n${BOLD}🔄 Step 3: Updating Android configuration...${NC}"
if [ -f "android/app/build.gradle.kts" ]; then
    sed -i "" "s/namespace = \".*\"/namespace = \"$PACKAGE_ID\"/g" android/app/build.gradle.kts
    sed -i "" "s/applicationId = \".*\"/applicationId = \"$PACKAGE_ID\"/g" android/app/build.gradle.kts
    sed -i "" "s/resValue(\"string\", \"app_name\", \".* - dev\")/resValue(\"string\", \"app_name\", \"$APP_NAME - dev\")/g" android/app/build.gradle.kts
    sed -i "" "s/resValue(\"string\", \"app_name\", \".*\")/resValue(\"string\", \"app_name\", \"$APP_NAME\")/g" android/app/build.gradle.kts
fi

if [ -f "android/settings.gradle.kts" ]; then
    if grep -q "rootProject.name = " android/settings.gradle.kts; then
        sed -i "" "s/rootProject.name = .*/rootProject.name = \"$DART_NAME\"/g" android/settings.gradle.kts
    else
        echo "rootProject.name = \"$DART_NAME\"" >> android/settings.gradle.kts
    fi
fi

if [ -f "android/app/src/main/AndroidManifest.xml" ]; then
    sed -i "" "s/android:label=\"[^\"]*\"/android:label=\"$APP_NAME\"/g" android/app/src/main/AndroidManifest.xml
fi

KOTLIN_BASE_DIR="android/app/src/main/kotlin"
OLD_KT_FILE=$(find "$KOTLIN_BASE_DIR" -name "MainActivity.kt" | head -n 1)
NEW_KT_DIR="$KOTLIN_BASE_DIR/$(echo "$PACKAGE_ID" | tr "." "/")"
mkdir -p "$NEW_KT_DIR"

cat <<EOF > "$NEW_KT_DIR/MainActivity.kt"
package $PACKAGE_ID

import io.flutter.embedding.android.FlutterActivity

class MainActivity : FlutterActivity()
EOF

if [ -n "$OLD_KT_FILE" ] && [ "$OLD_KT_FILE" != "$NEW_KT_DIR/MainActivity.kt" ]; then
    rm -f "$OLD_KT_FILE"
    find "$KOTLIN_BASE_DIR" -type d -empty -delete || true
fi
echo -e "${GREEN}✔ Android package & app names updated.${NC}"

echo -e "\n${BOLD}🔄 Step 4: Updating iOS, macOS, Linux & Windows configurations...${NC}"
if [ -f "ios/Runner.xcodeproj/project.pbxproj" ]; then
    sed -i "" "s/PRODUCT_BUNDLE_IDENTIFIER = [^;]*;/PRODUCT_BUNDLE_IDENTIFIER = $PACKAGE_ID;/g" ios/Runner.xcodeproj/project.pbxproj
    sed -i "" "s/PRODUCT_BUNDLE_IDENTIFIER = $PACKAGE_ID.RunnerTests;/PRODUCT_BUNDLE_IDENTIFIER = $PACKAGE_ID.RunnerTests;/g" ios/Runner.xcodeproj/project.pbxproj
fi

# iOS xcconfig files
find ios -name "*.xcconfig" -type f | while read -r xcfile; do
    sed -i "" "s|^PRODUCT_BUNDLE_IDENTIFIER=.*|PRODUCT_BUNDLE_IDENTIFIER=$PACKAGE_ID|g" "$xcfile"
    sed -i "" "s|^BUNDLE_NAME=.* - dev|BUNDLE_NAME=$APP_NAME - dev|g" "$xcfile"
    sed -i "" "s|^BUNDLE_NAME=.*|BUNDLE_NAME=$APP_NAME|g" "$xcfile"
done

if [ -f "ios/Runner/Info.plist" ]; then
    sed -i "" "s|<key>CFBundleDisplayName</key>[[:space:]]*<string>[^<]*</string>|<key>CFBundleDisplayName</key>\
	<string>\$(BUNDLE_NAME)</string>|g" ios/Runner/Info.plist
    sed -i "" "s|<key>CFBundleName</key>[[:space:]]*<string>[^<]*</string>|<key>CFBundleName</key>\
	<string>$DART_NAME</string>|g" ios/Runner/Info.plist
fi

# macOS
if [ -f "macos/Runner/Configs/AppInfo.xcconfig" ]; then
    sed -i "" "s/PRODUCT_NAME = .*/PRODUCT_NAME = $DART_NAME/g" macos/Runner/Configs/AppInfo.xcconfig
    sed -i "" "s/PRODUCT_BUNDLE_IDENTIFIER = .*/PRODUCT_BUNDLE_IDENTIFIER = $PACKAGE_ID/g" macos/Runner/Configs/AppInfo.xcconfig
fi

# Linux
if [ -f "linux/CMakeLists.txt" ]; then
    sed -i "" "s/set(BINARY_NAME \".*\")/set(BINARY_NAME \"$DART_NAME\")/g" linux/CMakeLists.txt
    sed -i "" "s/set(APPLICATION_ID \".*\")/set(APPLICATION_ID \"$PACKAGE_ID\")/g" linux/CMakeLists.txt
fi

if [ -f "linux/runner/my_application.cc" ]; then
    sed -i "" "s/gtk_header_bar_set_title(header_bar, \".*\")/gtk_header_bar_set_title(header_bar, \"$APP_NAME\")/g" linux/runner/my_application.cc
    sed -i "" "s/gtk_window_set_title(window, \".*\")/gtk_window_set_title(window, \"$APP_NAME\")/g" linux/runner/my_application.cc
fi

# Windows
if [ -f "windows/CMakeLists.txt" ]; then
    sed -i "" "s/project(.* LANGUAGES CXX)/project($DART_NAME LANGUAGES CXX)/g" windows/CMakeLists.txt
    sed -i "" "s/set(BINARY_NAME \".*\")/set(BINARY_NAME \"$DART_NAME\")/g" windows/CMakeLists.txt
fi

# Helper scripts
if [ -f "gen_file_by_construct.sh" ]; then
    sed -i "" "s/PROJECT_NAME=\".*\"/PROJECT_NAME=\"$DART_NAME\"/g" gen_file_by_construct.sh
fi
echo -e "${GREEN}✔ Platform configurations updated for iOS, macOS, Linux, Windows.${NC}"

echo -e "\n${BOLD}🔄 Step 5: Updating Environment (.env.dev & .env.prod)...${NC}"
DEV_ENV="packages/app_config/assets/dotenv/.env.dev"
PROD_ENV="packages/app_config/assets/dotenv/.env.prod"

if [ -f "$DEV_ENV" ]; then
    sed -i "" "s|^APP_NAME=.*|APP_NAME=\x27$APP_NAME - dev\x27|" "$DEV_ENV"
    sed -i "" "s|^BASE_URL=.*|BASE_URL=\x27$BASE_URL\x27|" "$DEV_ENV"
    sed -i "" "s|^BASE_AUTH_URL=.*|BASE_AUTH_URL=\x27$BASE_AUTH_URL\x27|" "$DEV_ENV"
    sed -i "" "s|^UPLOAD_URL=.*|UPLOAD_URL=\x27$UPLOAD_URL\x27|" "$DEV_ENV"
    if [ -n "$SUPABASE_URL" ]; then
        sed -i "" "s|^SUPABASE_URL=.*|SUPABASE_URL=\x27$SUPABASE_URL\x27|" "$DEV_ENV"
    fi
    if [ -n "$SUPABASE_ANON_KEY" ]; then
        sed -i "" "s|^SUPABASE_ANON_KEY=.*|SUPABASE_ANON_KEY=\x27$SUPABASE_ANON_KEY\x27|" "$DEV_ENV"
    fi
fi

if [ -f "$PROD_ENV" ]; then
    sed -i "" "s|^APP_NAME=.*|APP_NAME=\x27$APP_NAME\x27|" "$PROD_ENV"
    sed -i "" "s|^BASE_URL=.*|BASE_URL=\x27$BASE_URL\x27|" "$PROD_ENV"
    sed -i "" "s|^BASE_AUTH_URL=.*|BASE_AUTH_URL=\x27$BASE_AUTH_URL\x27|" "$PROD_ENV"
    sed -i "" "s|^UPLOAD_URL=.*|UPLOAD_URL=\x27$UPLOAD_URL\x27|" "$PROD_ENV"
    if [ -n "$SUPABASE_URL" ]; then
        sed -i "" "s|^SUPABASE_URL=.*|SUPABASE_URL=\x27$SUPABASE_URL\x27|" "$PROD_ENV"
    fi
    if [ -n "$SUPABASE_ANON_KEY" ]; then
        sed -i "" "s|^SUPABASE_ANON_KEY=.*|SUPABASE_ANON_KEY=\x27$SUPABASE_ANON_KEY\x27|" "$PROD_ENV"
    fi
fi
echo -e "${GREEN}✔ Environment dotenv files updated.${NC}"

echo -e "\n${BOLD}🔄 Step 6: Installing Dependencies & Generating Code...${NC}"
echo -e "🔹 Running flutter pub get..."
flutter pub get

echo -e "🔹 Generating localizations..."
(cd packages/app_intl && flutter gen-l10n)

echo -e "🔹 Generating assets code..."
./gen_asset_code.sh

echo -e "🔹 Running build_runner (injectable, retrofit, json_serializable, auto_mappr)..."
flutter pub run build_runner build --delete-conflicting-outputs

if [ "$SETUP_FIREBASE" = "true" ]; then
    echo -e "\n${BOLD}🔄 Step 7: Configuring Firebase (FlutterFire & Google Services)...${NC}"
    
    if ! command -v firebase &> /dev/null; then
        echo -e "${YELLOW}⚠️ 'firebase' CLI not found. Attempting to install via npm...${NC}"
        npm install -g firebase-tools || true
    fi

    if ! command -v flutterfire &> /dev/null; then
        echo -e "${YELLOW}⚠️ 'flutterfire' CLI not found. Activating flutterfire_cli...${NC}"
        dart pub global activate flutterfire_cli || true
    fi

    if ! firebase login:list 2>/dev/null | grep -q "@"; then
        echo -e "${YELLOW}🔑 Please log in to Firebase CLI:${NC}"
        firebase login
    fi

    if [ "$CREATE_FIREBASE_PROJECT" = true ] && [ -n "$FIREBASE_PROJECT_ID" ]; then
        echo -e "🔹 Creating Firebase project '$FIREBASE_PROJECT_ID'..."
        firebase projects:create "$FIREBASE_PROJECT_ID" --display-name "$APP_NAME" || true
        
        echo -e "🔹 Registering Android app ($PACKAGE_ID)..."
        firebase apps:create ANDROID "$APP_NAME Android" --package-name "$PACKAGE_ID" --project "$FIREBASE_PROJECT_ID" || true
        
        echo -e "🔹 Registering iOS app ($PACKAGE_ID)..."
        firebase apps:create IOS "$APP_NAME iOS" --bundle-id "$PACKAGE_ID" --project "$FIREBASE_PROJECT_ID" || true
    fi

    if [ "$FIREBASE_PROJECT_ID" = "interactive" ]; then
        echo -e "🔹 Running interactive flutterfire configure..."
        flutterfire configure
    elif [ -n "$FIREBASE_PROJECT_ID" ]; then
        echo -e "🔹 Configuring FlutterFire for project '$FIREBASE_PROJECT_ID'..."
        flutterfire configure \
            --project="$FIREBASE_PROJECT_ID" \
            --platforms=android,ios \
            --android-package-name="$PACKAGE_ID" \
            --ios-bundle-id="$PACKAGE_ID" \
            -y -f
    else
        echo -e "🔹 Running flutterfire configure..."
        flutterfire configure \
            --platforms=android,ios \
            --android-package-name="$PACKAGE_ID" \
            --ios-bundle-id="$PACKAGE_ID" \
            -y -f
    fi
    echo -e "${GREEN}✔ Firebase configured successfully.${NC}"

    echo -e "\n${BOLD}🔑 Step 7.1: Extracting Debug Keystore SHA Fingerprints & Registering with Firebase...${NC}"
    DEBUG_KEYSTORE="$HOME/.android/debug.keystore"
    if [ ! -f "$DEBUG_KEYSTORE" ]; then
        echo -e "🔹 Keystore not found at $DEBUG_KEYSTORE, generating a new debug keystore..."
        mkdir -p "$HOME/.android"
        keytool -genkey -v -keystore "$DEBUG_KEYSTORE" -storepass android -alias androiddebugkey -keypass android -keyalg RSA -keysize 2048 -validity 10000 -dname "CN=Android Debug,O=Android,C=US" >/dev/null 2>&1 || true
    fi

    DEBUG_SHA1=$(keytool -list -v -keystore "$DEBUG_KEYSTORE" -alias androiddebugkey -storepass android -keypass android 2>/dev/null | grep "SHA1:" | head -n 1 | awk '{print $2}')
    DEBUG_SHA256=$(keytool -list -v -keystore "$DEBUG_KEYSTORE" -alias androiddebugkey -storepass android -keypass android 2>/dev/null | grep "SHA256:" | head -n 1 | awk '{print $2}')

    echo -e "  📌 Debug SHA-1:   ${GREEN}${DEBUG_SHA1:-Not found}${NC}"
    echo -e "  📌 Debug SHA-256: ${GREEN}${DEBUG_SHA256:-Not found}${NC}"

    FB_PROJECT="$FIREBASE_PROJECT_ID"
    if [ -z "$FB_PROJECT" ] || [ "$FB_PROJECT" = "interactive" ]; then
        if [ -f "android/app/google-services.json" ]; then
            FB_PROJECT=$(grep '"project_id"' android/app/google-services.json 2>/dev/null | head -n 1 | sed -E 's/.*"project_id": "([^"]+)".*/\1/')
        fi
    fi

    ANDROID_APP_ID=""
    if [ -f "android/app/google-services.json" ]; then
        ANDROID_APP_ID=$(grep '"mobilesdk_app_id"' android/app/google-services.json 2>/dev/null | head -n 1 | sed -E 's/.*"mobilesdk_app_id": "([^"]+)".*/\1/')
    fi

    G_TOKEN=""
    if command -v gcloud &> /dev/null; then
        G_TOKEN=$(gcloud auth print-access-token 2>/dev/null || true)
    fi

    if [ -n "$G_TOKEN" ] && [ -n "$FB_PROJECT" ] && [ -n "$ANDROID_APP_ID" ] && [ -n "$DEBUG_SHA1" ]; then
        echo -e "🔹 Auto-registering SHA-1 & SHA-256 to Firebase project '$FB_PROJECT'..."
        SHA1_HEX=$(echo "$DEBUG_SHA1" | tr -d ':')
        SHA256_HEX=$(echo "$DEBUG_SHA256" | tr -d ':')
        
        curl -s -X POST \
          -H "Authorization: Bearer $G_TOKEN" \
          -H "X-Goog-User-Project: $FB_PROJECT" \
          -H "Content-Type: application/json" \
          -d "{\"shaHash\": \"$SHA1_HEX\", \"certType\": \"SHA_1\"}" \
          "https://firebase.googleapis.com/v1beta1/projects/$FB_PROJECT/androidApps/$ANDROID_APP_ID/sha" >/dev/null 2>&1 || true

        curl -s -X POST \
          -H "Authorization: Bearer $G_TOKEN" \
          -H "X-Goog-User-Project: $FB_PROJECT" \
          -H "Content-Type: application/json" \
          -d "{\"shaHash\": \"$SHA256_HEX\", \"certType\": \"SHA_256\"}" \
          "https://firebase.googleapis.com/v1beta1/projects/$FB_PROJECT/androidApps/$ANDROID_APP_ID/sha" >/dev/null 2>&1 || true

        echo -e "${GREEN}✔ SHA fingerprints registered to Firebase.${NC}"

        # Re-fetch latest google-services.json with new SHA config
        if command -v firebase &> /dev/null; then
            firebase apps:sdkconfig ANDROID "$ANDROID_APP_ID" --project="$FB_PROJECT" > android/app/google-services.json 2>/dev/null || true
        fi
    fi

    echo -e "\n${BOLD}🔐 Step 7.2: Extracting Google OAuth 2.0 Client IDs (GCP / Firebase)...${NC}"
    # Read Web Client ID and Android Client ID from google-services.json
    WEB_CLIENT_ID=$(python3 -c "
import json
try:
    with open('android/app/google-services.json') as f:
        data = json.load(f)
        for client in data.get('client', []):
            for oauth in client.get('oauth_client', []):
                if oauth.get('client_type') == 3:
                    print(oauth.get('client_id'))
                    exit(0)
            for other in client.get('services', {}).get('appinvite_service', {}).get('other_platform_oauth_client', []):
                if other.get('client_type') == 3:
                    print(other.get('client_id'))
                    exit(0)
except Exception:
    pass
" 2>/dev/null || true)

    ANDROID_CLIENT_ID=$(python3 -c "
import json
try:
    with open('android/app/google-services.json') as f:
        data = json.load(f)
        for client in data.get('client', []):
            for oauth in client.get('oauth_client', []):
                if oauth.get('client_type') == 1:
                    print(oauth.get('client_id'))
                    exit(0)
except Exception:
    pass
" 2>/dev/null || true)

    IOS_CLIENT_ID=$(python3 -c "
import plistlib
try:
    with open('ios/Runner/GoogleService-Info.plist', 'rb') as f:
        data = plistlib.load(f)
        print(data.get('CLIENT_ID', ''))
except Exception:
    pass
" 2>/dev/null || true)

    REVERSED_CLIENT_ID=$(python3 -c "
import plistlib
try:
    with open('ios/Runner/GoogleService-Info.plist', 'rb') as f:
        data = plistlib.load(f)
        print(data.get('REVERSED_CLIENT_ID', ''))
except Exception:
    pass
" 2>/dev/null || true)

    if [ -n "$GOOGLE_WEB_CLIENT_ID" ]; then
        WEB_CLIENT_ID="$GOOGLE_WEB_CLIENT_ID"
    fi

    # Update login_page.dart if WEB_CLIENT_ID is found
    if [ -n "$WEB_CLIENT_ID" ] && [ -f "lib/src/authentication/view/login_page.dart" ]; then
        sed -i "" -E "s/serverClientId:[[:space:]]*'[^']*'/serverClientId: '$WEB_CLIENT_ID'/g" lib/src/authentication/view/login_page.dart
        echo -e "${GREEN}✔ Updated serverClientId in login_page.dart -> $WEB_CLIENT_ID${NC}"
    fi

    # Update iOS Info.plist with iOS Client ID & URL Scheme
    if [ -n "$IOS_CLIENT_ID" ] && [ -f "ios/Runner/Info.plist" ]; then
        if grep -q "<key>GIDClientID</key>" ios/Runner/Info.plist; then
            sed -i "" -E "s|<key>GIDClientID</key>[[:space:]]*<string>[^<]*</string>|<key>GIDClientID</key>\
	<string>$IOS_CLIENT_ID</string>|g" ios/Runner/Info.plist
        fi
    fi

    if [ -n "$REVERSED_CLIENT_ID" ] && [ -f "ios/Runner/Info.plist" ]; then
        if grep -q "com.googleusercontent.apps." ios/Runner/Info.plist; then
            sed -i "" -E "s|<string>com\.googleusercontent\.apps\.[^<]*</string>|<string>$REVERSED_CLIENT_ID</string>|g" ios/Runner/Info.plist
        fi
    fi

    echo -e "\n${BOLD}${BLUE}╔══════════════════════════════════════════════════════════════════════════════╗${NC}"
    echo -e "${BOLD}${BLUE}║                     GOOGLE SIGN-IN & GCP CREDENTIALS                         ║${NC}"
    echo -e "${BOLD}${BLUE}╠══════════════════════════════════════════════════════════════════════════════╣${NC}"
    echo -e "  🌐 Web Client ID (serverClientId):  ${GREEN}${WEB_CLIENT_ID:-'Chưa có (Bật Google Sign-in tại Firebase Console)'}${NC}"
    echo -e "  🤖 Android Client ID:              ${GREEN}${ANDROID_CLIENT_ID:-'Tự động nhận diện qua SHA-1'}${NC}"
    echo -e "  🍎 iOS Client ID:                  ${GREEN}${IOS_CLIENT_ID:-'N/A'}${NC}"
    echo -e "  🔄 Reversed iOS Client ID:         ${GREEN}${REVERSED_CLIENT_ID:-'N/A'}${NC}"
    echo -e "  🔑 Debug SHA-1:                    ${GREEN}${DEBUG_SHA1:-'N/A'}${NC}"
    echo -e "  🔑 Debug SHA-256:                  ${GREEN}${DEBUG_SHA256:-'N/A'}${NC}"
    if [ -n "$FB_PROJECT" ]; then
        echo -e "  🔗 Firebase Auth Console:          ${YELLOW}https://console.firebase.google.com/project/$FB_PROJECT/authentication/providers${NC}"
        echo -e "  🔗 GCP Credentials Console:        ${YELLOW}https://console.cloud.google.com/apis/credentials?project=$FB_PROJECT${NC}"
    fi
    echo -e "${BOLD}${BLUE}╚══════════════════════════════════════════════════════════════════════════════╝${NC}\n"
fi

echo -e "\n${BOLD}🔄 Step 8: Updating Project Folder Alias...${NC}"
CURRENT_DIR_NAME=$(basename "$PROJECT_ROOT")
if [ "$CURRENT_DIR_NAME" != "$DART_NAME" ]; then
    PARENT_DIR="$(dirname "$PROJECT_ROOT")"
    NEW_PROJECT_DIR="$PARENT_DIR/$DART_NAME"
    if [ ! -e "$NEW_PROJECT_DIR" ]; then
        ln -s "$PROJECT_ROOT" "$NEW_PROJECT_DIR" 2>/dev/null || true
        echo -e "${GREEN}✔ Created project directory link: $NEW_PROJECT_DIR${NC}"
    fi
fi

echo -e "\n${BOLD}🔍 Step 9: Running Flutter Analyze Validation...${NC}"
flutter analyze

echo -e "\n${BOLD}${GREEN}======================================================${NC}"
echo -e "${BOLD}${GREEN}   🎉 PROJECT SETUP COMPLETED SUCCESSFULLY!           ${NC}"
echo -e "${BOLD}${GREEN}======================================================${NC}"
echo -e "Next steps:"
echo -e " 1. Run Dev Flavor:   ${YELLOW}flutter run -t lib/main_dev.dart --flavor dev${NC}"
echo -e " 2. Run Prod Flavor:  ${YELLOW}flutter run -t lib/main_prod.dart --flavor prod${NC}"
echo -e " 3. Create Features:  ${YELLOW}./gen_file_by_construct.sh${NC}\n"


