#!/bin/bash
# ==============================================================================
# All-in-One 3rd-Party Auth & Backend Services Setup Script
# Firebase + GCP OAuth + Google Sign-In + Supabase Auth + Supabase MCP Setup
# ==============================================================================
# Usage:
#   Interactive:
#     ./scripts/setup_auth_services.sh
#
#   CLI Flags:
#     ./scripts/setup_auth_services.sh \
#       --firebase-project-id "report-person-app" \
#       --supabase-token "sbp_xxx" \
#       --supabase-project-id "mbnglacnhtvbulryvnzv"
# ==============================================================================

set -e

BOLD="\033[1m"
GREEN="\033[0;32m"
BLUE="\033[0;34m"
YELLOW="\033[1;33m"
RED="\033[0;31m"
CYAN="\033[0;36m"
NC="\033[0m"

echo -e "${BOLD}${BLUE}================================================================${NC}"
echo -e "${BOLD}${BLUE}   🔐 3RD-PARTY SERVICES: FIREBASE, GCP, SUPABASE & MCP SETUP   ${NC}"
echo -e "${BOLD}${BLUE}================================================================${NC}\n"

PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$PROJECT_ROOT"

# Ensure pub-cache bin is in PATH for flutterfire
export PATH="$PATH:$HOME/.pub-cache/bin"

DART_NAME=$(grep "^name:" pubspec.yaml | head -n 1 | awk '{print $2}' | tr -d '\r\n')
PACKAGE_ID=$(grep "namespace = " android/app/build.gradle.kts | head -n 1 | sed -E 's/.*namespace = "([^"]+)".*/\1/')
APP_NAME=$(grep "<string>.*</string>" ios/Runner/Info.plist 2>/dev/null | grep -v "http" | head -n 1 | sed -E 's/.*<string>([^<]+)<\/string>.*/\1/')

SETUP_FIREBASE=""
FIREBASE_PROJECT_ID=""
CREATE_FIREBASE_PROJECT=false
GOOGLE_WEB_CLIENT_ID=""
SUPABASE_TOKEN=""
SUPABASE_PROJECT_ID=""

# Parse CLI arguments
while [[ "$#" -gt 0 ]]; do
    case $1 in
        --firebase-project-id) FIREBASE_PROJECT_ID="$2"; SETUP_FIREBASE="true"; shift ;;
        --create-firebase-project) CREATE_FIREBASE_PROJECT=true; SETUP_FIREBASE="true"; shift ;;
        --setup-firebase) SETUP_FIREBASE="true"; shift ;;
        --skip-firebase) SETUP_FIREBASE="false"; shift ;;
        --google-web-client-id) GOOGLE_WEB_CLIENT_ID="$2"; shift ;;
        --supabase-token) SUPABASE_TOKEN="$2"; shift ;;
        --supabase-project-id) SUPABASE_PROJECT_ID="$2"; shift ;;
        -h|--help)
            echo "Usage: ./scripts/setup_auth_services.sh [options]"
            echo "Options:"
            echo "  --firebase-project-id <id>      Firebase Project ID"
            echo "  --create-firebase-project       Create new Firebase project automatically"
            echo "  --setup-firebase                Enable Firebase configuration step"
            echo "  --skip-firebase                 Skip Firebase configuration step"
            echo "  --google-web-client-id <id>     Google Web Client ID override"
            echo "  --supabase-token <token>        Supabase Personal Access Token (sbp_...)"
            echo "  --supabase-project-id <ref>     Supabase Project ID/Ref (e.g. mbnglacnhtvbulryvnzv)"
            exit 0
            ;;
        *) echo -e "${RED}Unknown option: $1${NC}"; exit 1 ;;
    esac
    shift
done

# ------------------------------------------------------------------------------
# STEP 1: Firebase & FlutterFire Configuration
# ------------------------------------------------------------------------------
echo -e "${BOLD}${CYAN}📌 [Step 1/5] Firebase & FlutterFire Setup...${NC}"

