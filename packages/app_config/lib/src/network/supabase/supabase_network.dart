// Package imports:
import 'package:supabase_flutter/supabase_flutter.dart';

// Project imports:
import 'supabase_provider.dart';

class SupabaseNetwork {
  factory SupabaseNetwork({
    required final bool enableLogger,
    required final String url,
    required final String anonKey,
    final bool enableOnlineLogger = false,
    final Map<String, String>? headers,
    final FlutterAuthClientOptions? authOptions,
    final RealtimeClientOptions? realtimeClientOptions,
    final StorageClientOptions? storageClientOptions,
    final PostgrestClientOptions? postgrestOptions,
  }) {
    return SupabaseNetwork._init(
      enableLogger: enableLogger,
      enableOnlineLogger: enableOnlineLogger,
      url: url,
      anonKey: anonKey,
      headers: headers,
      authOptions: authOptions,
      realtimeClientOptions: realtimeClientOptions,
      storageClientOptions: storageClientOptions,
      postgrestOptions: postgrestOptions,
    );
  }

  SupabaseNetwork._init({
    required this.enableLogger,
    required this.enableOnlineLogger,
    required this.url,
    required this.anonKey,
    this.headers,
    this.authOptions,
    this.realtimeClientOptions,
    this.storageClientOptions,
    this.postgrestOptions,
  }) {
    supabaseProvider = SupabaseProvider(
      url: url,
      anonKey: anonKey,
      enableLogger: enableLogger,
      enableOnlineLogger: enableOnlineLogger,
      headers: headers,
      authOptions: authOptions,
      realtimeClientOptions: realtimeClientOptions,
      storageClientOptions: storageClientOptions,
      postgrestOptions: postgrestOptions,
    );
  }

  final bool enableLogger;
  final bool enableOnlineLogger;
  final String url;
  final String anonKey;
  final Map<String, String>? headers;
  final FlutterAuthClientOptions? authOptions;
  final RealtimeClientOptions? realtimeClientOptions;
  final StorageClientOptions? storageClientOptions;
  final PostgrestClientOptions? postgrestOptions;

  late SupabaseProvider supabaseProvider;
}
