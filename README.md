# Flutter Clean Architecture Base Project 🚀

A production-ready Flutter starter template built on **Clean Architecture**, **BLoC State Management**, **Injectable & GetIt Dependency Injection**, **Retrofit Networking**, **Hive CE Local Storage**, and **GoRouter Navigation**.

Designed to save 80%+ time when kickstarting new mobile applications.

---

## 🌟 Core Features Included Out of the Box

1. **Authentication & Session Management (`lib/src/authentication`)**:
   - Email/Password Login & Register.
   - Google Sign-In & Apple Sign-In.
   - Auto-session check & restore on app launch.
   - Global 401 token expiry interception with `SessionGuard`.
   - Local Hive persistent user caching.

2. **In-App Purchase & Subscription Billing (`lib/src/billing`)**:
   - Integrated `in_app_purchase` for iOS & Android.
   - Store product catalog fetching.
   - Server-side receipt verification & credit update flow.
   - Pending purchase caching & recovery.

3. **Core App Flow (`GlobalAppPage`)**:
   - `GlobalAppPage` (Settings provider, theme, locale) ➔ `SplashPage` ➔ `OnboardingPage` / `AuthenticationPage` ➔ `HomePage` ➔ `SettingPage` / `BillingPage`.
   - Dynamic Theme Switcher (System / Light / Dark).
   - Multi-Language Localization (English, Vietnamese, Japanese) with Arb files in `packages/app_intl`.
   - Currency switcher (VND, USD, EUR, JPY, GBP, KRW, CNY).

4. **Modern UI Component Library (`lib/src/components`)**:
   - `AppButton`, `AppTextField`, `AppDialog`, `AppSnackBar`, `PrimaryCard`, `BottomSheetMixin`.
   - Polished Starter Dashboard (`HomePage`) & Settings (`SettingPage`).
   - Markdown viewer for Terms of Service and Privacy Policy.

5. **Infrastructure & Tooling**:
   - Flavor configuration: `dev` and `prod` environments (`packages/app_config`).
   - Push Notifications setup (`FirebaseMessagingService`, `LocalNotificationsService`).
   - Code generators: Asset class generator (`gen_asset_code.sh`) and Clean Architecture Feature generator (`gen_file_by_construct.sh`).

---

## ⚡ Quick Start: Setup & Rebrand a New Project

To configure and rebrand this base project into a new app, run:

```bash
# Interactive mode:
./setup_project.sh

# Or with CLI flags:
./setup_project.sh \
  --app-name "My New App" \
  --dart-name "my_new_app" \
  --package-id "com.company.mynewapp" \
  --base-url "https://api.mynewapp.com" \
  --auth-base-url "https://api.mynewapp.com" \
  --upload-url "https://upload.mynewapp.com"
```

The script will automatically:
- Update `pubspec.yaml` name and description.
- Rename all Dart imports across all files (`package:sstrip/...` ➔ `package:my_new_app/...`).
- Configure Android `applicationId`, `namespace`, and `app_name`.
- Configure iOS `PRODUCT_BUNDLE_IDENTIFIER`, `CFBundleDisplayName`, and `CFBundleName`.
- Update `.env.dev` and `.env.prod`.
- Run `flutter pub get`, localizations generation, asset generation, and `build_runner`.

---

## 🏃 Running the Application

### Development Environment (`dev`)
```bash
flutter run -t lib/main_dev.dart --flavor dev
```

### Production Environment (`prod`)
```bash
flutter run -t lib/main_prod.dart --flavor prod
```

---

## 🧱 Generating Features & Clean Architecture Code

Use the built-in CLI generator to scaffold new Clean Architecture layers:

```bash
./gen_file_by_construct.sh
```

Choose from:
1. **Feature**: Automatically creates Data Source (Retrofit), Model (JSON Serializable), Entity, Repository, Usecase, Page, Body, and Bloc.
2. **Model**: Creates JSON Serializable Model + Entity.
3. **Params**: Creates JSON Serializable Request Body parameters.

---

## 📁 Project Architecture Overview

```text
lib/
├── firebase_options.dart
├── main_dev.dart                          # Dev entry point
├── main_prod.dart                         # Prod entry point
└── src/
    ├── authentication/                    # Auth: API, Repo, Bloc, UI, Apple/Google
    ├── billing/                           # Billing & In-App Purchase flow
    ├── components/                        # Design system & reusable widgets
    ├── core/                              # Helpers, session guard, services, theme
    ├── data/
    │   ├── datasources/remote/            # Retrofit REST API services
    │   ├── models/                        # DTOs & JSON Serializable models
    │   └── repositories/                  # Repository implementations
    ├── domain/
    │   ├── entities/                      # Business entities
    │   └── repositories/                  # Repository interfaces
    ├── mapper/                            # AutoMappr data-to-domain mapping
    ├── module/                            # Injectable & GetIt DI configuration
    ├── presentation/
    │   ├── app/                           # GlobalApp wrapper, settings & theme provider
    │   ├── account/                       # Profile & account settings
    │   ├── home/                          # Clean starter dashboard
    │   ├── legal/                         # Terms & Privacy markdown viewers
    │   ├── onboarding/                    # Onboarding flow
    │   ├── setting/                       # App settings (theme, language, billing)
    │   └── splash/                        # Splash screen
    └── routes/                            # Typed GoRouter route hierarchy
```

---

## 🛠️ Code Generation & Commands Reference

| Action | Command |
|---|---|
| Rebuild all generated code | `flutter pub run build_runner build --delete-conflicting-outputs` |
| Generate Assets class | `./gen_asset_code.sh` |
| Generate Translations | `cd packages/app_intl && flutter gen-l10n` |
| Analyze codebase | `flutter analyze` |
| Run Unit Tests | `flutter test` |