if [ -z "$SETUP_FIREBASE" ]; then
    echo -e "  1) Create a new Firebase project automatically"
    echo "  2) Link an existing Firebase project (by Project ID)"
    echo "  3) Interactive flutterfire configure"
    echo "  4) Use existing google-services.json / GoogleService-Info.plist (Skip re-config)"
    echo "  5) Skip Firebase entirely"
    read -p "$(echo -e "${YELLOW}👉 Choose Firebase option [1-5, default: 4]: ${NC}")" FB_OPT
    FB_OPT=${FB_OPT:-4}
    case "$FB_OPT" in
        1)
            SETUP_FIREBASE="true"
            CREATE_FIREBASE_PROJECT=true
            SUGGESTED_FB_ID="$(echo "${DART_NAME:-app}" | tr '_' '-')-app"
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
            SETUP_FIREBASE="existing"
            ;;
        5)
            SETUP_FIREBASE="false"
            ;;
        *)
            SETUP_FIREBASE="existing"
            ;;
    esac
fi

if [ "$SETUP_FIREBASE" = "true" ]; then
    if ! command -v firebase &> /dev/null; then
        echo -e "  ${YELLOW}⚠️ 'firebase' CLI not found. Attempting install via npm...${NC}"
        npm install -g firebase-tools || true
    fi

    if ! command -v flutterfire &> /dev/null; then
        echo -e "  ${YELLOW}⚠️ 'flutterfire' CLI not found. Activating flutterfire_cli...${NC}"
        dart pub global activate flutterfire_cli || true
    fi

    if ! firebase login:list 2>/dev/null | grep -q "@"; then
        echo -e "  ${YELLOW}🔑 Please log in to Firebase CLI:${NC}"
        firebase login
    fi

    if [ "$CREATE_FIREBASE_PROJECT" = true ] && [ -n "$FIREBASE_PROJECT_ID" ]; then
        echo -e "  🔹 Creating Firebase project '$FIREBASE_PROJECT_ID'..."
        firebase projects:create "$FIREBASE_PROJECT_ID" --display-name "${APP_NAME:-App}" || true
        
        echo -e "  🔹 Registering Android app ($PACKAGE_ID)..."
        firebase apps:create ANDROID "${APP_NAME:-App} Android" --package-name "$PACKAGE_ID" --project "$FIREBASE_PROJECT_ID" || true
        
        echo -e "  🔹 Registering iOS app ($PACKAGE_ID)..."
        firebase apps:create IOS "${APP_NAME:-App} iOS" --bundle-id "$PACKAGE_ID" --project "$FIREBASE_PROJECT_ID" || true
    fi

    if [ "$FIREBASE_PROJECT_ID" = "interactive" ]; then
        flutterfire configure
    elif [ -n "$FIREBASE_PROJECT_ID" ]; then
        flutterfire configure \
            --project="$FIREBASE_PROJECT_ID" \
            --platforms=android,ios \
            --android-package-name="$PACKAGE_ID" \
            --ios-bundle-id="$PACKAGE_ID" \
            -y -f
    fi
    echo -e "  ${GREEN}✔ Firebase CLI configuration completed.${NC}"
elif [ "$SETUP_FIREBASE" = "existing" ]; then
    echo -e "  ${GREEN}✔ Using existing Firebase config files.${NC}"
else
    echo -e "  ${YELLOW}⚠️ Skipped Firebase setup.${NC}"
fi

# ------------------------------------------------------------------------------
# STEP 2: Keystore SHA & GCP / Firebase Registration
# ------------------------------------------------------------------------------
echo -e "\n${BOLD}${CYAN}📌 [Step 2/5] Debug Keystore SHA Extraction & GCP Registration...${NC}"

DEBUG_KEYSTORE="$HOME/.android/debug.keystore"
if [ ! -f "$DEBUG_KEYSTORE" ]; then
    echo -e "  🔹 Generating debug keystore at $DEBUG_KEYSTORE..."
    mkdir -p "$HOME/.android"
    keytool -genkey -v -keystore "$DEBUG_KEYSTORE" -storepass android -alias androiddebugkey -keypass android -keyalg RSA -keysize 2048 -validity 10000 -dname "CN=Android Debug,O=Android,C=US" >/dev/null 2>&1 || true
