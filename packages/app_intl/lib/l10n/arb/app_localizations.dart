import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_ja.dart';
import 'app_localizations_vi.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'arb/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('ja'),
    Locale('vi'),
  ];

  /// No description provided for @storeName.
  ///
  /// In en, this message translates to:
  /// **'Store Name'**
  String get storeName;

  /// No description provided for @address.
  ///
  /// In en, this message translates to:
  /// **'Address'**
  String get address;

  /// No description provided for @phone.
  ///
  /// In en, this message translates to:
  /// **'Phone Number'**
  String get phone;

  /// No description provided for @unknown.
  ///
  /// In en, this message translates to:
  /// **'Unknown'**
  String get unknown;

  /// No description provided for @notAvailable.
  ///
  /// In en, this message translates to:
  /// **'N/A'**
  String get notAvailable;

  /// No description provided for @systemManagement.
  ///
  /// In en, this message translates to:
  /// **'SYSTEM MANAGEMENT'**
  String get systemManagement;

  /// No description provided for @employees.
  ///
  /// In en, this message translates to:
  /// **'Employees'**
  String get employees;

  /// No description provided for @appSettings.
  ///
  /// In en, this message translates to:
  /// **'App Settings'**
  String get appSettings;

  /// No description provided for @reportIssue.
  ///
  /// In en, this message translates to:
  /// **'Report an Issue'**
  String get reportIssue;

  /// No description provided for @regulationsAndPolicies.
  ///
  /// In en, this message translates to:
  /// **'REGULATIONS & POLICIES'**
  String get regulationsAndPolicies;

  /// No description provided for @termsConditions.
  ///
  /// In en, this message translates to:
  /// **'Terms and Conditions'**
  String get termsConditions;

  /// No description provided for @privacyPolicy.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get privacyPolicy;

  /// No description provided for @termsConditionsMarkdown.
  ///
  /// In en, this message translates to:
  /// **'## TERMS OF SERVICE\n\n### 1. Acceptance of Terms\nBy registering an account and using the SStrip application, users (including Store Owners, Warehouse Staff, and Delivery Staff) agree to comply with all of the terms below. If you do not agree, please stop using the service immediately.\n\n### 2. Service Description\nSStrip is a platform for supply chain and goods transportation management. The application provides tools to:\n* Manage warehouses, stores, and suppliers.\n* Create and track delivery orders.\n* Monitor delivery routes in real time on the map.\n* Scan QR codes to look up products and orders.\n* Receive push notifications about order status.\n\n### 3. User Accounts\n* **Registration:** Users register with an email address or phone number. Employee accounts are created and assigned permissions by the Store Owner.\n* **Security:** Users are responsible for protecting their login credentials and all activities performed under their account.\n* **Authorization:** Access to features (create, edit, delete orders or data) is managed through a role system assigned by the Store Owner.\n\n### 4. User Responsibilities\n* Provide accurate and truthful information about goods (name, price, unit, image).\n* Commit not to transport prohibited goods, explosives, smuggled goods, or any items that violate Vietnamese law.\n* Do not use the application for fraudulent, destructive, or illegal purposes.\n* Ensure uploaded images do not infringe the intellectual property rights of any third party.\n\n### 5. Service Fees and Payment\n* Any related costs will be displayed publicly in the application before the user confirms an order.\n* Product prices are calculated in VND and displayed clearly for each item.\n\n### 6. Limitation of Liability\n* SStrip provides technology solutions and is not directly responsible for the quality of goods or incidents caused by third parties.\n* Any claims regarding damaged goods will be resolved based on evidence (images, delivery records) recorded in the application.\n* We are not liable for service interruptions caused by network failures, natural disasters, or force majeure events.\n\n### 7. Termination of Service\n* We reserve the right to suspend or terminate user accounts if violations of these terms are detected.\n* Users may request account deletion at any time.\n\n---\n*Last updated: March 05, 2026*'**
  String get termsConditionsMarkdown;

  /// No description provided for @privacyPolicyMarkdown.
  ///
  /// In en, this message translates to:
  /// **'## PRIVACY POLICY\n\n> This policy is prepared in compliance with Decree 13/2023/ND-CP on personal data protection in Vietnam.\n\n### 1. Data We Collect\n\n**a) Account information:**\n* Full name, email, and phone number (during registration).\n* Passwords (encrypted and never stored as plain text).\n* Roles and permissions in the system (Store Owner, Warehouse Staff, Delivery Staff).\n\n**b) Location data (GPS):**\n* Delivery staff location is collected in real time, including when the application runs in the background, to update delivery routes for relevant parties.\n* Warehouse, store, and supplier locations are stored for map display purposes.\n\n**c) Images and files:**\n* Product, warehouse, and store images uploaded by users.\n* Photos captured from the camera or selected from the photo library for goods management purposes.\n\n**d) Device information:**\n* Device type, operating system, and device identifiers for notification delivery.\n* Application error information collected automatically to improve software quality.\n\n**e) Business data:**\n* Order information: creator, products, quantities, prices, status, and notes.\n* Supplier information: name, address, phone number, and product catalog.\n* Warehouse and store information: name, address, coordinates, and description.\n\n### 2. Purposes of Data Use\n\n* **Operations:** Manage warehouses, stores, orders, and connect deliveries to suitable staff.\n* **Tracking:** Display real-time delivery locations on the map to help ensure goods safety.\n* **Notifications:** Send push notifications about order status and system updates.\n* **Support:** Resolve disputes or complaints based on stored transaction data.\n* **Improvement:** Analyze errors and improve features based on usage behavior.\n\n### 3. Device Permissions\n\nThe application requests the following permissions on your device:\n\n| Permission | Purpose |\n|------------|---------|\n| Location (while in use) | Display location on the map, find the nearest supplier |\n| Location (background) | Continuously track delivery routes (delivery staff only) |\n| Camera | Take product photos, scan QR codes |\n| Photo library | Select product and warehouse images from the device |\n| Notifications | Receive order status and system update notifications |\n| Storage | Store local data to improve performance |\n\nYou may disable any permission in your phone\'s **Settings**. However, disabling some permissions may affect application functionality.\n\n### 4. Information Sharing\n\nWe commit to **not selling** personal data to third parties. Data is only shared in the following cases:\n* **Within the system:** Delivery staff can see order information (delivery address, products); owners can see delivery staff locations.\n* **Map service providers:** Map partners receive location data to display maps and calculate routes.\n* **Notification services:** Push notification service providers receive device identifiers to deliver notifications.\n* **Competent authorities:** When there is a written request under Vietnamese law.\n\n### 5. Your Rights (Under Decree 13/2023/ND-CP)\n\nYou have the right to:\n1. **Access and Edit:** Update personal information (name, phone number) at any time in the Account section.\n2. **Delete Data:** Request account deletion and removal of related data by contacting support.\n3. **Withdraw Permissions:** Disable access to location, camera, or notifications in phone settings.\n4. **Object to Processing:** Object to the processing of personal data in certain cases as provided by law.\n\n### 6. Storage and Security\n\n* Data is transmitted through secure encrypted protocols.\n* Sensitive data (passwords) is encrypted before storage.\n* Local data on the device is stored using encrypted databases.\n* The system uses secure connections for real-time delivery tracking.\n\n### 7. Data Retention Period\n\n* Account data: Stored until the user requests deletion.\n\n---\n*Last updated: March 05, 2026*'**
  String get privacyPolicyMarkdown;

  /// No description provided for @dangerZone.
  ///
  /// In en, this message translates to:
  /// **'DANGER ZONE'**
  String get dangerZone;

  /// No description provided for @deleteAccount.
  ///
  /// In en, this message translates to:
  /// **'Delete Account'**
  String get deleteAccount;

  /// No description provided for @deleteAccountConfirm.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete this account?'**
  String get deleteAccountConfirm;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logout;

  /// No description provided for @logoutConfirm.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to log out?'**
  String get logoutConfirm;

  /// No description provided for @employeeLogoutConfirm.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to log out of the employee account?'**
  String get employeeLogoutConfirm;

  /// No description provided for @appVersion.
  ///
  /// In en, this message translates to:
  /// **'APP VERSION'**
  String get appVersion;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @selectLanguage.
  ///
  /// In en, this message translates to:
  /// **'Select Language'**
  String get selectLanguage;

  /// No description provided for @employeeList.
  ///
  /// In en, this message translates to:
  /// **'Employee List'**
  String get employeeList;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @pickupPoints.
  ///
  /// In en, this message translates to:
  /// **'Import Goods'**
  String get pickupPoints;

  /// No description provided for @warehouses.
  ///
  /// In en, this message translates to:
  /// **'Warehouses'**
  String get warehouses;

  /// No description provided for @importGoods.
  ///
  /// In en, this message translates to:
  /// **'Import Goods'**
  String get importGoods;

  /// No description provided for @stores.
  ///
  /// In en, this message translates to:
  /// **'Stores'**
  String get stores;

  /// No description provided for @createPickupPoint.
  ///
  /// In en, this message translates to:
  /// **'Create Pickup Point'**
  String get createPickupPoint;

  /// No description provided for @createProduct.
  ///
  /// In en, this message translates to:
  /// **'Create Product'**
  String get createProduct;

  /// No description provided for @createWarehouse.
  ///
  /// In en, this message translates to:
  /// **'Create Warehouse'**
  String get createWarehouse;

  /// No description provided for @createStore.
  ///
  /// In en, this message translates to:
  /// **'Create Store'**
  String get createStore;

  /// No description provided for @appName.
  ///
  /// In en, this message translates to:
  /// **'Flutter Demo'**
  String get appName;

  /// No description provided for @findAddress.
  ///
  /// In en, this message translates to:
  /// **'Find Address'**
  String get findAddress;

  /// No description provided for @searchAddress.
  ///
  /// In en, this message translates to:
  /// **'Search address'**
  String get searchAddress;

  /// No description provided for @selectThisLocation.
  ///
  /// In en, this message translates to:
  /// **'Select this location'**
  String get selectThisLocation;

  /// No description provided for @orderFromWarehouse.
  ///
  /// In en, this message translates to:
  /// **'Order From Warehouse'**
  String get orderFromWarehouse;

  /// No description provided for @orderSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Order successfully'**
  String get orderSuccessfully;

  /// No description provided for @pleaseSelectProduct.
  ///
  /// In en, this message translates to:
  /// **'Please select product'**
  String get pleaseSelectProduct;

  /// No description provided for @pleaseSelectDeliveryPoint.
  ///
  /// In en, this message translates to:
  /// **'Please select delivery point'**
  String get pleaseSelectDeliveryPoint;

  /// No description provided for @placeOrder.
  ///
  /// In en, this message translates to:
  /// **'Place Order'**
  String get placeOrder;

  /// No description provided for @pending.
  ///
  /// In en, this message translates to:
  /// **'Pending'**
  String get pending;

  /// No description provided for @processing.
  ///
  /// In en, this message translates to:
  /// **'Processing'**
  String get processing;

  /// No description provided for @completed.
  ///
  /// In en, this message translates to:
  /// **'Completed'**
  String get completed;

  /// No description provided for @delivered.
  ///
  /// In en, this message translates to:
  /// **'Delivered'**
  String get delivered;

  /// No description provided for @cancelled.
  ///
  /// In en, this message translates to:
  /// **'Cancelled'**
  String get cancelled;

  /// No description provided for @failed.
  ///
  /// In en, this message translates to:
  /// **'Failed'**
  String get failed;

  /// No description provided for @deliveryPoint.
  ///
  /// In en, this message translates to:
  /// **'Delivery Point'**
  String get deliveryPoint;

  /// No description provided for @createdDate.
  ///
  /// In en, this message translates to:
  /// **'Created Date'**
  String get createdDate;

  /// No description provided for @notes.
  ///
  /// In en, this message translates to:
  /// **'Notes'**
  String get notes;

  /// No description provided for @note.
  ///
  /// In en, this message translates to:
  /// **'Note'**
  String get note;

  /// No description provided for @enterNote.
  ///
  /// In en, this message translates to:
  /// **'Enter note'**
  String get enterNote;

  /// No description provided for @customer.
  ///
  /// In en, this message translates to:
  /// **'Customer'**
  String get customer;

  /// No description provided for @location.
  ///
  /// In en, this message translates to:
  /// **'Location'**
  String get location;

  /// No description provided for @time.
  ///
  /// In en, this message translates to:
  /// **'Time'**
  String get time;

  /// No description provided for @confirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get confirm;

  /// No description provided for @sessionExpiredTitle.
  ///
  /// In en, this message translates to:
  /// **'Session expired'**
  String get sessionExpiredTitle;

  /// No description provided for @sessionExpiredMessage.
  ///
  /// In en, this message translates to:
  /// **'Your session has expired, please log in again'**
  String get sessionExpiredMessage;

  /// No description provided for @total.
  ///
  /// In en, this message translates to:
  /// **'Total'**
  String get total;

  /// No description provided for @totalAmount.
  ///
  /// In en, this message translates to:
  /// **'Total Amount'**
  String get totalAmount;

  /// No description provided for @noOrdersYet.
  ///
  /// In en, this message translates to:
  /// **'No orders yet'**
  String get noOrdersYet;

  /// No description provided for @noOrders.
  ///
  /// In en, this message translates to:
  /// **'No orders'**
  String get noOrders;

  /// No description provided for @turnOnLocation.
  ///
  /// In en, this message translates to:
  /// **'Location Access'**
  String get turnOnLocation;

  /// No description provided for @locationPermissionDescription.
  ///
  /// In en, this message translates to:
  /// **'We need location access to track your route and support the best delivery service.'**
  String get locationPermissionDescription;

  /// No description provided for @orderCompletedWithId.
  ///
  /// In en, this message translates to:
  /// **'Order {id} completed successfully'**
  String orderCompletedWithId(String id);

  /// No description provided for @confirmCancelOrderTitle.
  ///
  /// In en, this message translates to:
  /// **'Cancel Order'**
  String get confirmCancelOrderTitle;

  /// No description provided for @confirmCancelOrderMessage.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to cancel this order?'**
  String get confirmCancelOrderMessage;

  /// No description provided for @noProductsSelected.
  ///
  /// In en, this message translates to:
  /// **'No products selected'**
  String get noProductsSelected;

  /// No description provided for @selectProductsFromWarehouseToStart.
  ///
  /// In en, this message translates to:
  /// **'Select products from the warehouse to get started'**
  String get selectProductsFromWarehouseToStart;

  /// No description provided for @selectProductsFromSupplierToStart.
  ///
  /// In en, this message translates to:
  /// **'Select products from the supplier to get started'**
  String get selectProductsFromSupplierToStart;

  /// No description provided for @orderNumberTitle.
  ///
  /// In en, this message translates to:
  /// **'Order #{shortId}'**
  String orderNumberTitle(String shortId);

  /// No description provided for @deliveringOrders.
  ///
  /// In en, this message translates to:
  /// **'Pending Orders'**
  String get deliveringOrders;

  /// No description provided for @deliveredOrders.
  ///
  /// In en, this message translates to:
  /// **'Delivered Orders'**
  String get deliveredOrders;

  /// No description provided for @receivedOrders.
  ///
  /// In en, this message translates to:
  /// **'Received Orders'**
  String get receivedOrders;

  /// No description provided for @purchasedOrders.
  ///
  /// In en, this message translates to:
  /// **'Purchased Orders'**
  String get purchasedOrders;

  /// No description provided for @cancelledOrders.
  ///
  /// In en, this message translates to:
  /// **'Cancelled Orders'**
  String get cancelledOrders;

  /// No description provided for @completedOrders.
  ///
  /// In en, this message translates to:
  /// **'Completed Orders'**
  String get completedOrders;

  /// No description provided for @supplier.
  ///
  /// In en, this message translates to:
  /// **'Supplier'**
  String get supplier;

  /// No description provided for @noSuppliersYet.
  ///
  /// In en, this message translates to:
  /// **'No suppliers yet'**
  String get noSuppliersYet;

  /// No description provided for @addSupplierToStart.
  ///
  /// In en, this message translates to:
  /// **'Add a supplier to start getting products'**
  String get addSupplierToStart;

  /// No description provided for @noWarehousesYet.
  ///
  /// In en, this message translates to:
  /// **'No warehouses yet'**
  String get noWarehousesYet;

  /// No description provided for @addWarehouseToStart.
  ///
  /// In en, this message translates to:
  /// **'Setup a warehouse to start managing'**
  String get addWarehouseToStart;

  /// No description provided for @noStoresYet.
  ///
  /// In en, this message translates to:
  /// **'No stores yet'**
  String get noStoresYet;

  /// No description provided for @addStoreToStart.
  ///
  /// In en, this message translates to:
  /// **'Setup a store to start selling'**
  String get addStoreToStart;

  /// No description provided for @warehouse.
  ///
  /// In en, this message translates to:
  /// **'Warehouse'**
  String get warehouse;

  /// No description provided for @product.
  ///
  /// In en, this message translates to:
  /// **'Product'**
  String get product;

  /// No description provided for @quantity.
  ///
  /// In en, this message translates to:
  /// **'Quantity'**
  String get quantity;

  /// No description provided for @orderedQuantity.
  ///
  /// In en, this message translates to:
  /// **'Ordered: x{count}'**
  String orderedQuantity(int count);

  /// No description provided for @supplierCount.
  ///
  /// In en, this message translates to:
  /// **'{count} suppliers'**
  String supplierCount(int count);

  /// No description provided for @itemCount.
  ///
  /// In en, this message translates to:
  /// **'{count} items'**
  String itemCount(int count);

  /// No description provided for @quantityCount.
  ///
  /// In en, this message translates to:
  /// **'{count} quantity'**
  String quantityCount(int count);

  /// No description provided for @receivedQuantityLabel.
  ///
  /// In en, this message translates to:
  /// **'Received: {received}/{quantity}'**
  String receivedQuantityLabel(int received, int quantity);

  /// No description provided for @receivedEnough.
  ///
  /// In en, this message translates to:
  /// **'Đủ'**
  String get receivedEnough;

  /// No description provided for @receivedShort.
  ///
  /// In en, this message translates to:
  /// **'Thiếu'**
  String get receivedShort;

  /// No description provided for @continueDelivery.
  ///
  /// In en, this message translates to:
  /// **'Continue delivery'**
  String get continueDelivery;

  /// No description provided for @productsAndQuantitySummary.
  ///
  /// In en, this message translates to:
  /// **'{productCount} items • {totalQuantity} quantity'**
  String productsAndQuantitySummary(int productCount, int totalQuantity);

  /// No description provided for @totalProducts.
  ///
  /// In en, this message translates to:
  /// **'Total {totalQuantity} products'**
  String totalProducts(int totalQuantity);

  /// No description provided for @createOrder.
  ///
  /// In en, this message translates to:
  /// **'Create Order'**
  String get createOrder;

  /// No description provided for @createImportOrder.
  ///
  /// In en, this message translates to:
  /// **'Create Import Order'**
  String get createImportOrder;

  /// No description provided for @createTransferOrder.
  ///
  /// In en, this message translates to:
  /// **'Create Transfer Order'**
  String get createTransferOrder;

  /// No description provided for @createRequestOrder.
  ///
  /// In en, this message translates to:
  /// **'Create Request'**
  String get createRequestOrder;

  /// No description provided for @deliverTo.
  ///
  /// In en, this message translates to:
  /// **'Deliver to: '**
  String get deliverTo;

  /// No description provided for @price.
  ///
  /// In en, this message translates to:
  /// **'Price'**
  String get price;

  /// No description provided for @warehouseName.
  ///
  /// In en, this message translates to:
  /// **'Warehouse Name'**
  String get warehouseName;

  /// No description provided for @supplierName.
  ///
  /// In en, this message translates to:
  /// **'Supplier Name'**
  String get supplierName;

  /// No description provided for @productCode.
  ///
  /// In en, this message translates to:
  /// **'Product Code'**
  String get productCode;

  /// No description provided for @enterProductCode.
  ///
  /// In en, this message translates to:
  /// **'Enter product code'**
  String get enterProductCode;

  /// No description provided for @scanCode.
  ///
  /// In en, this message translates to:
  /// **'Scan code'**
  String get scanCode;

  /// No description provided for @warrantyPeriod.
  ///
  /// In en, this message translates to:
  /// **'Warranty Period'**
  String get warrantyPeriod;

  /// No description provided for @updateProductCode.
  ///
  /// In en, this message translates to:
  /// **'Update Product Code'**
  String get updateProductCode;

  /// No description provided for @updateSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Update successfully'**
  String get updateSuccessfully;

  /// No description provided for @months.
  ///
  /// In en, this message translates to:
  /// **'{value} months'**
  String months(String value);

  /// No description provided for @years.
  ///
  /// In en, this message translates to:
  /// **'{value} years'**
  String years(String value);

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @order.
  ///
  /// In en, this message translates to:
  /// **'Order'**
  String get order;

  /// No description provided for @storeInfo.
  ///
  /// In en, this message translates to:
  /// **'STORE INFORMATION'**
  String get storeInfo;

  /// No description provided for @guide.
  ///
  /// In en, this message translates to:
  /// **'Guide'**
  String get guide;

  /// No description provided for @setupNewStore.
  ///
  /// In en, this message translates to:
  /// **'Setup New Store'**
  String get setupNewStore;

  /// No description provided for @close.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get close;

  /// No description provided for @exampleStoreName.
  ///
  /// In en, this message translates to:
  /// **'E.g: Store District 1'**
  String get exampleStoreName;

  /// No description provided for @description.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get description;

  /// No description provided for @additionalInfo.
  ///
  /// In en, this message translates to:
  /// **'Additional info...'**
  String get additionalInfo;

  /// No description provided for @saveStore.
  ///
  /// In en, this message translates to:
  /// **'Save Store'**
  String get saveStore;

  /// No description provided for @supplierInfo.
  ///
  /// In en, this message translates to:
  /// **'SUPPLIER INFORMATION'**
  String get supplierInfo;

  /// No description provided for @setupNewSupplier.
  ///
  /// In en, this message translates to:
  /// **'Setup New Supplier'**
  String get setupNewSupplier;

  /// No description provided for @exampleSupplierName.
  ///
  /// In en, this message translates to:
  /// **'E.g: Thanh Cong Agency'**
  String get exampleSupplierName;

  /// No description provided for @phoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Phone Number'**
  String get phoneNumber;

  /// No description provided for @examplePhoneNumber.
  ///
  /// In en, this message translates to:
  /// **'0123 456 789'**
  String get examplePhoneNumber;

  /// No description provided for @addressHint.
  ///
  /// In en, this message translates to:
  /// **'House number, street, district...'**
  String get addressHint;

  /// No description provided for @saveSupplier.
  ///
  /// In en, this message translates to:
  /// **'Save Supplier'**
  String get saveSupplier;

  /// No description provided for @pleaseSelectAddressBeforeSaving.
  ///
  /// In en, this message translates to:
  /// **'Please select an address before saving'**
  String get pleaseSelectAddressBeforeSaving;

  /// No description provided for @pleaseEnterSupplierName.
  ///
  /// In en, this message translates to:
  /// **'Please enter the supplier name'**
  String get pleaseEnterSupplierName;

  /// No description provided for @warehouseInfo.
  ///
  /// In en, this message translates to:
  /// **'WAREHOUSE INFORMATION'**
  String get warehouseInfo;

  /// No description provided for @setupNewWarehouse.
  ///
  /// In en, this message translates to:
  /// **'Setup New Warehouse'**
  String get setupNewWarehouse;

  /// No description provided for @createSupplierShowcaseDescription.
  ///
  /// In en, this message translates to:
  /// **'Tap here to create your first warehouse and start managing suppliers and products.'**
  String get createSupplierShowcaseDescription;

  /// No description provided for @exampleWarehouseName.
  ///
  /// In en, this message translates to:
  /// **'E.g: Warehouse A'**
  String get exampleWarehouseName;

  /// No description provided for @saveWarehouse.
  ///
  /// In en, this message translates to:
  /// **'Save Warehouse'**
  String get saveWarehouse;

  /// No description provided for @productInfo.
  ///
  /// In en, this message translates to:
  /// **'PRODUCT INFORMATION'**
  String get productInfo;

  /// No description provided for @addProduct.
  ///
  /// In en, this message translates to:
  /// **'Add Product'**
  String get addProduct;

  /// No description provided for @productName.
  ///
  /// In en, this message translates to:
  /// **'Product Name'**
  String get productName;

  /// No description provided for @enterProductName.
  ///
  /// In en, this message translates to:
  /// **'Enter product name'**
  String get enterProductName;

  /// No description provided for @enterPrice.
  ///
  /// In en, this message translates to:
  /// **'Enter price'**
  String get enterPrice;

  /// No description provided for @saveProduct.
  ///
  /// In en, this message translates to:
  /// **'Save Product'**
  String get saveProduct;

  /// No description provided for @editProduct.
  ///
  /// In en, this message translates to:
  /// **'Edit Product'**
  String get editProduct;

  /// No description provided for @deleteProduct.
  ///
  /// In en, this message translates to:
  /// **'Delete Product'**
  String get deleteProduct;

  /// No description provided for @warrantyProduct.
  ///
  /// In en, this message translates to:
  /// **'Warranty Product'**
  String get warrantyProduct;

  /// No description provided for @createNewEmployee.
  ///
  /// In en, this message translates to:
  /// **'Create New Employee'**
  String get createNewEmployee;

  /// No description provided for @employeeName.
  ///
  /// In en, this message translates to:
  /// **'Employee Name'**
  String get employeeName;

  /// No description provided for @enterEmployeeName.
  ///
  /// In en, this message translates to:
  /// **'Enter employee name'**
  String get enterEmployeeName;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @enterPassword.
  ///
  /// In en, this message translates to:
  /// **'Enter password'**
  String get enterPassword;

  /// No description provided for @role.
  ///
  /// In en, this message translates to:
  /// **'Role'**
  String get role;

  /// No description provided for @inventoryManagement.
  ///
  /// In en, this message translates to:
  /// **'Inventory Management'**
  String get inventoryManagement;

  /// No description provided for @delivery.
  ///
  /// In en, this message translates to:
  /// **'Delivery'**
  String get delivery;

  /// No description provided for @sales.
  ///
  /// In en, this message translates to:
  /// **'Sales'**
  String get sales;

  /// No description provided for @deliveryVehicle.
  ///
  /// In en, this message translates to:
  /// **'Delivery Vehicle'**
  String get deliveryVehicle;

  /// No description provided for @motorcycle.
  ///
  /// In en, this message translates to:
  /// **'Motorcycle'**
  String get motorcycle;

  /// No description provided for @truck.
  ///
  /// In en, this message translates to:
  /// **'Truck'**
  String get truck;

  /// No description provided for @create.
  ///
  /// In en, this message translates to:
  /// **'Create'**
  String get create;

  /// No description provided for @chatPage.
  ///
  /// In en, this message translates to:
  /// **'Chat Page'**
  String get chatPage;

  /// No description provided for @chatFunctionality.
  ///
  /// In en, this message translates to:
  /// **'Chat functionality will be here'**
  String get chatFunctionality;

  /// No description provided for @profile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings (Map Removed)'**
  String get settings;

  /// No description provided for @store.
  ///
  /// In en, this message translates to:
  /// **'Store'**
  String get store;

  /// No description provided for @enableGps.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get enableGps;

  /// No description provided for @trackingInfoUpdated.
  ///
  /// In en, this message translates to:
  /// **'Tracking info updated: {data}'**
  String trackingInfoUpdated(String data);

  /// No description provided for @reject.
  ///
  /// In en, this message translates to:
  /// **'Reject'**
  String get reject;

  /// No description provided for @acceptOrder.
  ///
  /// In en, this message translates to:
  /// **'Accept Order'**
  String get acceptOrder;

  /// No description provided for @declineOrder.
  ///
  /// In en, this message translates to:
  /// **'Decline Order'**
  String get declineOrder;

  /// No description provided for @detailsTitle.
  ///
  /// In en, this message translates to:
  /// **'Details {index}'**
  String detailsTitle(String index);

  /// No description provided for @orderInformation.
  ///
  /// In en, this message translates to:
  /// **'Order Information'**
  String get orderInformation;

  /// No description provided for @detailedViewForOrder.
  ///
  /// In en, this message translates to:
  /// **'Detailed view for order #{index}'**
  String detailedViewForOrder(String index);

  /// No description provided for @demoCustomerName.
  ///
  /// In en, this message translates to:
  /// **'Nguyen Van A'**
  String get demoCustomerName;

  /// No description provided for @demoOrderLocation.
  ///
  /// In en, this message translates to:
  /// **'123 Main Street, District 1, HCMC'**
  String get demoOrderLocation;

  /// No description provided for @demoOrderTime.
  ///
  /// In en, this message translates to:
  /// **'10:30 AM - Today'**
  String get demoOrderTime;

  /// No description provided for @demoOrderNotes.
  ///
  /// In en, this message translates to:
  /// **'Customer requested careful delivery and a call before arrival.'**
  String get demoOrderNotes;

  /// No description provided for @settingsMapRemovedDescription.
  ///
  /// In en, this message translates to:
  /// **'Map functionality has been removed from settings. Please refactor to MapLibre.'**
  String get settingsMapRemovedDescription;

  /// No description provided for @noProducts.
  ///
  /// In en, this message translates to:
  /// **'No products'**
  String get noProducts;

  /// No description provided for @addProductsToCategory.
  ///
  /// In en, this message translates to:
  /// **'Add products to this category.'**
  String get addProductsToCategory;

  /// No description provided for @completeOrder.
  ///
  /// In en, this message translates to:
  /// **'Complete Order'**
  String get completeOrder;

  /// No description provided for @receiveOrder.
  ///
  /// In en, this message translates to:
  /// **'Receive Order'**
  String get receiveOrder;

  /// No description provided for @pickupCompleted.
  ///
  /// In en, this message translates to:
  /// **'Pickup Completed'**
  String get pickupCompleted;

  /// No description provided for @refreshList.
  ///
  /// In en, this message translates to:
  /// **'Refresh List'**
  String get refreshList;

  /// No description provided for @enableGPS.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get enableGPS;

  /// No description provided for @start.
  ///
  /// In en, this message translates to:
  /// **'Start'**
  String get start;

  /// No description provided for @back.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get back;

  /// No description provided for @scanQRReceiveNotification.
  ///
  /// In en, this message translates to:
  /// **'Scan QR, receive notifications\nand start now'**
  String get scanQRReceiveNotification;

  /// No description provided for @manageWarehouseStore.
  ///
  /// In en, this message translates to:
  /// **'Manage warehouse, store\nand supplier'**
  String get manageWarehouseStore;

  /// No description provided for @createOrderTrackShipment.
  ///
  /// In en, this message translates to:
  /// **'Create order and track shipment\nin real time'**
  String get createOrderTrackShipment;

  /// No description provided for @sstripPlatform.
  ///
  /// In en, this message translates to:
  /// **'SStrip - supply chain\noperating platform'**
  String get sstripPlatform;

  /// No description provided for @search.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get search;

  /// No description provided for @anErrorOccurred.
  ///
  /// In en, this message translates to:
  /// **'An error occurred'**
  String get anErrorOccurred;

  /// No description provided for @error.
  ///
  /// In en, this message translates to:
  /// **'Error: {message}'**
  String error(String message);

  /// No description provided for @noName.
  ///
  /// In en, this message translates to:
  /// **'No name'**
  String get noName;

  /// No description provided for @noPhoneNumber.
  ///
  /// In en, this message translates to:
  /// **'No phone number'**
  String get noPhoneNumber;

  /// No description provided for @noEmployees.
  ///
  /// In en, this message translates to:
  /// **'No employees'**
  String get noEmployees;

  /// No description provided for @pressButtonToAddEmployee.
  ///
  /// In en, this message translates to:
  /// **'Press button below to add new employee'**
  String get pressButtonToAddEmployee;

  /// No description provided for @loading.
  ///
  /// In en, this message translates to:
  /// **'Loading...'**
  String get loading;

  /// No description provided for @storeList.
  ///
  /// In en, this message translates to:
  /// **'Store List'**
  String get storeList;

  /// No description provided for @productsAtCounter.
  ///
  /// In en, this message translates to:
  /// **'Products at the counter'**
  String get productsAtCounter;

  /// No description provided for @salesHistory.
  ///
  /// In en, this message translates to:
  /// **'Sales history'**
  String get salesHistory;

  /// No description provided for @windbreakerJacket.
  ///
  /// In en, this message translates to:
  /// **'Windbreaker Jacket'**
  String get windbreakerJacket;

  /// No description provided for @sportSneakers.
  ///
  /// In en, this message translates to:
  /// **'Sport Sneakers'**
  String get sportSneakers;

  /// No description provided for @meshCap.
  ///
  /// In en, this message translates to:
  /// **'Mesh Cap'**
  String get meshCap;

  /// No description provided for @khakiPants.
  ///
  /// In en, this message translates to:
  /// **'Khaki Pants'**
  String get khakiPants;

  /// No description provided for @completeProductInfoInOneGo.
  ///
  /// In en, this message translates to:
  /// **'Select a supplier and complete each product\'s information to keep the catalog neatly updated in one go.'**
  String get completeProductInfoInOneGo;

  /// No description provided for @locked.
  ///
  /// In en, this message translates to:
  /// **'Locked'**
  String get locked;

  /// No description provided for @changeSupplier.
  ///
  /// In en, this message translates to:
  /// **'Change supplier'**
  String get changeSupplier;

  /// No description provided for @selectSupplier.
  ///
  /// In en, this message translates to:
  /// **'Select supplier'**
  String get selectSupplier;

  /// No description provided for @tapToChooseSupplierBeforeAddingProducts.
  ///
  /// In en, this message translates to:
  /// **'Tap to choose a supplier before adding products.'**
  String get tapToChooseSupplierBeforeAddingProducts;

  /// No description provided for @productNumber.
  ///
  /// In en, this message translates to:
  /// **'Product {number}'**
  String productNumber(int number);

  /// No description provided for @newestItem.
  ///
  /// In en, this message translates to:
  /// **'Newest item'**
  String get newestItem;

  /// No description provided for @uploadImage.
  ///
  /// In en, this message translates to:
  /// **'UPLOAD IMAGE'**
  String get uploadImage;

  /// No description provided for @changeImage.
  ///
  /// In en, this message translates to:
  /// **'Change image'**
  String get changeImage;

  /// No description provided for @pleaseSelectSupplierBeforeSaving.
  ///
  /// In en, this message translates to:
  /// **'Please select a supplier before saving.'**
  String get pleaseSelectSupplierBeforeSaving;

  /// No description provided for @pleaseSelectImagesBeforeSaving.
  ///
  /// In en, this message translates to:
  /// **'Please select images for all products before saving.'**
  String get pleaseSelectImagesBeforeSaving;

  /// No description provided for @productType.
  ///
  /// In en, this message translates to:
  /// **'Product type'**
  String get productType;

  /// No description provided for @selectType.
  ///
  /// In en, this message translates to:
  /// **'-- Select type --'**
  String get selectType;

  /// No description provided for @vnd.
  ///
  /// In en, this message translates to:
  /// **'VND'**
  String get vnd;

  /// No description provided for @materialPieceType.
  ///
  /// In en, this message translates to:
  /// **'Material (piece)'**
  String get materialPieceType;

  /// No description provided for @materialKilogramType.
  ///
  /// In en, this message translates to:
  /// **'Material (kg)'**
  String get materialKilogramType;

  /// No description provided for @materialBoxType.
  ///
  /// In en, this message translates to:
  /// **'Material (box)'**
  String get materialBoxType;

  /// No description provided for @pieceUnit.
  ///
  /// In en, this message translates to:
  /// **'piece'**
  String get pieceUnit;

  /// No description provided for @kilogramUnit.
  ///
  /// In en, this message translates to:
  /// **'kg'**
  String get kilogramUnit;

  /// No description provided for @boxUnit.
  ///
  /// In en, this message translates to:
  /// **'box'**
  String get boxUnit;

  /// No description provided for @active.
  ///
  /// In en, this message translates to:
  /// **'Active'**
  String get active;

  /// No description provided for @noData.
  ///
  /// In en, this message translates to:
  /// **'No data available'**
  String get noData;

  /// No description provided for @chat.
  ///
  /// In en, this message translates to:
  /// **'Chat'**
  String get chat;

  /// No description provided for @chatFunctionalityComingSoon.
  ///
  /// In en, this message translates to:
  /// **'Chat functionality will be here'**
  String get chatFunctionalityComingSoon;

  /// No description provided for @owner.
  ///
  /// In en, this message translates to:
  /// **'Store owner'**
  String get owner;

  /// No description provided for @employee.
  ///
  /// In en, this message translates to:
  /// **'Employee'**
  String get employee;

  /// No description provided for @welcomeBack.
  ///
  /// In en, this message translates to:
  /// **'Welcome back'**
  String get welcomeBack;

  /// No description provided for @loginToContinueManagingStore.
  ///
  /// In en, this message translates to:
  /// **'Log in to continue managing your store'**
  String get loginToContinueManagingStore;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @enterEmail.
  ///
  /// In en, this message translates to:
  /// **'Enter email address'**
  String get enterEmail;

  /// No description provided for @enterPhone.
  ///
  /// In en, this message translates to:
  /// **'Enter phone number'**
  String get enterPhone;

  /// No description provided for @loginFailed.
  ///
  /// In en, this message translates to:
  /// **'Login failed'**
  String get loginFailed;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Log in'**
  String get login;

  /// No description provided for @dontHaveAccountRegisterNow.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account? Create one free'**
  String get dontHaveAccountRegisterNow;

  /// No description provided for @createAccount.
  ///
  /// In en, this message translates to:
  /// **'Create free account'**
  String get createAccount;

  /// No description provided for @registerToStartManagingStore.
  ///
  /// In en, this message translates to:
  /// **'Create a free SStrip account to get started'**
  String get registerToStartManagingStore;

  /// No description provided for @userName.
  ///
  /// In en, this message translates to:
  /// **'Username'**
  String get userName;

  /// No description provided for @enterName.
  ///
  /// In en, this message translates to:
  /// **'Enter your name'**
  String get enterName;

  /// No description provided for @confirmPassword.
  ///
  /// In en, this message translates to:
  /// **'Confirm password'**
  String get confirmPassword;

  /// No description provided for @enterConfirmPassword.
  ///
  /// In en, this message translates to:
  /// **'Re-enter password'**
  String get enterConfirmPassword;

  /// No description provided for @passwordsMatch.
  ///
  /// In en, this message translates to:
  /// **'Passwords match'**
  String get passwordsMatch;

  /// No description provided for @passwordsDoNotMatch.
  ///
  /// In en, this message translates to:
  /// **'Passwords do not match'**
  String get passwordsDoNotMatch;

  /// No description provided for @registerFailed.
  ///
  /// In en, this message translates to:
  /// **'Registration failed'**
  String get registerFailed;

  /// No description provided for @register.
  ///
  /// In en, this message translates to:
  /// **'Register'**
  String get register;

  /// No description provided for @alreadyHaveAccountLogin.
  ///
  /// In en, this message translates to:
  /// **'Already have an account? Log in'**
  String get alreadyHaveAccountLogin;

  /// No description provided for @onboardingOverviewTitle.
  ///
  /// In en, this message translates to:
  /// **'SStrip - supply chain\noperations platform'**
  String get onboardingOverviewTitle;

  /// No description provided for @onboardingOverviewDescription.
  ///
  /// In en, this message translates to:
  /// **'Manage warehousing, goods movement, and your distribution network centrally in a single application.'**
  String get onboardingOverviewDescription;

  /// No description provided for @onboardingOverviewHeadline.
  ///
  /// In en, this message translates to:
  /// **'One screen - multiple workflows'**
  String get onboardingOverviewHeadline;

  /// No description provided for @onboardingOverviewHighlight1.
  ///
  /// In en, this message translates to:
  /// **'Supply chain'**
  String get onboardingOverviewHighlight1;

  /// No description provided for @onboardingOverviewHighlight2.
  ///
  /// In en, this message translates to:
  /// **'Goods transportation'**
  String get onboardingOverviewHighlight2;

  /// No description provided for @onboardingOverviewHighlight3.
  ///
  /// In en, this message translates to:
  /// **'Centralized data'**
  String get onboardingOverviewHighlight3;

  /// No description provided for @onboardingOverviewStat1.
  ///
  /// In en, this message translates to:
  /// **'Warehouse'**
  String get onboardingOverviewStat1;

  /// No description provided for @onboardingOverviewStat2.
  ///
  /// In en, this message translates to:
  /// **'Store'**
  String get onboardingOverviewStat2;

  /// No description provided for @onboardingOverviewStat3.
  ///
  /// In en, this message translates to:
  /// **'Supplier'**
  String get onboardingOverviewStat3;

  /// No description provided for @onboardingLocationsTitle.
  ///
  /// In en, this message translates to:
  /// **'Manage warehouses, stores,\nand suppliers'**
  String get onboardingLocationsTitle;

  /// No description provided for @onboardingLocationsDescription.
  ///
  /// In en, this message translates to:
  /// **'Set up and monitor key operating locations to control inventory, supply sources, and the distribution network more accurately.'**
  String get onboardingLocationsDescription;

  /// No description provided for @onboardingLocationsHeadline.
  ///
  /// In en, this message translates to:
  /// **'A clear point-of-sale ecosystem'**
  String get onboardingLocationsHeadline;

  /// No description provided for @onboardingLocationsHighlight1.
  ///
  /// In en, this message translates to:
  /// **'Warehouse'**
  String get onboardingLocationsHighlight1;

  /// No description provided for @onboardingLocationsHighlight2.
  ///
  /// In en, this message translates to:
  /// **'Store'**
  String get onboardingLocationsHighlight2;

  /// No description provided for @onboardingLocationsHighlight3.
  ///
  /// In en, this message translates to:
  /// **'Supplier'**
  String get onboardingLocationsHighlight3;

  /// No description provided for @onboardingLocationsStat1.
  ///
  /// In en, this message translates to:
  /// **'Track locations'**
  String get onboardingLocationsStat1;

  /// No description provided for @onboardingLocationsStat2.
  ///
  /// In en, this message translates to:
  /// **'Sync information'**
  String get onboardingLocationsStat2;

  /// No description provided for @onboardingLocationsStat3.
  ///
  /// In en, this message translates to:
  /// **'Scale the system'**
  String get onboardingLocationsStat3;

  /// No description provided for @onboardingDeliveryTitle.
  ///
  /// In en, this message translates to:
  /// **'Create orders and track\ndeliveries in real time'**
  String get onboardingDeliveryTitle;

  /// No description provided for @onboardingDeliveryDescription.
  ///
  /// In en, this message translates to:
  /// **'Create shipping orders quickly, monitor delivery routes on the map, and update statuses instantly throughout the journey.'**
  String get onboardingDeliveryDescription;

  /// No description provided for @onboardingDeliveryHeadline.
  ///
  /// In en, this message translates to:
  /// **'Transparent logistics in real time'**
  String get onboardingDeliveryHeadline;

  /// No description provided for @onboardingDeliveryHighlight1.
  ///
  /// In en, this message translates to:
  /// **'Quick order creation'**
  String get onboardingDeliveryHighlight1;

  /// No description provided for @onboardingDeliveryHighlight2.
  ///
  /// In en, this message translates to:
  /// **'Route tracking'**
  String get onboardingDeliveryHighlight2;

  /// No description provided for @onboardingDeliveryHighlight3.
  ///
  /// In en, this message translates to:
  /// **'Status updates'**
  String get onboardingDeliveryHighlight3;

  /// No description provided for @onboardingDeliveryStat1.
  ///
  /// In en, this message translates to:
  /// **'Visual map'**
  String get onboardingDeliveryStat1;

  /// No description provided for @onboardingDeliveryStat2.
  ///
  /// In en, this message translates to:
  /// **'Delivery progress'**
  String get onboardingDeliveryStat2;

  /// No description provided for @onboardingDeliveryStat3.
  ///
  /// In en, this message translates to:
  /// **'Proactive handling'**
  String get onboardingDeliveryStat3;

  /// No description provided for @onboardingReadyTitle.
  ///
  /// In en, this message translates to:
  /// **'Connect & '**
  String get onboardingReadyTitle;

  /// No description provided for @onboardingReadyDescription.
  ///
  /// In en, this message translates to:
  /// **'Look up products and orders by QR code and receive push notifications to always stay updated on the latest operations.'**
  String get onboardingReadyDescription;

  /// No description provided for @onboardingReadyHeadline.
  ///
  /// In en, this message translates to:
  /// **'Ready to enter the app'**
  String get onboardingReadyHeadline;

  /// No description provided for @onboardingReadyHighlight1.
  ///
  /// In en, this message translates to:
  /// **'QR scanning'**
  String get onboardingReadyHighlight1;

  /// No description provided for @onboardingReadyHighlight2.
  ///
  /// In en, this message translates to:
  /// **'Order lookup'**
  String get onboardingReadyHighlight2;

  /// No description provided for @onboardingReadyHighlight3.
  ///
  /// In en, this message translates to:
  /// **'Push notifications'**
  String get onboardingReadyHighlight3;

  /// No description provided for @onboardingReadyStat1.
  ///
  /// In en, this message translates to:
  /// **'Accurate'**
  String get onboardingReadyStat1;

  /// No description provided for @onboardingReadyStat2.
  ///
  /// In en, this message translates to:
  /// **'Fast'**
  String get onboardingReadyStat2;

  /// No description provided for @onboardingReadyStat3.
  ///
  /// In en, this message translates to:
  /// **'Always up to date'**
  String get onboardingReadyStat3;

  /// No description provided for @purchaseCompleted.
  ///
  /// In en, this message translates to:
  /// **'Purchase Completed'**
  String get purchaseCompleted;

  /// No description provided for @deliverToWarehouse.
  ///
  /// In en, this message translates to:
  /// **'Deliver to Warehouse'**
  String get deliverToWarehouse;

  /// No description provided for @startDelivery.
  ///
  /// In en, this message translates to:
  /// **'Start delivery'**
  String get startDelivery;

  /// No description provided for @complete.
  ///
  /// In en, this message translates to:
  /// **'Complete'**
  String get complete;

  /// No description provided for @isEnd.
  ///
  /// In en, this message translates to:
  /// **'End of list'**
  String get isEnd;

  /// No description provided for @shippingTab.
  ///
  /// In en, this message translates to:
  /// **'Shipping'**
  String get shippingTab;

  /// No description provided for @switchWarehouseTab.
  ///
  /// In en, this message translates to:
  /// **'Switch Warehouse'**
  String get switchWarehouseTab;

  /// No description provided for @requestTab.
  ///
  /// In en, this message translates to:
  /// **'Request'**
  String get requestTab;

  /// No description provided for @pleaseEnterWarehouseName.
  ///
  /// In en, this message translates to:
  /// **'Please enter the warehouse name'**
  String get pleaseEnterWarehouseName;

  /// No description provided for @transferToWarehouse.
  ///
  /// In en, this message translates to:
  /// **'Transfer to warehouse'**
  String get transferToWarehouse;

  /// No description provided for @nearlyOutOfStock.
  ///
  /// In en, this message translates to:
  /// **'Nearly out of stock'**
  String get nearlyOutOfStock;

  /// No description provided for @updateMinimumQuantity.
  ///
  /// In en, this message translates to:
  /// **'Update minimum quantity'**
  String get updateMinimumQuantity;

  /// No description provided for @minimumQuantity.
  ///
  /// In en, this message translates to:
  /// **'Minimum quantity'**
  String get minimumQuantity;

  /// No description provided for @enterMinimumQuantity.
  ///
  /// In en, this message translates to:
  /// **'Enter minimum quantity'**
  String get enterMinimumQuantity;

  /// No description provided for @pleaseEnterValidMinimumQuantity.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid minimum quantity'**
  String get pleaseEnterValidMinimumQuantity;

  /// No description provided for @minCount.
  ///
  /// In en, this message translates to:
  /// **'Min: {count}'**
  String minCount(String count);

  /// No description provided for @onboardingSstripTag.
  ///
  /// In en, this message translates to:
  /// **'SSTRIP'**
  String get onboardingSstripTag;

  /// No description provided for @onboardingSstripTitle.
  ///
  /// In en, this message translates to:
  /// **'Smart Logistics '**
  String get onboardingSstripTitle;

  /// No description provided for @onboardingSstripTitleEm.
  ///
  /// In en, this message translates to:
  /// **'Simplifying Supply Chain'**
  String get onboardingSstripTitleEm;

  /// No description provided for @onboardingSstripDesc.
  ///
  /// In en, this message translates to:
  /// **'Connect warehouses, suppliers, and drivers on a single platform.'**
  String get onboardingSstripDesc;

  /// No description provided for @onboardingFeatureTag.
  ///
  /// In en, this message translates to:
  /// **'FEATURES'**
  String get onboardingFeatureTag;

  /// No description provided for @onboardingFeatureTitle.
  ///
  /// In en, this message translates to:
  /// **'Next Generation '**
  String get onboardingFeatureTitle;

  /// No description provided for @onboardingFeatureTitleEm.
  ///
  /// In en, this message translates to:
  /// **'Management'**
  String get onboardingFeatureTitleEm;

  /// No description provided for @onboardingFeatureDesc.
  ///
  /// In en, this message translates to:
  /// **'Powerful tools to optimize your daily logistics operations.'**
  String get onboardingFeatureDesc;

  /// No description provided for @onboardingStartTag.
  ///
  /// In en, this message translates to:
  /// **'GET STARTED'**
  String get onboardingStartTag;

  /// No description provided for @onboardingStartTitle.
  ///
  /// In en, this message translates to:
  /// **'Setup in '**
  String get onboardingStartTitle;

  /// No description provided for @onboardingStartTitleEm.
  ///
  /// In en, this message translates to:
  /// **'minutes'**
  String get onboardingStartTitleEm;

  /// No description provided for @onboardingStartDesc.
  ///
  /// In en, this message translates to:
  /// **'Setup your logistics system quickly and easily.'**
  String get onboardingStartDesc;

  /// No description provided for @onboardingReadyTag.
  ///
  /// In en, this message translates to:
  /// **'READY'**
  String get onboardingReadyTag;

  /// No description provided for @onboardingReadyTitleEm.
  ///
  /// In en, this message translates to:
  /// **'Get Started Today'**
  String get onboardingReadyTitleEm;

  /// No description provided for @onboardingReadyDesc.
  ///
  /// In en, this message translates to:
  /// **'Start managing products and orders with SStrip.'**
  String get onboardingReadyDesc;

  /// No description provided for @onboardingWelcome.
  ///
  /// In en, this message translates to:
  /// **'🎉 Welcome to SStrip!'**
  String get onboardingWelcome;

  /// No description provided for @onboardingSkip.
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get onboardingSkip;

  /// No description provided for @onboardingStartNow.
  ///
  /// In en, this message translates to:
  /// **'Start Now'**
  String get onboardingStartNow;

  /// No description provided for @onboardingNext.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get onboardingNext;

  /// No description provided for @onboardingFeatOrderTitle.
  ///
  /// In en, this message translates to:
  /// **'Order Management'**
  String get onboardingFeatOrderTitle;

  /// No description provided for @onboardingFeatOrderDesc.
  ///
  /// In en, this message translates to:
  /// **'Create & track from warehouse to receiver'**
  String get onboardingFeatOrderDesc;

  /// No description provided for @onboardingFeatMapTitle.
  ///
  /// In en, this message translates to:
  /// **'Map Tracking'**
  String get onboardingFeatMapTitle;

  /// No description provided for @onboardingFeatMapDesc.
  ///
  /// In en, this message translates to:
  /// **'Real-time driver location and route'**
  String get onboardingFeatMapDesc;

  /// No description provided for @onboardingFeatReportTitle.
  ///
  /// In en, this message translates to:
  /// **'Warehouse Reports'**
  String get onboardingFeatReportTitle;

  /// No description provided for @onboardingFeatReportDesc.
  ///
  /// In en, this message translates to:
  /// **'Inventory statistics and history'**
  String get onboardingFeatReportDesc;

  /// No description provided for @onboardingStep1Title.
  ///
  /// In en, this message translates to:
  /// **'Create Free Account'**
  String get onboardingStep1Title;

  /// No description provided for @onboardingStep1Desc.
  ///
  /// In en, this message translates to:
  /// **'Sign up in seconds and start using SStrip'**
  String get onboardingStep1Desc;

  /// No description provided for @onboardingStep2Title.
  ///
  /// In en, this message translates to:
  /// **'Setup Warehouse & Products'**
  String get onboardingStep2Title;

  /// No description provided for @onboardingStep2Desc.
  ///
  /// In en, this message translates to:
  /// **'Add warehouses, suppliers, and categories'**
  String get onboardingStep2Desc;

  /// No description provided for @onboardingStep3Title.
  ///
  /// In en, this message translates to:
  /// **'Create & Assign'**
  String get onboardingStep3Title;

  /// No description provided for @onboardingStep3Desc.
  ///
  /// In en, this message translates to:
  /// **'Automated order creation and assignment'**
  String get onboardingStep3Desc;

  /// No description provided for @onboardingStep4Title.
  ///
  /// In en, this message translates to:
  /// **'Track & Confirm'**
  String get onboardingStep4Title;

  /// No description provided for @onboardingStep4Desc.
  ///
  /// In en, this message translates to:
  /// **'Real-time tracking and delivery confirmation'**
  String get onboardingStep4Desc;

  /// No description provided for @onboardingOwner.
  ///
  /// In en, this message translates to:
  /// **'Owner'**
  String get onboardingOwner;

  /// No description provided for @onboardingDriver.
  ///
  /// In en, this message translates to:
  /// **'Driver'**
  String get onboardingDriver;

  /// No description provided for @onboardingWarehouse.
  ///
  /// In en, this message translates to:
  /// **'Warehouse'**
  String get onboardingWarehouse;

  /// No description provided for @onboardingBubbleOwner.
  ///
  /// In en, this message translates to:
  /// **'Sender'**
  String get onboardingBubbleOwner;

  /// No description provided for @onboardingBubbleDriver.
  ///
  /// In en, this message translates to:
  /// **'Driver'**
  String get onboardingBubbleDriver;

  /// No description provided for @onboardingBubbleWarehouse.
  ///
  /// In en, this message translates to:
  /// **'Warehouse'**
  String get onboardingBubbleWarehouse;

  /// No description provided for @onboardingBubbleSupply.
  ///
  /// In en, this message translates to:
  /// **'Supplier'**
  String get onboardingBubbleSupply;

  /// No description provided for @interfaceTitle.
  ///
  /// In en, this message translates to:
  /// **'INTERFACE'**
  String get interfaceTitle;

  /// No description provided for @themeTitle.
  ///
  /// In en, this message translates to:
  /// **'Theme'**
  String get themeTitle;

  /// No description provided for @themeAuto.
  ///
  /// In en, this message translates to:
  /// **'System'**
  String get themeAuto;

  /// No description provided for @themeLight.
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get themeLight;

  /// No description provided for @themeDark.
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get themeDark;

  /// No description provided for @selectTheme.
  ///
  /// In en, this message translates to:
  /// **'Select Theme'**
  String get selectTheme;

  /// No description provided for @paymentSection.
  ///
  /// In en, this message translates to:
  /// **'PAYMENT'**
  String get paymentSection;

  /// No description provided for @currencyTitle.
  ///
  /// In en, this message translates to:
  /// **'Currency'**
  String get currencyTitle;

  /// No description provided for @cash.
  ///
  /// In en, this message translates to:
  /// **'Cash'**
  String get cash;

  /// No description provided for @bankTransfer.
  ///
  /// In en, this message translates to:
  /// **'Bank transfer'**
  String get bankTransfer;

  /// No description provided for @nodeColor.
  ///
  /// In en, this message translates to:
  /// **'Node Color'**
  String get nodeColor;

  /// No description provided for @selectNodeColor.
  ///
  /// In en, this message translates to:
  /// **'Select Color'**
  String get selectNodeColor;

  /// No description provided for @orderUpdateCompletedSuccess.
  ///
  /// In en, this message translates to:
  /// **'Order completed successfully'**
  String get orderUpdateCompletedSuccess;

  /// No description provided for @orderUpdateCancelledSuccess.
  ///
  /// In en, this message translates to:
  /// **'Order cancelled successfully'**
  String get orderUpdateCancelledSuccess;

  /// No description provided for @priceNotUpdated.
  ///
  /// In en, this message translates to:
  /// **'Price not updated'**
  String get priceNotUpdated;

  /// No description provided for @invalidPriceTitle.
  ///
  /// In en, this message translates to:
  /// **'Invalid Price'**
  String get invalidPriceTitle;

  /// No description provided for @invalidPriceMessage.
  ///
  /// In en, this message translates to:
  /// **'Some products have invalid or missing prices. Please review.'**
  String get invalidPriceMessage;

  /// No description provided for @nameNotUpdated.
  ///
  /// In en, this message translates to:
  /// **'(Name not updated)'**
  String get nameNotUpdated;

  /// No description provided for @unitPrice.
  ///
  /// In en, this message translates to:
  /// **'Unit Price'**
  String get unitPrice;

  /// No description provided for @select.
  ///
  /// In en, this message translates to:
  /// **'Select'**
  String get select;

  /// No description provided for @clearAll.
  ///
  /// In en, this message translates to:
  /// **'Clear all'**
  String get clearAll;

  /// No description provided for @recent.
  ///
  /// In en, this message translates to:
  /// **'Recent'**
  String get recent;

  /// No description provided for @scanInstruction.
  ///
  /// In en, this message translates to:
  /// **'Place barcode in frame to scan'**
  String get scanInstruction;

  /// No description provided for @updateProductCodeHelper.
  ///
  /// In en, this message translates to:
  /// **'Warranty info will be saved with product code.'**
  String get updateProductCodeHelper;

  /// No description provided for @monthsTitle.
  ///
  /// In en, this message translates to:
  /// **'Months'**
  String get monthsTitle;

  /// No description provided for @yearsTitle.
  ///
  /// In en, this message translates to:
  /// **'Years'**
  String get yearsTitle;

  /// No description provided for @pleaseEnterProductCode.
  ///
  /// In en, this message translates to:
  /// **'Please enter product code'**
  String get pleaseEnterProductCode;

  /// No description provided for @addPhotos.
  ///
  /// In en, this message translates to:
  /// **'Add {count} photos'**
  String addPhotos(int count);

  /// No description provided for @clearSelectedProducts.
  ///
  /// In en, this message translates to:
  /// **'Clear selected products'**
  String get clearSelectedProducts;

  /// No description provided for @confirmClearSelectedProducts.
  ///
  /// In en, this message translates to:
  /// **'Do you want to clear all selected products?'**
  String get confirmClearSelectedProducts;

  /// No description provided for @movingTo.
  ///
  /// In en, this message translates to:
  /// **'Moving to'**
  String get movingTo;

  /// No description provided for @deliverySuccess.
  ///
  /// In en, this message translates to:
  /// **'Delivered successfully'**
  String get deliverySuccess;

  /// No description provided for @products.
  ///
  /// In en, this message translates to:
  /// **'Products'**
  String get products;

  /// No description provided for @deliveryToWarehouseCompleted.
  ///
  /// In en, this message translates to:
  /// **'Delivery to warehouse {name} completed'**
  String deliveryToWarehouseCompleted(String name);

  /// No description provided for @deliveryToStoreCompleted.
  ///
  /// In en, this message translates to:
  /// **'Delivery to store {name} completed'**
  String deliveryToStoreCompleted(String name);

  /// No description provided for @selectProductFromStoreToStart.
  ///
  /// In en, this message translates to:
  /// **'Select products from store to start'**
  String get selectProductFromStoreToStart;

  /// No description provided for @sold.
  ///
  /// In en, this message translates to:
  /// **'Sold'**
  String get sold;

  /// No description provided for @minStock.
  ///
  /// In en, this message translates to:
  /// **'Minimum Stock'**
  String get minStock;

  /// No description provided for @updatePrice.
  ///
  /// In en, this message translates to:
  /// **'Update Selling Price'**
  String get updatePrice;

  /// No description provided for @sellingPrice.
  ///
  /// In en, this message translates to:
  /// **'Selling Price'**
  String get sellingPrice;

  /// No description provided for @purchasePrice.
  ///
  /// In en, this message translates to:
  /// **'Purchase Price'**
  String get purchasePrice;

  /// No description provided for @updateProduct.
  ///
  /// In en, this message translates to:
  /// **'Update Product'**
  String get updateProduct;

  /// No description provided for @delete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// No description provided for @confirmDeleteProduct.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete this product?'**
  String get confirmDeleteProduct;

  /// No description provided for @edit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get edit;

  /// No description provided for @information.
  ///
  /// In en, this message translates to:
  /// **'Information'**
  String get information;

  /// No description provided for @noInformation.
  ///
  /// In en, this message translates to:
  /// **'No information'**
  String get noInformation;

  /// No description provided for @confirmDeleteSupplier.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete this supplier?'**
  String get confirmDeleteSupplier;

  /// No description provided for @confirmDeleteWarehouse.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete this warehouse?'**
  String get confirmDeleteWarehouse;

  /// No description provided for @confirmDeleteStore.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete this store?'**
  String get confirmDeleteStore;

  /// No description provided for @confirmDeleteRole.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete the role {roleName}?'**
  String confirmDeleteRole(String roleName);

  /// No description provided for @deleteActionCannotBeUndone.
  ///
  /// In en, this message translates to:
  /// **'This action cannot be undone.'**
  String get deleteActionCannotBeUndone;

  /// No description provided for @receiptSuccessFully.
  ///
  /// In en, this message translates to:
  /// **'Receipt successfully'**
  String get receiptSuccessFully;

  /// No description provided for @deleteCategory.
  ///
  /// In en, this message translates to:
  /// **'Delete Category'**
  String get deleteCategory;

  /// No description provided for @deleteCategoryConfirmation.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete this category?'**
  String get deleteCategoryConfirmation;

  /// No description provided for @createCategory.
  ///
  /// In en, this message translates to:
  /// **'Create Category'**
  String get createCategory;

  /// No description provided for @categoryName.
  ///
  /// In en, this message translates to:
  /// **'Category Name'**
  String get categoryName;

  /// No description provided for @unit.
  ///
  /// In en, this message translates to:
  /// **'Unit'**
  String get unit;

  /// No description provided for @deleteSuccess.
  ///
  /// In en, this message translates to:
  /// **'Deleted successfully'**
  String get deleteSuccess;

  /// No description provided for @confirmDeleteEmployee.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete this employee?'**
  String get confirmDeleteEmployee;

  /// No description provided for @addRole.
  ///
  /// In en, this message translates to:
  /// **'Add Role'**
  String get addRole;

  /// No description provided for @currentQuantity.
  ///
  /// In en, this message translates to:
  /// **'Current quantity: {quantity}'**
  String currentQuantity(int quantity);

  /// No description provided for @remainingQuantity.
  ///
  /// In en, this message translates to:
  /// **'Remaining: {count}'**
  String remainingQuantity(int count);

  /// No description provided for @enterSplitQuantity.
  ///
  /// In en, this message translates to:
  /// **'Enter quantity to split'**
  String get enterSplitQuantity;

  /// No description provided for @splitQuantityHint.
  ///
  /// In en, this message translates to:
  /// **'Quantity (for example: 10)'**
  String get splitQuantityHint;

  /// No description provided for @splitQuantityInvalid.
  ///
  /// In en, this message translates to:
  /// **'Quantity must be > 0 and < {quantity}'**
  String splitQuantityInvalid(int quantity);

  /// No description provided for @splitProduct.
  ///
  /// In en, this message translates to:
  /// **'Split Product'**
  String get splitProduct;

  /// No description provided for @productCannotBeSplit.
  ///
  /// In en, this message translates to:
  /// **'This product cannot be split.'**
  String get productCannotBeSplit;

  /// No description provided for @mergeProduct.
  ///
  /// In en, this message translates to:
  /// **'Merge Product'**
  String get mergeProduct;

  /// No description provided for @selectProductsToMerge.
  ///
  /// In en, this message translates to:
  /// **'Select products to merge into this item'**
  String get selectProductsToMerge;

  /// No description provided for @noProductsToMerge.
  ///
  /// In en, this message translates to:
  /// **'No products to merge'**
  String get noProductsToMerge;

  /// No description provided for @mergeProductConfirm.
  ///
  /// In en, this message translates to:
  /// **'Merge {count} selected products?'**
  String mergeProductConfirm(int count);

  /// No description provided for @cannotMergeDifferentCode.
  ///
  /// In en, this message translates to:
  /// **'Products with different codes cannot be merged'**
  String get cannotMergeDifferentCode;

  /// No description provided for @cannotMergeDifferentExpiry.
  ///
  /// In en, this message translates to:
  /// **'Cannot merge due to different expiration dates'**
  String get cannotMergeDifferentExpiry;

  /// No description provided for @manufacturingDate.
  ///
  /// In en, this message translates to:
  /// **'Manufacturing Date'**
  String get manufacturingDate;

  /// No description provided for @expirationDate.
  ///
  /// In en, this message translates to:
  /// **'Expiration Date (Est.)'**
  String get expirationDate;

  /// No description provided for @outOfStock.
  ///
  /// In en, this message translates to:
  /// **'Out of stock'**
  String get outOfStock;

  /// No description provided for @confirmDeleteItem.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete {name}?'**
  String confirmDeleteItem(String name);

  /// No description provided for @billFromStore.
  ///
  /// In en, this message translates to:
  /// **'Bill from store'**
  String get billFromStore;

  /// No description provided for @orderFromStore.
  ///
  /// In en, this message translates to:
  /// **'Order from store'**
  String get orderFromStore;

  /// No description provided for @viewLocation.
  ///
  /// In en, this message translates to:
  /// **'View location'**
  String get viewLocation;

  /// No description provided for @defaultCurrency.
  ///
  /// In en, this message translates to:
  /// **'Default currency'**
  String get defaultCurrency;

  /// No description provided for @selectCurrency.
  ///
  /// In en, this message translates to:
  /// **'Select Currency'**
  String get selectCurrency;

  /// No description provided for @productCodeNotUpdated.
  ///
  /// In en, this message translates to:
  /// **'Product code not updated'**
  String get productCodeNotUpdated;

  /// No description provided for @mfgDateNotUpdated.
  ///
  /// In en, this message translates to:
  /// **'MFG date not updated'**
  String get mfgDateNotUpdated;

  /// No description provided for @expired.
  ///
  /// In en, this message translates to:
  /// **'Expired'**
  String get expired;

  /// No description provided for @expiresInDays.
  ///
  /// In en, this message translates to:
  /// **'Expires in {days} days'**
  String expiresInDays(int days);

  /// No description provided for @longPressToSelectProduct.
  ///
  /// In en, this message translates to:
  /// **'Long press on product to select'**
  String get longPressToSelectProduct;

  /// No description provided for @deleteItemConfirmation.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete {name}?'**
  String deleteItemConfirmation(String name);

  /// No description provided for @pickingUpGoods.
  ///
  /// In en, this message translates to:
  /// **'PICKING UP GOODS'**
  String get pickingUpGoods;

  /// No description provided for @deliveringGoods.
  ///
  /// In en, this message translates to:
  /// **'DELIVERING GOODS'**
  String get deliveringGoods;

  /// No description provided for @selectDeliveryPoint.
  ///
  /// In en, this message translates to:
  /// **'- Select delivery point -'**
  String get selectDeliveryPoint;

  /// No description provided for @storeDescriptionHint.
  ///
  /// In en, this message translates to:
  /// **'Complete identification and location to make the store clearly visible in the system.'**
  String get storeDescriptionHint;

  /// No description provided for @supplierDescriptionHint.
  ///
  /// In en, this message translates to:
  /// **'Organize contact information and clear address to easily track goods in the supply chain.'**
  String get supplierDescriptionHint;

  /// No description provided for @warehouseDescriptionHint.
  ///
  /// In en, this message translates to:
  /// **'Add identification information, location and notes to help the team manage the warehouse easier.'**
  String get warehouseDescriptionHint;

  /// No description provided for @selectCurrencyToStart.
  ///
  /// In en, this message translates to:
  /// **'Please select a currency to start'**
  String get selectCurrencyToStart;

  /// No description provided for @quantityWithCount.
  ///
  /// In en, this message translates to:
  /// **'Quantity {count}'**
  String quantityWithCount(String count);

  /// No description provided for @updateSupplierImage.
  ///
  /// In en, this message translates to:
  /// **'Update supplier image'**
  String get updateSupplierImage;

  /// No description provided for @currentImage.
  ///
  /// In en, this message translates to:
  /// **'Current image'**
  String get currentImage;

  /// No description provided for @selectImage.
  ///
  /// In en, this message translates to:
  /// **'Select image'**
  String get selectImage;

  /// No description provided for @selectFromDevice.
  ///
  /// In en, this message translates to:
  /// **'Select from device'**
  String get selectFromDevice;

  /// No description provided for @updateWarehouseImage.
  ///
  /// In en, this message translates to:
  /// **'Update warehouse image'**
  String get updateWarehouseImage;

  /// No description provided for @noProductData.
  ///
  /// In en, this message translates to:
  /// **'No product data'**
  String get noProductData;

  /// No description provided for @totalQuantityWithCount.
  ///
  /// In en, this message translates to:
  /// **'Total Qty: {count} {unit}'**
  String totalQuantityWithCount(num count, String unit);

  /// No description provided for @somethingWentWrongTryAgain.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong, please try again later!'**
  String get somethingWentWrongTryAgain;

  /// No description provided for @requestCancelled.
  ///
  /// In en, this message translates to:
  /// **'Request to server was cancelled'**
  String get requestCancelled;

  /// No description provided for @sendTimeout.
  ///
  /// In en, this message translates to:
  /// **'Send timeout'**
  String get sendTimeout;

  /// No description provided for @receiveTimeout.
  ///
  /// In en, this message translates to:
  /// **'Receive timeout'**
  String get receiveTimeout;

  /// No description provided for @connectionTimeout.
  ///
  /// In en, this message translates to:
  /// **'Connection timeout'**
  String get connectionTimeout;

  /// No description provided for @serverStatusCode.
  ///
  /// In en, this message translates to:
  /// **'Server status code: {code}'**
  String serverStatusCode(int code);

  /// No description provided for @connectionFailed.
  ///
  /// In en, this message translates to:
  /// **'Connection to server failed'**
  String get connectionFailed;

  /// No description provided for @pleaseSelectCurrencyToStart.
  ///
  /// In en, this message translates to:
  /// **'Please select a currency to start'**
  String get pleaseSelectCurrencyToStart;

  /// No description provided for @organizeSupplierInfoDescription.
  ///
  /// In en, this message translates to:
  /// **'Organize contact info and address clearly to easily track sources in the supply chain.'**
  String get organizeSupplierInfoDescription;

  /// No description provided for @addWarehouseInfoDescription.
  ///
  /// In en, this message translates to:
  /// **'Add identification information, location and notes to make it easier for the operations team to manage the warehouse.'**
  String get addWarehouseInfoDescription;

  /// No description provided for @allowImportGoods.
  ///
  /// In en, this message translates to:
  /// **'Allow goods receipt'**
  String get allowImportGoods;

  /// No description provided for @createRequest.
  ///
  /// In en, this message translates to:
  /// **'Create request order'**
  String get createRequest;

  /// No description provided for @noPurchasedMaterials.
  ///
  /// In en, this message translates to:
  /// **'No order-credit bundles yet'**
  String get noPurchasedMaterials;

  /// No description provided for @newPurchasedMaterialsWillAppearHere.
  ///
  /// In en, this message translates to:
  /// **'Bundles purchased through the App Store will appear here'**
  String get newPurchasedMaterialsWillAppearHere;

  /// No description provided for @quantityUsedUpdated.
  ///
  /// In en, this message translates to:
  /// **'Order-creation credits added'**
  String get quantityUsedUpdated;

  /// No description provided for @quantityMustBeBetween.
  ///
  /// In en, this message translates to:
  /// **'Choose between 1 and {count} bundles'**
  String quantityMustBeBetween(int count);

  /// No description provided for @useMaterial.
  ///
  /// In en, this message translates to:
  /// **'Add order-creation credits'**
  String get useMaterial;

  /// No description provided for @useQuantity.
  ///
  /// In en, this message translates to:
  /// **'Bundles to use'**
  String get useQuantity;

  /// No description provided for @availableQuantity.
  ///
  /// In en, this message translates to:
  /// **'In stock'**
  String get availableQuantity;

  /// No description provided for @remainingMaterial.
  ///
  /// In en, this message translates to:
  /// **'Bundles remaining: '**
  String get remainingMaterial;

  /// No description provided for @usedCountRemaining.
  ///
  /// In en, this message translates to:
  /// **'Order-creation credits remaining'**
  String get usedCountRemaining;

  /// No description provided for @usedQuantityOfTotal.
  ///
  /// In en, this message translates to:
  /// **'Used: {used}/{total}'**
  String usedQuantityOfTotal(int used, int total);

  /// No description provided for @useMaterialAction.
  ///
  /// In en, this message translates to:
  /// **'Add credits'**
  String get useMaterialAction;

  /// No description provided for @orderCreditsStore.
  ///
  /// In en, this message translates to:
  /// **'Buy Order Credits'**
  String get orderCreditsStore;

  /// No description provided for @orderCreditsStoreSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Buy order-credit bundles through the App Store'**
  String get orderCreditsStoreSubtitle;

  /// No description provided for @orderCreditBundles.
  ///
  /// In en, this message translates to:
  /// **'Purchased Order-Credit Bundles'**
  String get orderCreditBundles;

  /// No description provided for @orderCreditBundleHint.
  ///
  /// In en, this message translates to:
  /// **'Each bundle adds 35 order-creation credits'**
  String get orderCreditBundleHint;

  /// No description provided for @createdBy.
  ///
  /// In en, this message translates to:
  /// **'Creator'**
  String get createdBy;

  /// No description provided for @receivedBy.
  ///
  /// In en, this message translates to:
  /// **'Receiver'**
  String get receivedBy;

  /// No description provided for @vehicleType.
  ///
  /// In en, this message translates to:
  /// **'Vehicle'**
  String get vehicleType;

  /// No description provided for @quantityEnough.
  ///
  /// In en, this message translates to:
  /// **'Sufficient'**
  String get quantityEnough;

  /// No description provided for @quantityNotEnough.
  ///
  /// In en, this message translates to:
  /// **'Insufficient'**
  String get quantityNotEnough;

  /// No description provided for @ordered.
  ///
  /// In en, this message translates to:
  /// **'Ordered'**
  String get ordered;

  /// No description provided for @received.
  ///
  /// In en, this message translates to:
  /// **'Received'**
  String get received;

  /// No description provided for @checkWarehouseStock.
  ///
  /// In en, this message translates to:
  /// **'Check warehouse stock'**
  String get checkWarehouseStock;

  /// No description provided for @sufficient.
  ///
  /// In en, this message translates to:
  /// **'Sufficient'**
  String get sufficient;

  /// No description provided for @insufficient.
  ///
  /// In en, this message translates to:
  /// **'Insufficient'**
  String get insufficient;

  /// No description provided for @createQuickOrder.
  ///
  /// In en, this message translates to:
  /// **'Quick order'**
  String get createQuickOrder;

  /// No description provided for @allProductsSufficient.
  ///
  /// In en, this message translates to:
  /// **'All products in stock'**
  String get allProductsSufficient;

  /// No description provided for @requestedQuantity.
  ///
  /// In en, this message translates to:
  /// **'Requested'**
  String get requestedQuantity;

  /// No description provided for @productNotInWarehouse.
  ///
  /// In en, this message translates to:
  /// **'Not in warehouse'**
  String get productNotInWarehouse;

  /// No description provided for @pendingPurchaseBadge.
  ///
  /// In en, this message translates to:
  /// **'Pending Transaction'**
  String get pendingPurchaseBadge;

  /// No description provided for @pendingPurchaseTitle.
  ///
  /// In en, this message translates to:
  /// **'Purchased / Restored'**
  String get pendingPurchaseTitle;

  /// No description provided for @productId.
  ///
  /// In en, this message translates to:
  /// **'Product ID'**
  String get productId;

  /// No description provided for @completePendingTransaction.
  ///
  /// In en, this message translates to:
  /// **'Complete this transaction'**
  String get completePendingTransaction;

  /// No description provided for @buyMoreCredits.
  ///
  /// In en, this message translates to:
  /// **'Buy more credits'**
  String get buyMoreCredits;

  /// No description provided for @buyCreditsSuccess.
  ///
  /// In en, this message translates to:
  /// **'Purchase successful'**
  String get buyCreditsSuccess;

  /// No description provided for @useCreditsNowMessage.
  ///
  /// In en, this message translates to:
  /// **'You have successfully updated your order credits. Do you want to use 1 credit now?'**
  String get useCreditsNowMessage;

  /// No description provided for @useNow.
  ///
  /// In en, this message translates to:
  /// **'Use now'**
  String get useNow;

  /// No description provided for @useCreditSuccess.
  ///
  /// In en, this message translates to:
  /// **'Used 1 order credit successfully!'**
  String get useCreditSuccess;

  /// No description provided for @purchaseFailed.
  ///
  /// In en, this message translates to:
  /// **'Purchase failed!'**
  String get purchaseFailed;

  /// No description provided for @verificationError.
  ///
  /// In en, this message translates to:
  /// **'Verification error: {error}'**
  String verificationError(Object error);

  /// No description provided for @buyPackageWithPrice.
  ///
  /// In en, this message translates to:
  /// **'Buy package for {price}'**
  String buyPackageWithPrice(Object price);

  /// No description provided for @selectOrderPackage.
  ///
  /// In en, this message translates to:
  /// **'Select an order package'**
  String get selectOrderPackage;

  /// No description provided for @setupConversion.
  ///
  /// In en, this message translates to:
  /// **'Set up conversion'**
  String get setupConversion;

  /// No description provided for @setupConversionSuccess.
  ///
  /// In en, this message translates to:
  /// **'Conversion set up successfully'**
  String get setupConversionSuccess;

  /// No description provided for @conversionProductName.
  ///
  /// In en, this message translates to:
  /// **'Conversion product name'**
  String get conversionProductName;

  /// No description provided for @conversionProductNameHint.
  ///
  /// In en, this message translates to:
  /// **'e.g. Small box, Pack'**
  String get conversionProductNameHint;

  /// No description provided for @tapToSelectProductImage.
  ///
  /// In en, this message translates to:
  /// **'Tap the image to select a product photo'**
  String get tapToSelectProductImage;

  /// No description provided for @productImageSelected.
  ///
  /// In en, this message translates to:
  /// **'Product photo selected'**
  String get productImageSelected;

  /// No description provided for @conversionQuantity.
  ///
  /// In en, this message translates to:
  /// **'Conversion quantity'**
  String get conversionQuantity;

  /// No description provided for @conversionQuantityHint.
  ///
  /// In en, this message translates to:
  /// **'e.g. 10'**
  String get conversionQuantityHint;

  /// No description provided for @saveConversion.
  ///
  /// In en, this message translates to:
  /// **'Save conversion'**
  String get saveConversion;

  /// No description provided for @originalUnit.
  ///
  /// In en, this message translates to:
  /// **'Original unit'**
  String get originalUnit;

  /// No description provided for @originalUnitLabel.
  ///
  /// In en, this message translates to:
  /// **'Original unit: {unit}'**
  String originalUnitLabel(String unit);

  /// No description provided for @oneUnit.
  ///
  /// In en, this message translates to:
  /// **'1 {unit}'**
  String oneUnit(String unit);

  /// No description provided for @currentStock.
  ///
  /// In en, this message translates to:
  /// **'In stock: {count} {unit}'**
  String currentStock(int count, String unit);

  /// No description provided for @pleaseSelectConversionImage.
  ///
  /// In en, this message translates to:
  /// **'Please select an image for the conversion product.'**
  String get pleaseSelectConversionImage;

  /// No description provided for @pleaseEnterConversionName.
  ///
  /// In en, this message translates to:
  /// **'Please enter the conversion product name.'**
  String get pleaseEnterConversionName;

  /// No description provided for @pleaseEnterValidConversionQuantity.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid conversion quantity.'**
  String get pleaseEnterValidConversionQuantity;

  /// No description provided for @pleaseSelectConversionUnit.
  ///
  /// In en, this message translates to:
  /// **'Please select a conversion unit.'**
  String get pleaseSelectConversionUnit;

  /// No description provided for @conversionUnit.
  ///
  /// In en, this message translates to:
  /// **'Conversion unit'**
  String get conversionUnit;

  /// No description provided for @afterSplit.
  ///
  /// In en, this message translates to:
  /// **'After split: {count} {unit}'**
  String afterSplit(int count, String unit);

  /// No description provided for @splitObtained.
  ///
  /// In en, this message translates to:
  /// **'Received: {count} {unit}'**
  String splitObtained(int count, String unit);

  /// No description provided for @conversionFormula.
  ///
  /// In en, this message translates to:
  /// **'1 {parentUnit} = {value} {childUnit}'**
  String conversionFormula(String parentUnit, String value, String childUnit);

  /// No description provided for @conversionInfo.
  ///
  /// In en, this message translates to:
  /// **'Conversion information'**
  String get conversionInfo;

  /// No description provided for @errorTitle.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get errorTitle;

  /// No description provided for @productNotSetupConversion.
  ///
  /// In en, this message translates to:
  /// **'This product has not been set up for conversion.'**
  String get productNotSetupConversion;

  /// No description provided for @originalProduct.
  ///
  /// In en, this message translates to:
  /// **'Original product'**
  String get originalProduct;

  /// No description provided for @conversionProductDefault.
  ///
  /// In en, this message translates to:
  /// **'Conversion product'**
  String get conversionProductDefault;

  /// No description provided for @enterQuantity.
  ///
  /// In en, this message translates to:
  /// **'Enter quantity'**
  String get enterQuantity;

  /// No description provided for @exceedsCurrentQuantity.
  ///
  /// In en, this message translates to:
  /// **'Exceeds current quantity ({count} {unit})'**
  String exceedsCurrentQuantity(int count, String unit);

  /// No description provided for @warehouseImportStats.
  ///
  /// In en, this message translates to:
  /// **'Warehouse import statistics'**
  String get warehouseImportStats;

  /// No description provided for @monthLabel.
  ///
  /// In en, this message translates to:
  /// **'Month {month}'**
  String monthLabel(String month);

  /// No description provided for @yearLabel.
  ///
  /// In en, this message translates to:
  /// **'Year {year}'**
  String yearLabel(String year);

  /// No description provided for @storeInvoiceByDayTitle.
  ///
  /// In en, this message translates to:
  /// **'Invoices by Day'**
  String get storeInvoiceByDayTitle;

  /// No description provided for @storeInvoiceCount.
  ///
  /// In en, this message translates to:
  /// **'Invoices'**
  String get storeInvoiceCount;

  /// No description provided for @storeExportTableTitle.
  ///
  /// In en, this message translates to:
  /// **'Data Export Table'**
  String get storeExportTableTitle;

  /// No description provided for @storeExportExcel.
  ///
  /// In en, this message translates to:
  /// **'Export to Excel'**
  String get storeExportExcel;

  /// No description provided for @storeExportSuccessOpen.
  ///
  /// In en, this message translates to:
  /// **'Excel file created and opened with the default app.'**
  String get storeExportSuccessOpen;

  /// No description provided for @storeExportSuccessSaved.
  ///
  /// In en, this message translates to:
  /// **'File created: {path}\nCould not open automatically ({message}).'**
  String storeExportSuccessSaved(String path, String message);

  /// No description provided for @storeExportTable.
  ///
  /// In en, this message translates to:
  /// **'Export Table'**
  String get storeExportTable;

  /// No description provided for @storeHistoryStats.
  ///
  /// In en, this message translates to:
  /// **'Quantity Statistics'**
  String get storeHistoryStats;

  /// No description provided for @storeSoldLeast.
  ///
  /// In en, this message translates to:
  /// **'Sell the least'**
  String get storeSoldLeast;

  /// No description provided for @storeSoldMost.
  ///
  /// In en, this message translates to:
  /// **'Sell the most'**
  String get storeSoldMost;

  /// No description provided for @storeNoDataForMonth.
  ///
  /// In en, this message translates to:
  /// **'No data\nmonth {month}/{year}'**
  String storeNoDataForMonth(int month, int year);

  /// No description provided for @storeColStt.
  ///
  /// In en, this message translates to:
  /// **'No.'**
  String get storeColStt;

  /// No description provided for @storeColDate.
  ///
  /// In en, this message translates to:
  /// **'Transaction Date'**
  String get storeColDate;

  /// No description provided for @storeColRevenue.
  ///
  /// In en, this message translates to:
  /// **'Revenue'**
  String get storeColRevenue;

  /// No description provided for @storePreview.
  ///
  /// In en, this message translates to:
  /// **'Preview'**
  String get storePreview;

  /// No description provided for @storeNoteColumn.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get storeNoteColumn;

  /// No description provided for @storeTodayRevenue.
  ///
  /// In en, this message translates to:
  /// **'Today\'s revenue'**
  String get storeTodayRevenue;

  /// No description provided for @storeColumnNameLabel.
  ///
  /// In en, this message translates to:
  /// **'Display column name'**
  String get storeColumnNameLabel;

  /// No description provided for @storeColumnNameHint.
  ///
  /// In en, this message translates to:
  /// **'E.g.: Description'**
  String get storeColumnNameHint;

  /// No description provided for @storeDefaultValueLabel.
  ///
  /// In en, this message translates to:
  /// **'Default value when note is empty'**
  String get storeDefaultValueLabel;

  /// No description provided for @storeDefaultValueHint.
  ///
  /// In en, this message translates to:
  /// **'E.g.: Today\'s revenue'**
  String get storeDefaultValueHint;

  /// No description provided for @storeShowProductNames.
  ///
  /// In en, this message translates to:
  /// **'Show product names'**
  String get storeShowProductNames;

  /// No description provided for @storeShowProductNamesSubtitle.
  ///
  /// In en, this message translates to:
  /// **'The description column will auto-join product names'**
  String get storeShowProductNamesSubtitle;

  /// No description provided for @storeShowQuantity.
  ///
  /// In en, this message translates to:
  /// **'Show quantity'**
  String get storeShowQuantity;

  /// No description provided for @storeShowQuantitySubtitle.
  ///
  /// In en, this message translates to:
  /// **'Append \"(quantity unit)\" after each product name'**
  String get storeShowQuantitySubtitle;

  /// No description provided for @storeSplitPayment.
  ///
  /// In en, this message translates to:
  /// **'Split cash / transfer'**
  String get storeSplitPayment;

  /// No description provided for @storeSplitPaymentSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Split the revenue column into 2 columns by payment method'**
  String get storeSplitPaymentSubtitle;

  /// No description provided for @empEditOrder.
  ///
  /// In en, this message translates to:
  /// **'Edit order'**
  String get empEditOrder;

  /// No description provided for @empProductCost.
  ///
  /// In en, this message translates to:
  /// **'Product cost'**
  String get empProductCost;

  /// No description provided for @empTotalReceivedQty.
  ///
  /// In en, this message translates to:
  /// **'Total received qty'**
  String get empTotalReceivedQty;

  /// No description provided for @empPleaseEnterQuantity.
  ///
  /// In en, this message translates to:
  /// **'Please enter quantity'**
  String get empPleaseEnterQuantity;

  /// No description provided for @empInvalidQuantity.
  ///
  /// In en, this message translates to:
  /// **'Invalid quantity'**
  String get empInvalidQuantity;

  /// No description provided for @empDeleteSupplier.
  ///
  /// In en, this message translates to:
  /// **'Delete supplier'**
  String get empDeleteSupplier;

  /// No description provided for @empSlAbbr.
  ///
  /// In en, this message translates to:
  /// **'Qty'**
  String get empSlAbbr;

  /// No description provided for @empLineTotal.
  ///
  /// In en, this message translates to:
  /// **'Subtotal'**
  String get empLineTotal;

  /// No description provided for @empEstimatedOrderAmount.
  ///
  /// In en, this message translates to:
  /// **'Estimated order amount'**
  String get empEstimatedOrderAmount;

  /// No description provided for @empReceivedLineTotal.
  ///
  /// In en, this message translates to:
  /// **'Received subtotal'**
  String get empReceivedLineTotal;

  /// No description provided for @empPickupPointsCount.
  ///
  /// In en, this message translates to:
  /// **'{count} pickup points'**
  String empPickupPointsCount(int count);

  /// No description provided for @empProductsItemsCount.
  ///
  /// In en, this message translates to:
  /// **'{productCount} products • {itemCount} items'**
  String empProductsItemsCount(int productCount, int itemCount);

  /// No description provided for @empMoreProducts.
  ///
  /// In en, this message translates to:
  /// **'+{count} more products'**
  String empMoreProducts(int count);

  /// No description provided for @empItemSummaryCount.
  ///
  /// In en, this message translates to:
  /// **'{productCount} products ({totalQuantity})'**
  String empItemSummaryCount(int productCount, int totalQuantity);

  /// No description provided for @empPickupPointCount.
  ///
  /// In en, this message translates to:
  /// **'{count} points'**
  String empPickupPointCount(int count);

  /// No description provided for @empSpAbbr.
  ///
  /// In en, this message translates to:
  /// **'{count} products'**
  String empSpAbbr(int count);

  /// No description provided for @empMonAbbr.
  ///
  /// In en, this message translates to:
  /// **'({count} items)'**
  String empMonAbbr(int count);

  /// No description provided for @empPickupPoint.
  ///
  /// In en, this message translates to:
  /// **'pickup points'**
  String get empPickupPoint;

  /// No description provided for @empMoreProductsDetail.
  ///
  /// In en, this message translates to:
  /// **'+{count} more products (tap to view details)'**
  String empMoreProductsDetail(int count);

  /// No description provided for @empLocationNotObtained.
  ///
  /// In en, this message translates to:
  /// **'Location not obtained'**
  String get empLocationNotObtained;

  /// No description provided for @empLocationRetryMessage.
  ///
  /// In en, this message translates to:
  /// **'Couldn\'t get your current location. Please confirm to retry.'**
  String get empLocationRetryMessage;

  /// No description provided for @empPickupFailed.
  ///
  /// In en, this message translates to:
  /// **'Pickup failed. Please check the warehouse!'**
  String get empPickupFailed;

  /// No description provided for @employeePhoneAlreadyExists.
  ///
  /// In en, this message translates to:
  /// **'Phone number already exists'**
  String get employeePhoneAlreadyExists;

  /// No description provided for @employeePermissionUpdatedTitle.
  ///
  /// In en, this message translates to:
  /// **'Permission updated'**
  String get employeePermissionUpdatedTitle;

  /// No description provided for @employeePermissionUpdatedBody.
  ///
  /// In en, this message translates to:
  /// **'Your permissions have just been updated.'**
  String get employeePermissionUpdatedBody;

  /// No description provided for @supplierHistoryStats.
  ///
  /// In en, this message translates to:
  /// **'Import statistics'**
  String get supplierHistoryStats;

  /// No description provided for @supplierUpdateImage.
  ///
  /// In en, this message translates to:
  /// **'Update supplier image'**
  String get supplierUpdateImage;

  /// No description provided for @supplierCurrentImage.
  ///
  /// In en, this message translates to:
  /// **'Current image'**
  String get supplierCurrentImage;

  /// No description provided for @supplierChooseImage.
  ///
  /// In en, this message translates to:
  /// **'Choose image'**
  String get supplierChooseImage;

  /// No description provided for @supplierChooseFromDevice.
  ///
  /// In en, this message translates to:
  /// **'Choose from device'**
  String get supplierChooseFromDevice;

  /// No description provided for @orderUpdateSuccess.
  ///
  /// In en, this message translates to:
  /// **'Order updated successfully'**
  String get orderUpdateSuccess;

  /// No description provided for @orderDeleteSuccess.
  ///
  /// In en, this message translates to:
  /// **'Order deleted successfully'**
  String get orderDeleteSuccess;

  /// No description provided for @orderDeleteTitle.
  ///
  /// In en, this message translates to:
  /// **'Delete Order'**
  String get orderDeleteTitle;

  /// No description provided for @orderDeleteConfirmMessage.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete this order?'**
  String get orderDeleteConfirmMessage;

  /// No description provided for @orderPleaseEnterQuantity.
  ///
  /// In en, this message translates to:
  /// **'Please enter quantity'**
  String get orderPleaseEnterQuantity;

  /// No description provided for @orderInvalidQuantity.
  ///
  /// In en, this message translates to:
  /// **'Invalid quantity'**
  String get orderInvalidQuantity;

  /// No description provided for @orderExceedsStock.
  ///
  /// In en, this message translates to:
  /// **'Exceeds stock quantity'**
  String get orderExceedsStock;

  /// No description provided for @orderStt.
  ///
  /// In en, this message translates to:
  /// **'No.'**
  String get orderStt;

  /// No description provided for @homeDeliveryWaiting.
  ///
  /// In en, this message translates to:
  /// **'Awaiting delivery'**
  String get homeDeliveryWaiting;

  /// No description provided for @homeSalesEmployee.
  ///
  /// In en, this message translates to:
  /// **'Sales employee'**
  String get homeSalesEmployee;

  /// No description provided for @homeWarehouseEmployee.
  ///
  /// In en, this message translates to:
  /// **'Warehouse employee'**
  String get homeWarehouseEmployee;

  /// No description provided for @homeLoadingEmployees.
  ///
  /// In en, this message translates to:
  /// **'Loading employees...'**
  String get homeLoadingEmployees;

  /// No description provided for @homeSelectWarehouseEmployee.
  ///
  /// In en, this message translates to:
  /// **'Select warehouse employee'**
  String get homeSelectWarehouseEmployee;

  /// No description provided for @homePickupGoods.
  ///
  /// In en, this message translates to:
  /// **'Pickup'**
  String get homePickupGoods;

  /// No description provided for @homePickingUpGoods.
  ///
  /// In en, this message translates to:
  /// **'Picking up'**
  String get homePickingUpGoods;

  /// No description provided for @homePickingUpSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Driver is picking up goods'**
  String get homePickingUpSubtitle;

  /// No description provided for @homePickupPointCount.
  ///
  /// In en, this message translates to:
  /// **'{count} pickup points'**
  String homePickupPointCount(int count);

  /// No description provided for @homeDelivering.
  ///
  /// In en, this message translates to:
  /// **'Delivering'**
  String get homeDelivering;

  /// No description provided for @homeDeliveringSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Driver is heading to the delivery point'**
  String get homeDeliveringSubtitle;

  /// No description provided for @homeDeliveryPointName.
  ///
  /// In en, this message translates to:
  /// **'Delivery point: {name}'**
  String homeDeliveryPointName(String name);

  /// No description provided for @homePickupCountDest.
  ///
  /// In en, this message translates to:
  /// **'{count} pickup points · {destination}'**
  String homePickupCountDest(int count, String destination);

  /// No description provided for @homeViewJourney.
  ///
  /// In en, this message translates to:
  /// **'View journey'**
  String get homeViewJourney;

  /// No description provided for @homeNoPickupInfo.
  ///
  /// In en, this message translates to:
  /// **'No pickup point information.'**
  String get homeNoPickupInfo;

  /// No description provided for @homeProductCount.
  ///
  /// In en, this message translates to:
  /// **'{count} products'**
  String homeProductCount(int count);

  /// No description provided for @homeOtherProducts.
  ///
  /// In en, this message translates to:
  /// **'+{count} other products'**
  String homeOtherProducts(int count);

  /// No description provided for @homeDestination.
  ///
  /// In en, this message translates to:
  /// **'Destination'**
  String get homeDestination;

  /// No description provided for @homeRecipient.
  ///
  /// In en, this message translates to:
  /// **'Recipient: {name}'**
  String homeRecipient(String name);

  /// No description provided for @homeAddWarehouseOrStore.
  ///
  /// In en, this message translates to:
  /// **'Add warehouse / store'**
  String get homeAddWarehouseOrStore;

  /// No description provided for @supplierImportHistory.
  ///
  /// In en, this message translates to:
  /// **'Import history at {name}'**
  String supplierImportHistory(String name);
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'ja', 'vi'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'ja':
      return AppLocalizationsJa();
    case 'vi':
      return AppLocalizationsVi();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
