// GENERATED CODE - DO NOT MODIFY BY HAND
import 'dart:io';

import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../app_config.dart';

class AppConfig {
  static String get appName => dotenv.env['APP_NAME']!;
  static String get baseAuthUrl => dotenv.env['BASE_AUTH_URL']!;
  static String get baseGoogleMapUrl => dotenv.env['BASE_GOOGLE_MAP_URL']!;
  static String get baseSocialUrl => dotenv.env['BASE_SOCIAL_URL']!;
  static String get baseToken => dotenv.env['BASE_TOKEN']!;
  static String get baseUrl => dotenv.env['BASE_URL']!;
  static String get chatUrl => dotenv.env['CHAT_URL']!;
  static String get customerBaseUrl => dotenv.env['CUSTOMER_BASE_URL']!;
  static String get enableDebug => dotenv.env['ENABLE_DEBUG']!;
  static String get env => dotenv.env['ENV']!;
  static String get grpcUrl => dotenv.env['GRPC_URL']!;
  static String get supabaseUrl => dotenv.env['SUPABASE_URL'] ?? '';
  static String get supabaseAnonKey => dotenv.env['SUPABASE_ANON_KEY'] ?? '';
  static String get supabaseTrackingSchema =>
      dotenv.env['SUPABASE_TRACKING_SCHEMA'] ?? 'public';
  static String get supabaseTrackingTable =>
      dotenv.env['SUPABASE_TRACKING_TABLE'] ?? 'delivery_tracking';
  static String get supabaseTrackingUserIdColumn =>
      dotenv.env['SUPABASE_TRACKING_USER_ID_COLUMN'] ?? 'user_id';
  static String get uploadToken => dotenv.env['UPLOAD_TOKEN']!;
  static String get uploadUrl => dotenv.env['UPLOAD_URL']!;

  static bool get isDebug => enableDebug == 'true';

  static Future<void> init({required final Environment environment}) async {
    switch (environment) {
      case Environment.sandbox:
        {
          await dotenv.load(
            fileName: 'packages/app_config/assets/dotenv/.env.dev',
          );
          break;
        }
      case Environment.production:
      case Environment.staging:
        {
          await dotenv.load(
            fileName: 'packages/app_config/assets/dotenv/.env.prod',
          );
          break;
        }
      default:
        {
          await dotenv.load(
            fileName: 'packages/app_config/assets/dotenv/.env.dev',
          );
          break;
        }
    }
  }

  static void initTest() {
    dotenv.testLoad(
      fileInput: File(
        'packages/app_config/assets/dotenv/.env.dev',
      ).readAsStringSync(),
    );
  }

  //------------CONFIGS AFTER THIS LINE CAN BE MODIFIED MANUALLY------------------
  static const Duration connectTimeout = Duration(milliseconds: 20000);
  static const Duration receiveTimeout = Duration(milliseconds: 10000);
  static const String socketProduct = 'theAdvanceApp';
  static const String socketApiToken =
      '284ecb4533b197d2fa9bca5737'
      'f41fa89b5a653a38c7ec1e4614425ccb4954e4';
}