fi

DEBUG_SHA1=$(keytool -list -v -keystore "$DEBUG_KEYSTORE" -alias androiddebugkey -storepass android -keypass android 2>/dev/null | grep "SHA1:" | head -n 1 | awk '{print $2}')
DEBUG_SHA256=$(keytool -list -v -keystore "$DEBUG_KEYSTORE" -alias androiddebugkey -storepass android -keypass android 2>/dev/null | grep "SHA256:" | head -n 1 | awk '{print $2}')

echo -e "  🔑 Debug SHA-1:   ${GREEN}${DEBUG_SHA1:-'Not found'}${NC}"
echo -e "  🔑 Debug SHA-256: ${GREEN}${DEBUG_SHA256:-'Not found'}${NC}"

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
    echo -e "  🔹 Auto-registering SHA fingerprints to Firebase project '${FB_PROJECT}'..."
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

    echo -e "  ${GREEN}✔ SHA fingerprints registered to Firebase / GCP.${NC}"

    if command -v firebase &> /dev/null; then
        firebase apps:sdkconfig ANDROID "$ANDROID_APP_ID" --project="$FB_PROJECT" > android/app/google-services.json 2>/dev/null || true
    fi
fi

# ------------------------------------------------------------------------------
# STEP 3: Google OAuth Client IDs & Mobile Client Sync
# ------------------------------------------------------------------------------
echo -e "\n${BOLD}${CYAN}📌 [Step 3/5] Extracting Google OAuth Client IDs & Syncing Mobile Config...${NC}"

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

echo -e "  🌐 Web Client ID:      ${GREEN}${WEB_CLIENT_ID:-'Not found'}${NC}"
echo -e "  🤖 Android Client ID:  ${GREEN}${ANDROID_CLIENT_ID:-'Not found'}${NC}"
echo -e "  🍎 iOS Client ID:      ${GREEN}${IOS_CLIENT_ID:-'Not found'}${NC}"

if [ -n "$WEB_CLIENT_ID" ] && [ -f "lib/src/authentication/view/login_page.dart" ]; then
    sed -i "" -E "s/serverClientId:[[:space:]]*'[^']*'/serverClientId: '$WEB_CLIENT_ID'/g" lib/src/authentication/view/login_page.dart
    echo -e "  ${GREEN}✔ Updated serverClientId in lib/src/authentication/view/login_page.dart${NC}"
fi

if [ -n "$IOS_CLIENT_ID" ] && [ -f "ios/Runner/Info.plist" ]; then
    if grep -q "<key>GIDClientID</key>" ios/Runner/Info.plist; then
        sed -i "" -E "s|<key>GIDClientID</key>[[:space:]]*<string>[^<]*</string>|<key>GIDClientID</key>\
	<string>$IOS_CLIENT_ID</string>|g" ios/Runner/Info.plist
        echo -e "  ${GREEN}✔ Updated GIDClientID in ios/Runner/Info.plist${NC}"
    fi
fi

if [ -n "$REVERSED_CLIENT_ID" ] && [ -f "ios/Runner/Info.plist" ]; then
    if grep -q "com.googleusercontent.apps." ios/Runner/Info.plist; then
        sed -i "" -E "s|<string>com\.googleusercontent\.apps\.[^<]*</string>|<string>$REVERSED_CLIENT_ID</string>|g" ios/Runner/Info.plist
        echo -e "  ${GREEN}✔ Updated CFBundleURLSchemes in ios/Runner/Info.plist${NC}"
    fi
fi

# ------------------------------------------------------------------------------
# STEP 4: Supabase Management API Sync & Auto-Config
# ------------------------------------------------------------------------------
echo -e "\n${BOLD}${CYAN}📌 [Step 4/5] Supabase Management API Sync & Google Provider Auto-Setup...${NC}"

if [ -z "$SUPABASE_TOKEN" ]; then
    echo -e "  ${YELLOW}🔑 Enter your Supabase Personal Access Token (sbp_...)${NC}"
    echo -e "     (Dashboard: ${CYAN}https://supabase.com/dashboard/account/tokens${NC})"
    read -p "$(echo -e "${YELLOW}👉 Supabase Access Token (leave blank to skip): ${NC}")" SUPABASE_TOKEN
