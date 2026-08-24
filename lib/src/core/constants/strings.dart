/// Static string constants for non-label text in the app.
/// Use this for technical strings, status values, currency symbols, etc.
/// For user-facing labels and titles, use AppLocalizations instead.
class AppStrings {
  AppStrings._();

  // Currency
  static const String currencyVND = 'VND';

  // Placeholders for unknown data
  static const String noNameInitial = '?';
  static const String unknownSupplier = 'Unknown Supplier';

  // Order Status Values (for comparison logic, not display)
  static const String statusPending = 'pending';
  static const String statusCompleted = 'COMPLETED';
  static const String statusDelivered = 'ACCEPTED';
  static const String statusPurchased = 'PURCHASED';
  static const String statusCancelled = 'CANCELLED';
  static const String statusFailed = 'failed';
  static const String statusProcessing = 'processing';

  // Bottom navigation labels (currently hardcoded in home_body.dart)
  static const String navHome = 'Home';
  static const String navOrder = 'order';
  static const String navProfile = 'Profile';

  // Role types
  static const String roleInventory = 'inventory';
  static const String roleDelivery = 'delivery';
}
