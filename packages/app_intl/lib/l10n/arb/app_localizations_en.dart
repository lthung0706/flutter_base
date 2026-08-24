// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get storeName => 'Store Name';

  @override
  String get address => 'Address';

  @override
  String get phone => 'Phone Number';

  @override
  String get unknown => 'Unknown';

  @override
  String get notAvailable => 'N/A';

  @override
  String get systemManagement => 'SYSTEM MANAGEMENT';

  @override
  String get employees => 'Employees';

  @override
  String get appSettings => 'App Settings';

  @override
  String get reportIssue => 'Report an Issue';

  @override
  String get regulationsAndPolicies => 'REGULATIONS & POLICIES';

  @override
  String get termsConditions => 'Terms and Conditions';

  @override
  String get privacyPolicy => 'Privacy Policy';

  @override
  String get termsConditionsMarkdown =>
      '## TERMS OF SERVICE\n\n### 1. Acceptance of Terms\nBy registering an account and using the SStrip application, users (including Store Owners, Warehouse Staff, and Delivery Staff) agree to comply with all of the terms below. If you do not agree, please stop using the service immediately.\n\n### 2. Service Description\nSStrip is a platform for supply chain and goods transportation management. The application provides tools to:\n* Manage warehouses, stores, and suppliers.\n* Create and track delivery orders.\n* Monitor delivery routes in real time on the map.\n* Scan QR codes to look up products and orders.\n* Receive push notifications about order status.\n\n### 3. User Accounts\n* **Registration:** Users register with an email address or phone number. Employee accounts are created and assigned permissions by the Store Owner.\n* **Security:** Users are responsible for protecting their login credentials and all activities performed under their account.\n* **Authorization:** Access to features (create, edit, delete orders or data) is managed through a role system assigned by the Store Owner.\n\n### 4. User Responsibilities\n* Provide accurate and truthful information about goods (name, price, unit, image).\n* Commit not to transport prohibited goods, explosives, smuggled goods, or any items that violate Vietnamese law.\n* Do not use the application for fraudulent, destructive, or illegal purposes.\n* Ensure uploaded images do not infringe the intellectual property rights of any third party.\n\n### 5. Service Fees and Payment\n* Any related costs will be displayed publicly in the application before the user confirms an order.\n* Product prices are calculated in VND and displayed clearly for each item.\n\n### 6. Limitation of Liability\n* SStrip provides technology solutions and is not directly responsible for the quality of goods or incidents caused by third parties.\n* Any claims regarding damaged goods will be resolved based on evidence (images, delivery records) recorded in the application.\n* We are not liable for service interruptions caused by network failures, natural disasters, or force majeure events.\n\n### 7. Termination of Service\n* We reserve the right to suspend or terminate user accounts if violations of these terms are detected.\n* Users may request account deletion at any time.\n\n---\n*Last updated: March 05, 2026*';

  @override
  String get privacyPolicyMarkdown =>
      '## PRIVACY POLICY\n\n> This policy is prepared in compliance with Decree 13/2023/ND-CP on personal data protection in Vietnam.\n\n### 1. Data We Collect\n\n**a) Account information:**\n* Full name, email, and phone number (during registration).\n* Passwords (encrypted and never stored as plain text).\n* Roles and permissions in the system (Store Owner, Warehouse Staff, Delivery Staff).\n\n**b) Location data (GPS):**\n* Delivery staff location is collected in real time, including when the application runs in the background, to update delivery routes for relevant parties.\n* Warehouse, store, and supplier locations are stored for map display purposes.\n\n**c) Images and files:**\n* Product, warehouse, and store images uploaded by users.\n* Photos captured from the camera or selected from the photo library for goods management purposes.\n\n**d) Device information:**\n* Device type, operating system, and device identifiers for notification delivery.\n* Application error information collected automatically to improve software quality.\n\n**e) Business data:**\n* Order information: creator, products, quantities, prices, status, and notes.\n* Supplier information: name, address, phone number, and product catalog.\n* Warehouse and store information: name, address, coordinates, and description.\n\n### 2. Purposes of Data Use\n\n* **Operations:** Manage warehouses, stores, orders, and connect deliveries to suitable staff.\n* **Tracking:** Display real-time delivery locations on the map to help ensure goods safety.\n* **Notifications:** Send push notifications about order status and system updates.\n* **Support:** Resolve disputes or complaints based on stored transaction data.\n* **Improvement:** Analyze errors and improve features based on usage behavior.\n\n### 3. Device Permissions\n\nThe application requests the following permissions on your device:\n\n| Permission | Purpose |\n|------------|---------|\n| Location (while in use) | Display location on the map, find the nearest supplier |\n| Location (background) | Continuously track delivery routes (delivery staff only) |\n| Camera | Take product photos, scan QR codes |\n| Photo library | Select product and warehouse images from the device |\n| Notifications | Receive order status and system update notifications |\n| Storage | Store local data to improve performance |\n\nYou may disable any permission in your phone\'s **Settings**. However, disabling some permissions may affect application functionality.\n\n### 4. Information Sharing\n\nWe commit to **not selling** personal data to third parties. Data is only shared in the following cases:\n* **Within the system:** Delivery staff can see order information (delivery address, products); owners can see delivery staff locations.\n* **Map service providers:** Map partners receive location data to display maps and calculate routes.\n* **Notification services:** Push notification service providers receive device identifiers to deliver notifications.\n* **Competent authorities:** When there is a written request under Vietnamese law.\n\n### 5. Your Rights (Under Decree 13/2023/ND-CP)\n\nYou have the right to:\n1. **Access and Edit:** Update personal information (name, phone number) at any time in the Account section.\n2. **Delete Data:** Request account deletion and removal of related data by contacting support.\n3. **Withdraw Permissions:** Disable access to location, camera, or notifications in phone settings.\n4. **Object to Processing:** Object to the processing of personal data in certain cases as provided by law.\n\n### 6. Storage and Security\n\n* Data is transmitted through secure encrypted protocols.\n* Sensitive data (passwords) is encrypted before storage.\n* Local data on the device is stored using encrypted databases.\n* The system uses secure connections for real-time delivery tracking.\n\n### 7. Data Retention Period\n\n* Account data: Stored until the user requests deletion.\n\n---\n*Last updated: March 05, 2026*';

  @override
  String get dangerZone => 'DANGER ZONE';

  @override
  String get deleteAccount => 'Delete Account';

  @override
  String get deleteAccountConfirm =>
      'Are you sure you want to delete this account?';

  @override
  String get logout => 'Logout';

  @override
  String get logoutConfirm => 'Are you sure you want to log out?';

  @override
  String get employeeLogoutConfirm =>
      'Are you sure you want to log out of the employee account?';

  @override
  String get appVersion => 'APP VERSION';

  @override
  String get language => 'Language';

  @override
  String get selectLanguage => 'Select Language';

  @override
  String get employeeList => 'Employee List';

  @override
  String get cancel => 'Cancel';

  @override
  String get save => 'Save';

  @override
  String get pickupPoints => 'Import Goods';

  @override
  String get warehouses => 'Warehouses';

  @override
  String get importGoods => 'Import Goods';

  @override
  String get stores => 'Stores';

  @override
  String get createPickupPoint => 'Create Pickup Point';

  @override
  String get createProduct => 'Create Product';

  @override
  String get createWarehouse => 'Create Warehouse';

  @override
  String get createStore => 'Create Store';

  @override
  String get appName => 'Flutter Demo';

  @override
  String get findAddress => 'Find Address';

  @override
  String get searchAddress => 'Search address';

  @override
  String get selectThisLocation => 'Select this location';

  @override
  String get orderFromWarehouse => 'Order From Warehouse';

  @override
  String get orderSuccessfully => 'Order successfully';

  @override
  String get pleaseSelectProduct => 'Please select product';

  @override
  String get pleaseSelectDeliveryPoint => 'Please select delivery point';

  @override
  String get placeOrder => 'Place Order';

  @override
  String get pending => 'Pending';

  @override
  String get processing => 'Processing';

  @override
  String get completed => 'Completed';

  @override
  String get delivered => 'Delivered';

  @override
  String get cancelled => 'Cancelled';

  @override
  String get failed => 'Failed';

  @override
  String get deliveryPoint => 'Delivery Point';

  @override
  String get createdDate => 'Created Date';

  @override
  String get notes => 'Notes';

  @override
  String get note => 'Note';

  @override
  String get enterNote => 'Enter note';

  @override
  String get customer => 'Customer';

  @override
  String get location => 'Location';

  @override
  String get time => 'Time';

  @override
  String get confirm => 'Confirm';

  @override
  String get sessionExpiredTitle => 'Session expired';

  @override
  String get sessionExpiredMessage =>
      'Your session has expired, please log in again';

  @override
  String get total => 'Total';

  @override
  String get totalAmount => 'Total Amount';

  @override
  String get noOrdersYet => 'No orders yet';

  @override
  String get noOrders => 'No orders';

  @override
  String get turnOnLocation => 'Location Access';

  @override
  String get locationPermissionDescription =>
      'We need location access to track your route and support the best delivery service.';

  @override
  String orderCompletedWithId(String id) {
    return 'Order $id completed successfully';
  }

  @override
  String get confirmCancelOrderTitle => 'Cancel Order';

  @override
  String get confirmCancelOrderMessage =>
      'Are you sure you want to cancel this order?';

  @override
  String get noProductsSelected => 'No products selected';

  @override
  String get selectProductsFromWarehouseToStart =>
      'Select products from the warehouse to get started';

  @override
  String get selectProductsFromSupplierToStart =>
      'Select products from the supplier to get started';

  @override
  String orderNumberTitle(String shortId) {
    return 'Order #$shortId';
  }

  @override
  String get deliveringOrders => 'Pending Orders';

  @override
  String get deliveredOrders => 'Delivered Orders';

  @override
  String get receivedOrders => 'Received Orders';

  @override
  String get purchasedOrders => 'Purchased Orders';

  @override
  String get cancelledOrders => 'Cancelled Orders';

  @override
  String get completedOrders => 'Completed Orders';

  @override
  String get supplier => 'Supplier';

  @override
  String get noSuppliersYet => 'No suppliers yet';

  @override
  String get addSupplierToStart => 'Add a supplier to start getting products';

  @override
  String get noWarehousesYet => 'No warehouses yet';

  @override
  String get addWarehouseToStart => 'Setup a warehouse to start managing';

  @override
  String get noStoresYet => 'No stores yet';

  @override
  String get addStoreToStart => 'Setup a store to start selling';

  @override
  String get warehouse => 'Warehouse';

  @override
  String get product => 'Product';

  @override
  String get quantity => 'Quantity';

  @override
  String orderedQuantity(int count) {
    return 'Ordered: x$count';
  }

  @override
  String supplierCount(int count) {
    return '$count suppliers';
  }

  @override
  String itemCount(int count) {
    return '$count items';
  }

  @override
  String quantityCount(int count) {
    return '$count quantity';
  }

  @override
  String receivedQuantityLabel(int received, int quantity) {
    return 'Received: $received/$quantity';
  }

  @override
  String get receivedEnough => 'Đủ';

  @override
  String get receivedShort => 'Thiếu';

  @override
  String get continueDelivery => 'Continue delivery';

  @override
  String productsAndQuantitySummary(int productCount, int totalQuantity) {
    return '$productCount items • $totalQuantity quantity';
  }

  @override
  String totalProducts(int totalQuantity) {
    return 'Total $totalQuantity products';
  }

  @override
  String get createOrder => 'Create Order';

  @override
  String get createImportOrder => 'Create Import Order';

  @override
  String get createTransferOrder => 'Create Transfer Order';

  @override
  String get createRequestOrder => 'Create Request';

  @override
  String get deliverTo => 'Deliver to: ';

  @override
  String get price => 'Price';

  @override
  String get warehouseName => 'Warehouse Name';

  @override
  String get supplierName => 'Supplier Name';

  @override
  String get productCode => 'Product Code';

  @override
  String get enterProductCode => 'Enter product code';

  @override
  String get scanCode => 'Scan code';

  @override
  String get warrantyPeriod => 'Warranty Period';

  @override
  String get updateProductCode => 'Update Product Code';

  @override
  String get updateSuccessfully => 'Update successfully';

  @override
  String months(String value) {
    return '$value months';
  }

  @override
  String years(String value) {
    return '$value years';
  }

  @override
  String get home => 'Home';

  @override
  String get order => 'Order';

  @override
  String get storeInfo => 'STORE INFORMATION';

  @override
  String get guide => 'Guide';

  @override
  String get setupNewStore => 'Setup New Store';

  @override
  String get close => 'Close';

  @override
  String get exampleStoreName => 'E.g: Store District 1';

  @override
  String get description => 'Description';

  @override
  String get additionalInfo => 'Additional info...';

  @override
  String get saveStore => 'Save Store';

  @override
  String get supplierInfo => 'SUPPLIER INFORMATION';

  @override
  String get setupNewSupplier => 'Setup New Supplier';

  @override
  String get exampleSupplierName => 'E.g: Thanh Cong Agency';

  @override
  String get phoneNumber => 'Phone Number';

  @override
  String get examplePhoneNumber => '0123 456 789';

  @override
  String get addressHint => 'House number, street, district...';

  @override
  String get saveSupplier => 'Save Supplier';

  @override
  String get pleaseSelectAddressBeforeSaving =>
      'Please select an address before saving';

  @override
  String get pleaseEnterSupplierName => 'Please enter the supplier name';

  @override
  String get warehouseInfo => 'WAREHOUSE INFORMATION';

  @override
  String get setupNewWarehouse => 'Setup New Warehouse';

  @override
  String get createSupplierShowcaseDescription =>
      'Tap here to create your first warehouse and start managing suppliers and products.';

  @override
  String get exampleWarehouseName => 'E.g: Warehouse A';

  @override
  String get saveWarehouse => 'Save Warehouse';

  @override
  String get productInfo => 'PRODUCT INFORMATION';

  @override
  String get addProduct => 'Add Product';

  @override
  String get productName => 'Product Name';

  @override
  String get enterProductName => 'Enter product name';

  @override
  String get enterPrice => 'Enter price';

  @override
  String get saveProduct => 'Save Product';

  @override
  String get editProduct => 'Edit Product';

  @override
  String get deleteProduct => 'Delete Product';

  @override
  String get warrantyProduct => 'Warranty Product';

  @override
  String get createNewEmployee => 'Create New Employee';

  @override
  String get employeeName => 'Employee Name';

  @override
  String get enterEmployeeName => 'Enter employee name';

  @override
  String get password => 'Password';

  @override
  String get enterPassword => 'Enter password';

  @override
  String get role => 'Role';

  @override
  String get inventoryManagement => 'Inventory Management';

  @override
  String get delivery => 'Delivery';

  @override
  String get sales => 'Sales';

  @override
  String get deliveryVehicle => 'Delivery Vehicle';

  @override
  String get motorcycle => 'Motorcycle';

  @override
  String get truck => 'Truck';

  @override
  String get create => 'Create';

  @override
  String get chatPage => 'Chat Page';

  @override
  String get chatFunctionality => 'Chat functionality will be here';

  @override
  String get profile => 'Profile';

  @override
  String get settings => 'Settings (Map Removed)';

  @override
  String get store => 'Store';

  @override
  String get enableGps => 'Continue';

  @override
  String trackingInfoUpdated(String data) {
    return 'Tracking info updated: $data';
  }

  @override
  String get reject => 'Reject';

  @override
  String get acceptOrder => 'Accept Order';

  @override
  String get declineOrder => 'Decline Order';

  @override
  String detailsTitle(String index) {
    return 'Details $index';
  }

  @override
  String get orderInformation => 'Order Information';

  @override
  String detailedViewForOrder(String index) {
    return 'Detailed view for order #$index';
  }

  @override
  String get demoCustomerName => 'Nguyen Van A';

  @override
  String get demoOrderLocation => '123 Main Street, District 1, HCMC';

  @override
  String get demoOrderTime => '10:30 AM - Today';

  @override
  String get demoOrderNotes =>
      'Customer requested careful delivery and a call before arrival.';

  @override
  String get settingsMapRemovedDescription =>
      'Map functionality has been removed from settings. Please refactor to MapLibre.';

  @override
  String get noProducts => 'No products';

  @override
  String get addProductsToCategory => 'Add products to this category.';

  @override
  String get completeOrder => 'Complete Order';

  @override
  String get receiveOrder => 'Receive Order';

  @override
  String get pickupCompleted => 'Pickup Completed';

  @override
  String get refreshList => 'Refresh List';

  @override
  String get enableGPS => 'Continue';

  @override
  String get start => 'Start';

  @override
  String get back => 'Back';

  @override
  String get scanQRReceiveNotification =>
      'Scan QR, receive notifications\nand start now';

  @override
  String get manageWarehouseStore => 'Manage warehouse, store\nand supplier';

  @override
  String get createOrderTrackShipment =>
      'Create order and track shipment\nin real time';

  @override
  String get sstripPlatform => 'SStrip - supply chain\noperating platform';

  @override
  String get search => 'Search';

  @override
  String get anErrorOccurred => 'An error occurred';

  @override
  String error(String message) {
    return 'Error: $message';
  }

  @override
  String get noName => 'No name';

  @override
  String get noPhoneNumber => 'No phone number';

  @override
  String get noEmployees => 'No employees';

  @override
  String get pressButtonToAddEmployee =>
      'Press button below to add new employee';

  @override
  String get loading => 'Loading...';

  @override
  String get storeList => 'Store List';

  @override
  String get productsAtCounter => 'Products at the counter';

  @override
  String get salesHistory => 'Sales history';

  @override
  String get windbreakerJacket => 'Windbreaker Jacket';

  @override
  String get sportSneakers => 'Sport Sneakers';

  @override
  String get meshCap => 'Mesh Cap';

  @override
  String get khakiPants => 'Khaki Pants';

  @override
  String get completeProductInfoInOneGo =>
      'Select a supplier and complete each product\'s information to keep the catalog neatly updated in one go.';

  @override
  String get locked => 'Locked';

  @override
  String get changeSupplier => 'Change supplier';

  @override
  String get selectSupplier => 'Select supplier';

  @override
  String get tapToChooseSupplierBeforeAddingProducts =>
      'Tap to choose a supplier before adding products.';

  @override
  String productNumber(int number) {
    return 'Product $number';
  }

  @override
  String get newestItem => 'Newest item';

  @override
  String get uploadImage => 'UPLOAD IMAGE';

  @override
  String get changeImage => 'Change image';

  @override
  String get pleaseSelectSupplierBeforeSaving =>
      'Please select a supplier before saving.';

  @override
  String get pleaseSelectImagesBeforeSaving =>
      'Please select images for all products before saving.';

  @override
  String get productType => 'Product type';

  @override
  String get selectType => '-- Select type --';

  @override
  String get vnd => 'VND';

  @override
  String get materialPieceType => 'Material (piece)';

  @override
  String get materialKilogramType => 'Material (kg)';

  @override
  String get materialBoxType => 'Material (box)';

  @override
  String get pieceUnit => 'piece';

  @override
  String get kilogramUnit => 'kg';

  @override
  String get boxUnit => 'box';

  @override
  String get active => 'Active';

  @override
  String get noData => 'No data available';

  @override
  String get chat => 'Chat';

  @override
  String get chatFunctionalityComingSoon => 'Chat functionality will be here';

  @override
  String get owner => 'Store owner';

  @override
  String get employee => 'Employee';

  @override
  String get welcomeBack => 'Welcome back';

  @override
  String get loginToContinueManagingStore =>
      'Log in to continue managing your store';

  @override
  String get email => 'Email';

  @override
  String get enterEmail => 'Enter email address';

  @override
  String get enterPhone => 'Enter phone number';

  @override
  String get loginFailed => 'Login failed';

  @override
  String get login => 'Log in';

  @override
  String get dontHaveAccountRegisterNow =>
      'Don\'t have an account? Create one free';

  @override
  String get createAccount => 'Create free account';

  @override
  String get registerToStartManagingStore =>
      'Create a free SStrip account to get started';

  @override
  String get userName => 'Username';

  @override
  String get enterName => 'Enter your name';

  @override
  String get confirmPassword => 'Confirm password';

  @override
  String get enterConfirmPassword => 'Re-enter password';

  @override
  String get passwordsMatch => 'Passwords match';

  @override
  String get passwordsDoNotMatch => 'Passwords do not match';

  @override
  String get registerFailed => 'Registration failed';

  @override
  String get register => 'Register';

  @override
  String get alreadyHaveAccountLogin => 'Already have an account? Log in';

  @override
  String get onboardingOverviewTitle =>
      'SStrip - supply chain\noperations platform';

  @override
  String get onboardingOverviewDescription =>
      'Manage warehousing, goods movement, and your distribution network centrally in a single application.';

  @override
  String get onboardingOverviewHeadline => 'One screen - multiple workflows';

  @override
  String get onboardingOverviewHighlight1 => 'Supply chain';

  @override
  String get onboardingOverviewHighlight2 => 'Goods transportation';

  @override
  String get onboardingOverviewHighlight3 => 'Centralized data';

  @override
  String get onboardingOverviewStat1 => 'Warehouse';

  @override
  String get onboardingOverviewStat2 => 'Store';

  @override
  String get onboardingOverviewStat3 => 'Supplier';

  @override
  String get onboardingLocationsTitle =>
      'Manage warehouses, stores,\nand suppliers';

  @override
  String get onboardingLocationsDescription =>
      'Set up and monitor key operating locations to control inventory, supply sources, and the distribution network more accurately.';

  @override
  String get onboardingLocationsHeadline => 'A clear point-of-sale ecosystem';

  @override
  String get onboardingLocationsHighlight1 => 'Warehouse';

  @override
  String get onboardingLocationsHighlight2 => 'Store';

  @override
  String get onboardingLocationsHighlight3 => 'Supplier';

  @override
  String get onboardingLocationsStat1 => 'Track locations';

  @override
  String get onboardingLocationsStat2 => 'Sync information';

  @override
  String get onboardingLocationsStat3 => 'Scale the system';

  @override
  String get onboardingDeliveryTitle =>
      'Create orders and track\ndeliveries in real time';

  @override
  String get onboardingDeliveryDescription =>
      'Create shipping orders quickly, monitor delivery routes on the map, and update statuses instantly throughout the journey.';

  @override
  String get onboardingDeliveryHeadline => 'Transparent logistics in real time';

  @override
  String get onboardingDeliveryHighlight1 => 'Quick order creation';

  @override
  String get onboardingDeliveryHighlight2 => 'Route tracking';

  @override
  String get onboardingDeliveryHighlight3 => 'Status updates';

  @override
  String get onboardingDeliveryStat1 => 'Visual map';

  @override
  String get onboardingDeliveryStat2 => 'Delivery progress';

  @override
  String get onboardingDeliveryStat3 => 'Proactive handling';

  @override
  String get onboardingReadyTitle => 'Connect & ';

  @override
  String get onboardingReadyDescription =>
      'Look up products and orders by QR code and receive push notifications to always stay updated on the latest operations.';

  @override
  String get onboardingReadyHeadline => 'Ready to enter the app';

  @override
  String get onboardingReadyHighlight1 => 'QR scanning';

  @override
  String get onboardingReadyHighlight2 => 'Order lookup';

  @override
  String get onboardingReadyHighlight3 => 'Push notifications';

  @override
  String get onboardingReadyStat1 => 'Accurate';

  @override
  String get onboardingReadyStat2 => 'Fast';

  @override
  String get onboardingReadyStat3 => 'Always up to date';

  @override
  String get purchaseCompleted => 'Purchase Completed';

  @override
  String get deliverToWarehouse => 'Deliver to Warehouse';

  @override
  String get startDelivery => 'Start delivery';

  @override
  String get complete => 'Complete';

  @override
  String get isEnd => 'End of list';

  @override
  String get shippingTab => 'Shipping';

  @override
  String get switchWarehouseTab => 'Switch Warehouse';

  @override
  String get requestTab => 'Request';

  @override
  String get pleaseEnterWarehouseName => 'Please enter the warehouse name';

  @override
  String get transferToWarehouse => 'Transfer to warehouse';

  @override
  String get nearlyOutOfStock => 'Nearly out of stock';

  @override
  String get updateMinimumQuantity => 'Update minimum quantity';

  @override
  String get minimumQuantity => 'Minimum quantity';

  @override
  String get enterMinimumQuantity => 'Enter minimum quantity';

  @override
  String get pleaseEnterValidMinimumQuantity =>
      'Please enter a valid minimum quantity';

  @override
  String minCount(String count) {
    return 'Min: $count';
  }

  @override
  String get onboardingSstripTag => 'SSTRIP';

  @override
  String get onboardingSstripTitle => 'Smart Logistics ';

  @override
  String get onboardingSstripTitleEm => 'Simplifying Supply Chain';

  @override
  String get onboardingSstripDesc =>
      'Connect warehouses, suppliers, and drivers on a single platform.';

  @override
  String get onboardingFeatureTag => 'FEATURES';

  @override
  String get onboardingFeatureTitle => 'Next Generation ';

  @override
  String get onboardingFeatureTitleEm => 'Management';

  @override
  String get onboardingFeatureDesc =>
      'Powerful tools to optimize your daily logistics operations.';

  @override
  String get onboardingStartTag => 'GET STARTED';

  @override
  String get onboardingStartTitle => 'Setup in ';

  @override
  String get onboardingStartTitleEm => 'minutes';

  @override
  String get onboardingStartDesc =>
      'Setup your logistics system quickly and easily.';

  @override
  String get onboardingReadyTag => 'READY';

  @override
  String get onboardingReadyTitleEm => 'Get Started Today';

  @override
  String get onboardingReadyDesc =>
      'Start managing products and orders with SStrip.';

  @override
  String get onboardingWelcome => '🎉 Welcome to SStrip!';

  @override
  String get onboardingSkip => 'Skip';

  @override
  String get onboardingStartNow => 'Start Now';

  @override
  String get onboardingNext => 'Next';

  @override
  String get onboardingFeatOrderTitle => 'Order Management';

  @override
  String get onboardingFeatOrderDesc =>
      'Create & track from warehouse to receiver';

  @override
  String get onboardingFeatMapTitle => 'Map Tracking';

  @override
  String get onboardingFeatMapDesc => 'Real-time driver location and route';

  @override
  String get onboardingFeatReportTitle => 'Warehouse Reports';

  @override
  String get onboardingFeatReportDesc => 'Inventory statistics and history';

  @override
  String get onboardingStep1Title => 'Create Free Account';

  @override
  String get onboardingStep1Desc => 'Sign up in seconds and start using SStrip';

  @override
  String get onboardingStep2Title => 'Setup Warehouse & Products';

  @override
  String get onboardingStep2Desc => 'Add warehouses, suppliers, and categories';

  @override
  String get onboardingStep3Title => 'Create & Assign';

  @override
  String get onboardingStep3Desc => 'Automated order creation and assignment';

  @override
  String get onboardingStep4Title => 'Track & Confirm';

  @override
  String get onboardingStep4Desc =>
      'Real-time tracking and delivery confirmation';

  @override
  String get onboardingOwner => 'Owner';

  @override
  String get onboardingDriver => 'Driver';

  @override
  String get onboardingWarehouse => 'Warehouse';

  @override
  String get onboardingBubbleOwner => 'Sender';

  @override
  String get onboardingBubbleDriver => 'Driver';

  @override
  String get onboardingBubbleWarehouse => 'Warehouse';

  @override
  String get onboardingBubbleSupply => 'Supplier';

  @override
  String get interfaceTitle => 'INTERFACE';

  @override
  String get themeTitle => 'Theme';

  @override
  String get themeAuto => 'System';

  @override
  String get themeLight => 'Light';

  @override
  String get themeDark => 'Dark';

  @override
  String get selectTheme => 'Select Theme';

  @override
  String get paymentSection => 'PAYMENT';

  @override
  String get currencyTitle => 'Currency';

  @override
  String get cash => 'Cash';

  @override
  String get bankTransfer => 'Bank transfer';

  @override
  String get nodeColor => 'Node Color';

  @override
  String get selectNodeColor => 'Select Color';

  @override
  String get orderUpdateCompletedSuccess => 'Order completed successfully';

  @override
  String get orderUpdateCancelledSuccess => 'Order cancelled successfully';

  @override
  String get priceNotUpdated => 'Price not updated';

  @override
  String get invalidPriceTitle => 'Invalid Price';

  @override
  String get invalidPriceMessage =>
      'Some products have invalid or missing prices. Please review.';

  @override
  String get nameNotUpdated => '(Name not updated)';

  @override
  String get unitPrice => 'Unit Price';

  @override
  String get select => 'Select';

  @override
  String get clearAll => 'Clear all';

  @override
  String get recent => 'Recent';

  @override
  String get scanInstruction => 'Place barcode in frame to scan';

  @override
  String get updateProductCodeHelper =>
      'Warranty info will be saved with product code.';

  @override
  String get monthsTitle => 'Months';

  @override
  String get yearsTitle => 'Years';

  @override
  String get pleaseEnterProductCode => 'Please enter product code';

  @override
  String addPhotos(int count) {
    return 'Add $count photos';
  }

  @override
  String get clearSelectedProducts => 'Clear selected products';

  @override
  String get confirmClearSelectedProducts =>
      'Do you want to clear all selected products?';

  @override
  String get movingTo => 'Moving to';

  @override
  String get deliverySuccess => 'Delivered successfully';

  @override
  String get products => 'Products';

  @override
  String deliveryToWarehouseCompleted(String name) {
    return 'Delivery to warehouse $name completed';
  }

  @override
  String deliveryToStoreCompleted(String name) {
    return 'Delivery to store $name completed';
  }

  @override
  String get selectProductFromStoreToStart =>
      'Select products from store to start';

  @override
  String get sold => 'Sold';

  @override
  String get minStock => 'Minimum Stock';

  @override
  String get updatePrice => 'Update Selling Price';

  @override
  String get sellingPrice => 'Selling Price';

  @override
  String get purchasePrice => 'Purchase Price';

  @override
  String get updateProduct => 'Update Product';

  @override
  String get delete => 'Delete';

  @override
  String get confirmDeleteProduct =>
      'Are you sure you want to delete this product?';

  @override
  String get edit => 'Edit';

  @override
  String get information => 'Information';

  @override
  String get noInformation => 'No information';

  @override
  String get confirmDeleteSupplier =>
      'Are you sure you want to delete this supplier?';

  @override
  String get confirmDeleteWarehouse =>
      'Are you sure you want to delete this warehouse?';

  @override
  String get confirmDeleteStore =>
      'Are you sure you want to delete this store?';

  @override
  String confirmDeleteRole(String roleName) {
    return 'Are you sure you want to delete the role $roleName?';
  }

  @override
  String get deleteActionCannotBeUndone => 'This action cannot be undone.';

  @override
  String get receiptSuccessFully => 'Receipt successfully';

  @override
  String get deleteCategory => 'Delete Category';

  @override
  String get deleteCategoryConfirmation =>
      'Are you sure you want to delete this category?';

  @override
  String get createCategory => 'Create Category';

  @override
  String get categoryName => 'Category Name';

  @override
  String get unit => 'Unit';

  @override
  String get deleteSuccess => 'Deleted successfully';

  @override
  String get confirmDeleteEmployee =>
      'Are you sure you want to delete this employee?';

  @override
  String get addRole => 'Add Role';

  @override
  String currentQuantity(int quantity) {
    return 'Current quantity: $quantity';
  }

  @override
  String remainingQuantity(int count) {
    return 'Remaining: $count';
  }

  @override
  String get enterSplitQuantity => 'Enter quantity to split';

  @override
  String get splitQuantityHint => 'Quantity (for example: 10)';

  @override
  String splitQuantityInvalid(int quantity) {
    return 'Quantity must be > 0 and < $quantity';
  }

  @override
  String get splitProduct => 'Split Product';

  @override
  String get productCannotBeSplit => 'This product cannot be split.';

  @override
  String get mergeProduct => 'Merge Product';

  @override
  String get selectProductsToMerge => 'Select products to merge into this item';

  @override
  String get noProductsToMerge => 'No products to merge';

  @override
  String mergeProductConfirm(int count) {
    return 'Merge $count selected products?';
  }

  @override
  String get cannotMergeDifferentCode =>
      'Products with different codes cannot be merged';

  @override
  String get cannotMergeDifferentExpiry =>
      'Cannot merge due to different expiration dates';

  @override
  String get manufacturingDate => 'Manufacturing Date';

  @override
  String get expirationDate => 'Expiration Date (Est.)';

  @override
  String get outOfStock => 'Out of stock';

  @override
  String confirmDeleteItem(String name) {
    return 'Are you sure you want to delete $name?';
  }

  @override
  String get billFromStore => 'Bill from store';

  @override
  String get orderFromStore => 'Order from store';

  @override
  String get viewLocation => 'View location';

  @override
  String get defaultCurrency => 'Default currency';

  @override
  String get selectCurrency => 'Select Currency';

  @override
  String get productCodeNotUpdated => 'Product code not updated';

  @override
  String get mfgDateNotUpdated => 'MFG date not updated';

  @override
  String get expired => 'Expired';

  @override
  String expiresInDays(int days) {
    return 'Expires in $days days';
  }

  @override
  String get longPressToSelectProduct => 'Long press on product to select';

  @override
  String deleteItemConfirmation(String name) {
    return 'Are you sure you want to delete $name?';
  }

  @override
  String get pickingUpGoods => 'PICKING UP GOODS';

  @override
  String get deliveringGoods => 'DELIVERING GOODS';

  @override
  String get selectDeliveryPoint => '- Select delivery point -';

  @override
  String get storeDescriptionHint =>
      'Complete identification and location to make the store clearly visible in the system.';

  @override
  String get supplierDescriptionHint =>
      'Organize contact information and clear address to easily track goods in the supply chain.';

  @override
  String get warehouseDescriptionHint =>
      'Add identification information, location and notes to help the team manage the warehouse easier.';

  @override
  String get selectCurrencyToStart => 'Please select a currency to start';

  @override
  String quantityWithCount(String count) {
    return 'Quantity $count';
  }

  @override
  String get updateSupplierImage => 'Update supplier image';

  @override
  String get currentImage => 'Current image';

  @override
  String get selectImage => 'Select image';

  @override
  String get selectFromDevice => 'Select from device';

  @override
  String get updateWarehouseImage => 'Update warehouse image';

  @override
  String get noProductData => 'No product data';

  @override
  String totalQuantityWithCount(num count, String unit) {
    return 'Total Qty: $count $unit';
  }

  @override
  String get somethingWentWrongTryAgain =>
      'Something went wrong, please try again later!';

  @override
  String get requestCancelled => 'Request to server was cancelled';

  @override
  String get sendTimeout => 'Send timeout';

  @override
  String get receiveTimeout => 'Receive timeout';

  @override
  String get connectionTimeout => 'Connection timeout';

  @override
  String serverStatusCode(int code) {
    return 'Server status code: $code';
  }

  @override
  String get connectionFailed => 'Connection to server failed';

  @override
  String get pleaseSelectCurrencyToStart => 'Please select a currency to start';

  @override
  String get organizeSupplierInfoDescription =>
      'Organize contact info and address clearly to easily track sources in the supply chain.';

  @override
  String get addWarehouseInfoDescription =>
      'Add identification information, location and notes to make it easier for the operations team to manage the warehouse.';

  @override
  String get allowImportGoods => 'Allow goods receipt';

  @override
  String get createRequest => 'Create request order';

  @override
  String get noPurchasedMaterials => 'No order-credit bundles yet';

  @override
  String get newPurchasedMaterialsWillAppearHere =>
      'Bundles purchased through the App Store will appear here';

  @override
  String get quantityUsedUpdated => 'Order-creation credits added';

  @override
  String quantityMustBeBetween(int count) {
    return 'Choose between 1 and $count bundles';
  }

  @override
  String get useMaterial => 'Add order-creation credits';

  @override
  String get useQuantity => 'Bundles to use';

  @override
  String get availableQuantity => 'In stock';

  @override
  String get remainingMaterial => 'Bundles remaining: ';

  @override
  String get usedCountRemaining => 'Order-creation credits remaining';

  @override
  String usedQuantityOfTotal(int used, int total) {
    return 'Used: $used/$total';
  }

  @override
  String get useMaterialAction => 'Add credits';

  @override
  String get orderCreditsStore => 'Buy Order Credits';

  @override
  String get orderCreditsStoreSubtitle =>
      'Buy order-credit bundles through the App Store';

  @override
  String get orderCreditBundles => 'Purchased Order-Credit Bundles';

  @override
  String get orderCreditBundleHint =>
      'Each bundle adds 35 order-creation credits';

  @override
  String get createdBy => 'Creator';

  @override
  String get receivedBy => 'Receiver';

  @override
  String get vehicleType => 'Vehicle';

  @override
  String get quantityEnough => 'Sufficient';

  @override
  String get quantityNotEnough => 'Insufficient';

  @override
  String get ordered => 'Ordered';

  @override
  String get received => 'Received';

  @override
  String get checkWarehouseStock => 'Check warehouse stock';

  @override
  String get sufficient => 'Sufficient';

  @override
  String get insufficient => 'Insufficient';

  @override
  String get createQuickOrder => 'Quick order';

  @override
  String get allProductsSufficient => 'All products in stock';

  @override
  String get requestedQuantity => 'Requested';

  @override
  String get productNotInWarehouse => 'Not in warehouse';

  @override
  String get pendingPurchaseBadge => 'Pending Transaction';

  @override
  String get pendingPurchaseTitle => 'Purchased / Restored';

  @override
  String get productId => 'Product ID';

  @override
  String get completePendingTransaction => 'Complete this transaction';

  @override
  String get buyMoreCredits => 'Buy more credits';

  @override
  String get buyCreditsSuccess => 'Purchase successful';

  @override
  String get useCreditsNowMessage =>
      'You have successfully updated your order credits. Do you want to use 1 credit now?';

  @override
  String get useNow => 'Use now';

  @override
  String get useCreditSuccess => 'Used 1 order credit successfully!';

  @override
  String get purchaseFailed => 'Purchase failed!';

  @override
  String verificationError(Object error) {
    return 'Verification error: $error';
  }

  @override
  String buyPackageWithPrice(Object price) {
    return 'Buy package for $price';
  }

  @override
  String get selectOrderPackage => 'Select an order package';

  @override
  String get setupConversion => 'Set up conversion';

  @override
  String get setupConversionSuccess => 'Conversion set up successfully';

  @override
  String get conversionProductName => 'Conversion product name';

  @override
  String get conversionProductNameHint => 'e.g. Small box, Pack';

  @override
  String get tapToSelectProductImage =>
      'Tap the image to select a product photo';

  @override
  String get productImageSelected => 'Product photo selected';

  @override
  String get conversionQuantity => 'Conversion quantity';

  @override
  String get conversionQuantityHint => 'e.g. 10';

  @override
  String get saveConversion => 'Save conversion';

  @override
  String get originalUnit => 'Original unit';

  @override
  String originalUnitLabel(String unit) {
    return 'Original unit: $unit';
  }

  @override
  String oneUnit(String unit) {
    return '1 $unit';
  }

  @override
  String currentStock(int count, String unit) {
    return 'In stock: $count $unit';
  }

  @override
  String get pleaseSelectConversionImage =>
      'Please select an image for the conversion product.';

  @override
  String get pleaseEnterConversionName =>
      'Please enter the conversion product name.';

  @override
  String get pleaseEnterValidConversionQuantity =>
      'Please enter a valid conversion quantity.';

  @override
  String get pleaseSelectConversionUnit => 'Please select a conversion unit.';

  @override
  String get conversionUnit => 'Conversion unit';

  @override
  String afterSplit(int count, String unit) {
    return 'After split: $count $unit';
  }

  @override
  String splitObtained(int count, String unit) {
    return 'Received: $count $unit';
  }

  @override
  String conversionFormula(String parentUnit, String value, String childUnit) {
    return '1 $parentUnit = $value $childUnit';
  }

  @override
  String get conversionInfo => 'Conversion information';

  @override
  String get errorTitle => 'Error';

  @override
  String get productNotSetupConversion =>
      'This product has not been set up for conversion.';

  @override
  String get originalProduct => 'Original product';

  @override
  String get conversionProductDefault => 'Conversion product';

  @override
  String get enterQuantity => 'Enter quantity';

  @override
  String exceedsCurrentQuantity(int count, String unit) {
    return 'Exceeds current quantity ($count $unit)';
  }

  @override
  String get warehouseImportStats => 'Warehouse import statistics';

  @override
  String monthLabel(String month) {
    return 'Month $month';
  }

  @override
  String yearLabel(String year) {
    return 'Year $year';
  }

  @override
  String get storeInvoiceByDayTitle => 'Invoices by Day';

  @override
  String get storeInvoiceCount => 'Invoices';

  @override
  String get storeExportTableTitle => 'Data Export Table';

  @override
  String get storeExportExcel => 'Export to Excel';

  @override
  String get storeExportSuccessOpen =>
      'Excel file created and opened with the default app.';

  @override
  String storeExportSuccessSaved(String path, String message) {
    return 'File created: $path\nCould not open automatically ($message).';
  }

  @override
  String get storeExportTable => 'Export Table';

  @override
  String get storeHistoryStats => 'Quantity Statistics';

  @override
  String get storeSoldLeast => 'Sell the least';

  @override
  String get storeSoldMost => 'Sell the most';

  @override
  String storeNoDataForMonth(int month, int year) {
    return 'No data\nmonth $month/$year';
  }

  @override
  String get storeColStt => 'No.';

  @override
  String get storeColDate => 'Transaction Date';

  @override
  String get storeColRevenue => 'Revenue';

  @override
  String get storePreview => 'Preview';

  @override
  String get storeNoteColumn => 'Description';

  @override
  String get storeTodayRevenue => 'Today\'s revenue';

  @override
  String get storeColumnNameLabel => 'Display column name';

  @override
  String get storeColumnNameHint => 'E.g.: Description';

  @override
  String get storeDefaultValueLabel => 'Default value when note is empty';

  @override
  String get storeDefaultValueHint => 'E.g.: Today\'s revenue';

  @override
  String get storeShowProductNames => 'Show product names';

  @override
  String get storeShowProductNamesSubtitle =>
      'The description column will auto-join product names';

  @override
  String get storeShowQuantity => 'Show quantity';

  @override
  String get storeShowQuantitySubtitle =>
      'Append \"(quantity unit)\" after each product name';

  @override
  String get storeSplitPayment => 'Split cash / transfer';

  @override
  String get storeSplitPaymentSubtitle =>
      'Split the revenue column into 2 columns by payment method';

  @override
  String get empEditOrder => 'Edit order';

  @override
  String get empProductCost => 'Product cost';

  @override
  String get empTotalReceivedQty => 'Total received qty';

  @override
  String get empPleaseEnterQuantity => 'Please enter quantity';

  @override
  String get empInvalidQuantity => 'Invalid quantity';

  @override
  String get empDeleteSupplier => 'Delete supplier';

  @override
  String get empSlAbbr => 'Qty';

  @override
  String get empLineTotal => 'Subtotal';

  @override
  String get empEstimatedOrderAmount => 'Estimated order amount';

  @override
  String get empReceivedLineTotal => 'Received subtotal';

  @override
  String empPickupPointsCount(int count) {
    return '$count pickup points';
  }

  @override
  String empProductsItemsCount(int productCount, int itemCount) {
    return '$productCount products • $itemCount items';
  }

  @override
  String empMoreProducts(int count) {
    return '+$count more products';
  }

  @override
  String empItemSummaryCount(int productCount, int totalQuantity) {
    return '$productCount products ($totalQuantity)';
  }

  @override
  String empPickupPointCount(int count) {
    return '$count points';
  }

  @override
  String empSpAbbr(int count) {
    return '$count products';
  }

  @override
  String empMonAbbr(int count) {
    return '($count items)';
  }

  @override
  String get empPickupPoint => 'pickup points';

  @override
  String empMoreProductsDetail(int count) {
    return '+$count more products (tap to view details)';
  }

  @override
  String get empLocationNotObtained => 'Location not obtained';

  @override
  String get empLocationRetryMessage =>
      'Couldn\'t get your current location. Please confirm to retry.';

  @override
  String get empPickupFailed => 'Pickup failed. Please check the warehouse!';

  @override
  String get employeePhoneAlreadyExists => 'Phone number already exists';

  @override
  String get employeePermissionUpdatedTitle => 'Permission updated';

  @override
  String get employeePermissionUpdatedBody =>
      'Your permissions have just been updated.';

  @override
  String get supplierHistoryStats => 'Import statistics';

  @override
  String get supplierUpdateImage => 'Update supplier image';

  @override
  String get supplierCurrentImage => 'Current image';

  @override
  String get supplierChooseImage => 'Choose image';

  @override
  String get supplierChooseFromDevice => 'Choose from device';

  @override
  String get orderUpdateSuccess => 'Order updated successfully';

  @override
  String get orderDeleteSuccess => 'Order deleted successfully';

  @override
  String get orderDeleteTitle => 'Delete Order';

  @override
  String get orderDeleteConfirmMessage =>
      'Are you sure you want to delete this order?';

  @override
  String get orderPleaseEnterQuantity => 'Please enter quantity';

  @override
  String get orderInvalidQuantity => 'Invalid quantity';

  @override
  String get orderExceedsStock => 'Exceeds stock quantity';

  @override
  String get orderStt => 'No.';

  @override
  String get homeDeliveryWaiting => 'Awaiting delivery';

  @override
  String get homeSalesEmployee => 'Sales employee';

  @override
  String get homeWarehouseEmployee => 'Warehouse employee';

  @override
  String get homeLoadingEmployees => 'Loading employees...';

  @override
  String get homeSelectWarehouseEmployee => 'Select warehouse employee';

  @override
  String get homePickupGoods => 'Pickup';

  @override
  String get homePickingUpGoods => 'Picking up';

  @override
  String get homePickingUpSubtitle => 'Driver is picking up goods';

  @override
  String homePickupPointCount(int count) {
    return '$count pickup points';
  }

  @override
  String get homeDelivering => 'Delivering';

  @override
  String get homeDeliveringSubtitle =>
      'Driver is heading to the delivery point';

  @override
  String homeDeliveryPointName(String name) {
    return 'Delivery point: $name';
  }

  @override
  String homePickupCountDest(int count, String destination) {
    return '$count pickup points · $destination';
  }

  @override
  String get homeViewJourney => 'View journey';

  @override
  String get homeNoPickupInfo => 'No pickup point information.';

  @override
  String homeProductCount(int count) {
    return '$count products';
  }

  @override
  String homeOtherProducts(int count) {
    return '+$count other products';
  }

  @override
  String get homeDestination => 'Destination';

  @override
  String homeRecipient(String name) {
    return 'Recipient: $name';
  }

  @override
  String get homeAddWarehouseOrStore => 'Add warehouse / store';

  @override
  String supplierImportHistory(String name) {
    return 'Import history at $name';
  }
}
