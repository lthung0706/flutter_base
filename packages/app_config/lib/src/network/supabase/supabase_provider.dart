// ignore_for_file: deprecated_member_use

// Dart imports:
import 'dart:async';

// Package imports:
import 'package:app_config/src/network/log/log.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseProvider {
  SupabaseProvider({
    required this.url,
    required this.anonKey,
    required this.enableLogger,
    this.enableOnlineLogger = false,
    this.headers,
    this.authOptions,
    this.realtimeClientOptions,
    this.storageClientOptions,
    this.postgrestOptions,
  }) {
    if (enableLogger) {
      Log.info('⚡ SupabaseProvider instantiated for: $url');
    }
  }

  final String url;
  final String anonKey;
  final bool enableLogger;
  final bool enableOnlineLogger;
  final Map<String, String>? headers;
  final FlutterAuthClientOptions? authOptions;
  final RealtimeClientOptions? realtimeClientOptions;
  final StorageClientOptions? storageClientOptions;
  final PostgrestClientOptions? postgrestOptions;

  SupabaseClient? _client;
  bool _isInitialized = false;
  StreamSubscription<AuthState>? _authSubscription;

  /// Get active SupabaseClient instance
  SupabaseClient get client {
    if (_client != null) {
      return _client!;
    }
    try {
      return Supabase.instance.client;
    } catch (_) {
      if (url.isNotEmpty && anonKey.isNotEmpty) {
        _client = SupabaseClient(
          url,
          anonKey,
          headers: headers ?? const {},
          authOptions: authOptions ?? const AuthClientOptions(),
          realtimeClientOptions:
              realtimeClientOptions ?? const RealtimeClientOptions(),
          storageOptions: storageClientOptions ?? const StorageClientOptions(),
          postgrestOptions: postgrestOptions ?? const PostgrestClientOptions(),
        );
        return _client!;
      }
      throw StateError(
        'Supabase is not initialized. Please call `SupabaseProvider.init()` or provide valid url and anonKey.',
      );
    }
  }

  /// Initialize Supabase Flutter SDK
  Future<SupabaseClient?> init() async {
    if (_isInitialized && _client != null) {
      return _client;
    }

    if (url.isEmpty || anonKey.isEmpty) {
      if (enableLogger) {
        Log.warning('⚠️ Supabase URL or AnonKey is empty. Skipping initialization.');
      }
      return null;
    }

    try {
      // If already initialized globally by Supabase.initialize
      try {
        final instance = Supabase.instance;
        _client = instance.client;
        _isInitialized = true;
        if (enableLogger) {
          Log.info('⚡ Supabase was already initialized globally.');
        }
        _setupAuthLogging();
        return _client;
      } catch (_) {
        // Not initialized yet, proceed to initialize
      }

      final supabase = await Supabase.initialize(
        url: url,
        anonKey: anonKey,
        headers: headers ?? const {},
        debug: enableLogger,
        authOptions: authOptions ?? const FlutterAuthClientOptions(),
        realtimeClientOptions:
            realtimeClientOptions ?? const RealtimeClientOptions(),
        storageOptions: storageClientOptions ?? const StorageClientOptions(),
        postgrestOptions: postgrestOptions ?? const PostgrestClientOptions(),
      );

      _client = supabase.client;
      _isInitialized = true;

      if (enableLogger) {
        Log.info('✅ Supabase initialized successfully for: $url');
      }

      _setupAuthLogging();

      return _client;
    } catch (e, stack) {
      if (enableLogger) {
        Log.error('❌ Supabase initialization failed: $e\n$stack');
      }
      rethrow;
    }
  }

  void _setupAuthLogging() {
    if (!enableLogger || _client == null) return;
    _authSubscription?.cancel();
    _authSubscription = _client!.auth.onAuthStateChange.listen((data) {
      Log.info('🔐 Supabase Auth Event: ${data.event.name}');
    });
  }

  // --- Convenient Accessors ---

  GoTrueClient get auth => client.auth;
  PostgrestClient get rest => client.rest;
  SupabaseStorageClient get storage => client.storage;
  RealtimeClient get realtime => client.realtime;
  FunctionsClient get functions => client.functions;

  User? get currentUser => client.auth.currentUser;
  Session? get currentSession => client.auth.currentSession;
  Stream<AuthState> get onAuthStateChange => client.auth.onAuthStateChange;

  SupabaseQueryBuilder from(final String table) => client.from(table);

  PostgrestFilterBuilder<T> rpc<T>(
    final String fn, {
    final Map<String, dynamic>? params,
  }) => client.rpc<T>(fn, params: params);

  RealtimeChannel channel(
    final String name, {
    final RealtimeChannelConfig opts = const RealtimeChannelConfig(),
  }) => client.channel(name, opts: opts);

  Future<void> dispose() async {
    await _authSubscription?.cancel();
    _authSubscription = null;
    await _client?.dispose();
    _client = null;
    _isInitialized = false;
  }
}
