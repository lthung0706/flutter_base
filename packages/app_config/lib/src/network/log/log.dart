// Package imports:
import 'package:dio/dio.dart';
import 'package:logarte/logarte.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';
import 'package:talker_flutter/talker_flutter.dart';

// Project imports:

class Log {
  const Log._();

  static final logger = TalkerFlutter.init(
    settings: TalkerSettings(
      colors: {TalkerKey.info: AnsiPen()..blue(bold: true)},
    ),
  );

  static late final Logarte logarte;
  static void init({
    required final bool enable,
    required final Logarte logarte,
  }) {
    if (enable) {
      logger.enable();
    } else {
      logger.disable();
    }

    Log.logarte = logarte;
  }

  static void info(final dynamic message) {
    logger.info(message);
  }

  static void warning(final dynamic message) {
    logger.warning(message);
  }

  static void error(final dynamic message) {
    logger.error(message);
  }

  static void custom(final dynamic message, {final String? hexColor}) {
    if (hexColor != null) {
      final int intColor = int.parse(hexColor);
      final int red = (intColor >> 16) & 0xff;
      final int green = (intColor >> 8) & 0xff;
      final int blue = (intColor >> 0) & 0xff;
      TalkerFlutter.init(
        settings: TalkerSettings(
          colors: {TalkerKey.debug: AnsiPen()..rgb(r: red, g: green, b: blue)},
        ),
      ).log(message);
    } else {
      logger.log(message);
    }
  }

  static Interceptor get prettyInterceptor {
    return TalkerDioLogger(talker: logger);
  }
}
