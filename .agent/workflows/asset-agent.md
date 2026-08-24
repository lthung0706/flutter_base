---
description: Activates the Asset Manager Agent to replace app icons (Android & iOS) and splash screen images from the assets/ directory.
---

# Asset Manager Agent

You are the **Asset Manager Agent**. Your role is to replace app icons and splash screen images for Android and iOS platforms using pre-prepared files from the `assets/` directory.

## Prerequisites

The user MUST prepare source files in the `assets/` directory before running this workflow. Icons can be generated from [IconKitchen](https://icon.kitchen/) or similar tools.

### Expected Source Structure

```
assets/
├── android/                    ← Android adaptive icons (from IconKitchen)
│   ├── mipmap-mdpi/
│   │   ├── ic_launcher.png
│   │   ├── ic_launcher_foreground.png
│   │   ├── ic_launcher_background.png
│   │   └── ic_launcher_monochrome.png
│   ├── mipmap-hdpi/
│   │   └── ... (same files)
│   ├── mipmap-xhdpi/
│   │   └── ...
│   ├── mipmap-xxhdpi/
│   │   └── ...
│   └── mipmap-xxxhdpi/
│       └── ...
├── ios/                        ← iOS icons (from IconKitchen)
│   ├── AppIcon@2x.png
│   ├── AppIcon@3x.png
│   ├── ... (all icon files)
│   └── Contents.json
├── splash/                     ← Splash screen images
│   ├── splash.png              ← Main splash image (1x)
│   ├── splash@2x.png           ← 2x resolution
│   └── splash@3x.png           ← 3x resolution
└── web/                        ← Web icons (optional)
    ├── favicon.ico
    ├── icon-192.png
    ├── icon-512.png
    └── ...
```

## Workflow Steps

### Step 1: Verify Source Files
// turbo

Check which source directories have files ready:

```bash
echo "=== Android Icons ===" && ls assets/android/ 2>/dev/null || echo "(empty or missing)"
echo "=== iOS Icons ===" && ls assets/ios/ 2>/dev/null || echo "(empty or missing)"
echo "=== Splash Images ===" && ls assets/splash/ 2>/dev/null || echo "(empty or missing)"
echo "=== Web Icons ===" && ls assets/web/ 2>/dev/null || echo "(empty or missing)"
```

If a directory is empty or missing, **skip** that section and inform the user. Only process directories that contain files.

---

### Step 2: Replace Android App Icons

**Only run if `assets/android/` contains mipmap directories.**

For each density folder (`mipmap-mdpi`, `mipmap-hdpi`, `mipmap-xhdpi`, `mipmap-xxhdpi`, `mipmap-xxxhdpi`):

// turbo
```bash
# Copy Android icons from assets to Android resource directory
for density in mdpi hdpi xhdpi xxhdpi xxxhdpi; do
  SRC="assets/android/mipmap-${density}"
  DEST="android/app/src/main/res/mipmap-${density}"
  if [ -d "$SRC" ]; then
    echo "Copying $SRC → $DEST"
    cp -f "$SRC"/*.png "$DEST/"
  else
    echo "Skipping $SRC (not found)"
  fi
done
```

If `assets/android/` also contains an `ic_launcher.xml` for adaptive icons, copy it:

// turbo
```bash
if [ -f "assets/android/ic_launcher.xml" ]; then
  cp -f assets/android/ic_launcher.xml android/app/src/main/res/mipmap-anydpi-v26/ic_launcher.xml
  echo "Updated adaptive icon XML"
fi
```

---

### Step 3: Replace iOS App Icons

**Only run if `assets/ios/` contains PNG files and a Contents.json.**

// turbo
```bash
# Remove old iOS icons and copy new ones
rm -f ios/Runner/Assets.xcassets/AppIcon.appiconset/*.png
rm -f ios/Runner/Assets.xcassets/AppIcon.appiconset/Contents.json
cp assets/ios/*.png ios/Runner/Assets.xcassets/AppIcon.appiconset/
cp assets/ios/Contents.json ios/Runner/Assets.xcassets/AppIcon.appiconset/
echo "iOS app icons replaced successfully"
```

---

### Step 4: Replace Splash Screen Images

**Only run if `assets/splash/` contains splash image files.**

#### 4a. iOS Splash (LaunchImage)

// turbo
```bash
# Copy splash images to iOS LaunchImage.imageset
if [ -f "assets/splash/splash.png" ]; then
  cp -f assets/splash/splash.png ios/Runner/Assets.xcassets/LaunchImage.imageset/LaunchImage.png
  echo "Copied splash.png → LaunchImage.png"
fi
if [ -f "assets/splash/splash@2x.png" ]; then
  cp -f assets/splash/splash@2x.png ios/Runner/Assets.xcassets/LaunchImage.imageset/LaunchImage@2x.png
  echo "Copied splash@2x.png → LaunchImage@2x.png"
fi
if [ -f "assets/splash/splash@3x.png" ]; then
  cp -f assets/splash/splash@3x.png ios/Runner/Assets.xcassets/LaunchImage.imageset/LaunchImage@3x.png
  echo "Copied splash@3x.png → LaunchImage@3x.png"
fi
```

#### 4b. Android Splash

Copy the splash image to Android drawable directories and update `launch_background.xml` to reference it:

// turbo
```bash
# Copy splash image to Android drawable
if [ -f "assets/splash/splash.png" ]; then
  cp -f assets/splash/splash.png android/app/src/main/res/drawable/launch_image.png
  echo "Copied splash.png → drawable/launch_image.png"
fi
```

Then update the `launch_background.xml` files to use the splash image. Modify both:
- `android/app/src/main/res/drawable/launch_background.xml`
- `android/app/src/main/res/drawable-v21/launch_background.xml`

Replace the commented-out bitmap section with an active one:

```xml
<?xml version="1.0" encoding="utf-8"?>
<layer-list xmlns:android="http://schemas.android.com/apk/res/android">
    <item android:drawable="@android:color/white" />
    <item>
        <bitmap
            android:gravity="center"
            android:src="@drawable/launch_image" />
    </item>
</layer-list>
```

For the `-v21` version, use `?android:colorBackground` instead of `@android:color/white`.

---

### Step 5: Replace Web Icons (Optional)

**Only run if `assets/web/` contains icon files.**

// turbo
```bash
# Copy web icons to web/ directory
if [ -d "assets/web" ] && [ "$(ls -A assets/web 2>/dev/null)" ]; then
  for file in assets/web/*.png assets/web/*.ico; do
    if [ -f "$file" ]; then
      BASENAME=$(basename "$file")
      cp -f "$file" "web/$BASENAME"
      echo "Copied $BASENAME → web/"
    fi
  done
fi
```

---

### Step 6: Verify Results

// turbo
```bash
echo "=== Android mipmap-hdpi ===" && ls android/app/src/main/res/mipmap-hdpi/
echo "=== iOS AppIcon ===" && ls ios/Runner/Assets.xcassets/AppIcon.appiconset/ | head -5
echo "=== iOS LaunchImage ===" && ls ios/Runner/Assets.xcassets/LaunchImage.imageset/
echo "=== Web ===" && ls web/*.png web/*.ico 2>/dev/null
echo ""
echo "✅ Asset replacement complete!"
```

Report the results to the user:
- Which platforms were updated (Android/iOS/Web)
- Which were skipped (empty source directory)
- Remind user to rebuild the app to see changes: `flutter clean && flutter run`

## Important Notes

> [!IMPORTANT]
> - Always **verify source files exist** before copying. Never overwrite with empty files.
> - For Android adaptive icons, the `ic_launcher.xml` in `mipmap-anydpi-v26/` must reference `@mipmap/ic_launcher_foreground`, `@mipmap/ic_launcher_background`, and `@mipmap/ic_launcher_monochrome`.
> - After replacing icons, run `flutter clean` to clear cached assets.
> - Splash screen images should have a **transparent or solid background** for best results.
