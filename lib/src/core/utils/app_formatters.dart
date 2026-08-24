import 'package:app_intl/ez_intl.dart';
import 'package:report_person/src/authentication/view/authentication_page.dart';

class AppFormatters {
  AppFormatters._();

  static final NumberFormat _currencyFormat = NumberFormat.decimalPattern('vi');

  /// Định dạng tiền tệ theo mã tiền tệ truyền vào hoặc sử dụng mã tiền tệ hiện tại của hệ thống.
  static String formatCurrency(num amount, {String? currencyCode}) {
    final code = currencyCode ?? AuthenticationPage.currency.value ?? '';
    return '${_currencyFormat.format(amount)} $code'.trim();
  }
}