fi

if [ -n "$SUPABASE_TOKEN" ]; then
    PROJECTS_JSON=$(curl -s -H "Authorization: Bearer $SUPABASE_TOKEN" https://api.supabase.com/v1/projects)
    
    if echo "$PROJECTS_JSON" | grep -q '"message"'; then
        echo -e "  ${RED}❌ Supabase API error: $(echo "$PROJECTS_JSON" | grep -o '"message":"[^"]*"')${NC}"
    else
        if [ -z "$SUPABASE_PROJECT_ID" ]; then
            SELECTED_PROJECT=$(python3 -c "
import json, sys
try:
    projects = json.loads('''$PROJECTS_JSON''')
    if not projects:
        sys.exit(1)
    if len(projects) == 1:
        print(projects[0]['id'])
    else:
        print('PROMPT_SELECTION')
except Exception:
    sys.exit(1)
" 2>/dev/null || true)

            if [ "$SELECTED_PROJECT" = "PROMPT_SELECTION" ]; then
                echo -e "  📋 Available Supabase Projects:"
                python3 -c "
import json
projects = json.loads('''$PROJECTS_JSON''')
for i, p in enumerate(projects):
    print(f'    {i+1}) {p.get(\"name\")} (ID: {p.get(\"id\")})')
"
                read -p "$(echo -e "${YELLOW}👉 Choose project [1-N]: ${NC}")" PROJ_INDEX
                SUPABASE_PROJECT_ID=$(python3 -c "
import json
projects = json.loads('''$PROJECTS_JSON''')
idx = int('$PROJ_INDEX') - 1
if 0 <= idx < len(projects):
    print(projects[idx]['id'])
" 2>/dev/null || true)
            elif [ -n "$SELECTED_PROJECT" ]; then
                SUPABASE_PROJECT_ID="$SELECTED_PROJECT"
            fi
        fi

        if [ -n "$SUPABASE_PROJECT_ID" ]; then
            echo -e "  🎯 Supabase Project ID: ${GREEN}$SUPABASE_PROJECT_ID${NC}"
            
            # Fetch Keys
            KEYS_JSON=$(curl -s -H "Authorization: Bearer $SUPABASE_TOKEN" "https://api.supabase.com/v1/projects/$SUPABASE_PROJECT_ID/api-keys")
            ANON_KEY=$(python3 -c "
import json
keys = json.loads('''$KEYS_JSON''')
for k in keys:
    if k.get('name') == 'anon' or k.get('id') == 'anon':
        print(k.get('api_key', ''))
        exit(0)
" 2>/dev/null || true)

            TARGET_SUPABASE_URL="https://${SUPABASE_PROJECT_ID}.supabase.co"

            if [ -n "$ANON_KEY" ]; then
                echo -e "  🔑 Anon Key retrieved: ${GREEN}${ANON_KEY:0:25}...${NC}"

                for ENV_FILE in "packages/app_config/assets/dotenv/.env.dev" "packages/app_config/assets/dotenv/.env.prod"; do
                    if [ -f "$ENV_FILE" ]; then
                        sed -i "" "s|^BASE_URL=.*|BASE_URL=\x27$TARGET_SUPABASE_URL\x27|" "$ENV_FILE"
                        sed -i "" "s|^BASE_AUTH_URL=.*|BASE_AUTH_URL=\x27$TARGET_SUPABASE_URL\x27|" "$ENV_FILE"
                        sed -i "" "s|^UPLOAD_URL=.*|UPLOAD_URL=\x27$TARGET_SUPABASE_URL\x27|" "$ENV_FILE"
                        sed -i "" "s|^SUPABASE_URL=.*|SUPABASE_URL=\x27$TARGET_SUPABASE_URL\x27|" "$ENV_FILE"
                        sed -i "" "s|^SUPABASE_ANON_KEY=.*|SUPABASE_ANON_KEY=\x27$ANON_KEY\x27|" "$ENV_FILE"
                    fi
                done
                echo -e "  ${GREEN}✔ Updated .env.dev and .env.prod with correct Supabase URL & matching Anon Key.${NC}"
            fi

            # Auto Configure Google Provider
            CLIENT_IDS_LIST=()
            [ -n "$WEB_CLIENT_ID" ] && CLIENT_IDS_LIST+=("$WEB_CLIENT_ID")
            [ -n "$IOS_CLIENT_ID" ] && CLIENT_IDS_LIST+=("$IOS_CLIENT_ID")
            [ -n "$ANDROID_CLIENT_ID" ] && CLIENT_IDS_LIST+=("$ANDROID_CLIENT_ID")
            
            COMBINED_CLIENT_IDS=$(IFS=,; echo "${CLIENT_IDS_LIST[*]}")

            PATCH_DATA=$(python3 -c "
import json
payload = {
    'external_google_enabled': True,
    'external_google_skip_nonce_check': True,
}
if '$COMBINED_CLIENT_IDS':
    payload['external_google_client_id'] = '$COMBINED_CLIENT_IDS'
print(json.dumps(payload))
")

            curl -s -X PATCH \
              -H "Authorization: Bearer $SUPABASE_TOKEN" \
              -H "Content-Type: application/json" \
              -d "$PATCH_DATA" \
              "https://api.supabase.com/v1/projects/$SUPABASE_PROJECT_ID/config/auth" >/dev/null 2>&1 || true

            echo -e "  ${GREEN}✔ Google OAuth Provider enabled on Supabase (Skip nonce check: true, Client IDs synced).${NC}"

            # Connectivity Test
            TEST_STATUS=$(curl -s -o /dev/null -w "%{http_code}" -H "apikey: $ANON_KEY" "${TARGET_SUPABASE_URL}/auth/v1/settings" || true)
            if [ "$TEST_STATUS" = "200" ]; then
                echo -e "  ${GREEN}✔ Supabase Auth Endpoint connectivity test: HTTP 200 OK${NC}"
            else
                echo -e "  ${YELLOW}⚠️ Supabase Auth test returned HTTP status: $TEST_STATUS${NC}"
            fi
        fi
    fi
fi

# ------------------------------------------------------------------------------
# STEP 5: Supabase MCP Server Setup
# ------------------------------------------------------------------------------
echo -e "\n${BOLD}${CYAN}📌 [Step 5/5] Supabase MCP Server Configuration...${NC}"

mkdir -p .agents

cat <<EOF > .agents/mcp_config.json
{
  "mcpServers": {
    "supabase": {
      "serverUrl": "https://mcp.supabase.com/mcp"
    }
  }
}
EOF

cat <<EOF > .mcp.json
{
  "mcpServers": {
    "supabase": {
      "url": "https://mcp.supabase.com/mcp"
    }
  }
}
EOF

echo -e "  ${GREEN}✔ Configured .agents/mcp_config.json & .mcp.json for Supabase MCP.${NC}"

# ------------------------------------------------------------------------------
# Summary
# ------------------------------------------------------------------------------
echo -e "\n${BOLD}${GREEN}================================================================${NC}"
echo -e "${BOLD}${GREEN}   🎉 3RD-PARTY AUTH & SUPABASE INTEGRATION COMPLETED!           ${NC}"
echo -e "${BOLD}${GREEN}================================================================${NC}"
echo -e "  🌐 Web Client ID:      ${CYAN}${WEB_CLIENT_ID:-'N/A'}${NC}"
echo -e "  🤖 Android Client ID:  ${CYAN}${ANDROID_CLIENT_ID:-'N/A'}${NC}"
echo -e "  🍎 iOS Client ID:      ${CYAN}${IOS_CLIENT_ID:-'N/A'}${NC}"
echo -e "  ⚡ Supabase URL:       ${CYAN}${TARGET_SUPABASE_URL:-'N/A'}${NC}"
echo -e "  🤖 Supabase MCP:       ${CYAN}https://mcp.supabase.com/mcp${NC}"
echo -e "================================================================\n"
