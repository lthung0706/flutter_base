filePath="lib/src/app_config.dart"
touch $filePath
split=$(awk 'NR==2' RS='//------------CONFIGS AFTER THIS LINE CAN BE MODIFIED MANUALLY------------------' ORS='' lib/src/app_config.dart)
find . -name '.DS_Store' -type f -delete
touch temp
echo "
// GENERATED CODE - DO NOT MODIFY BY HAND
import 'dart:io';

import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../app_config.dart';

class AppConfig {
    " >$filePath
    while read line || [ -n "$line" ]; do
      [ -z "$line" ] && continue
      envkey=$(echo $line | awk -F "=" '{print $1}');
      camelname=$(echo $envkey | perl -ne 'print lc' | perl -pe 's/_([a-z])/uc($1)/ge')
      entry="static String get $camelname => dotenv.env['$envkey']!;"
      echo "     $entry" >>temp
    done < assets/dotenv/.env.dev
sort temp >>$filePath
printf "
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
    }
  }

  static void initTest() {
    dotenv.testLoad(
      fileInput:
          File('packages/app_config/assets/dotenv/.env.dev').readAsStringSync(),
    );
  }
  
//------------CONFIGS AFTER THIS LINE CAN BE MODIFIED MANUALLY------------------
" >> $filePath
echo $split >> $filePath
rm -f temp

dart format .

