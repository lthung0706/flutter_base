class EndPoints {
  EndPoints._();

  static const String pushNotification = '/api/v1/notification/push';
  static const String pushNotificationEmployee =
      '/api/v1/notification/push-employee';

  static const String upload = '/api/v1/upload/products';

  static const String getOrder = '/api/v1/orders';
  static const String getOrderFromEmp = '/api/v1/orders/from-emp';
  static const String getOrderFromEmpSwitchWarehouse =
      '/api/v1/orders/from-emp-switch-warehouse';
  static const String createOrder = '/api/v1/orders';
  static const String getOrderSwitchWarehouse =
      '/api/v1/orders/get-order-switch-warehouse';
  static const String createOrderSwitchWarehouse =
      '/api/v1/orders/create-order-switch-warehouse';
  static const String getOrderRequest = '/api/v1/orders/order-request';
  static const String createOrderRequest = '/api/v1/orders/create-request';
  static const String updateOrder = '/api/v1/orders/update-status';
  static const String updateOrderRequest =
      '/api/v1/orders/update-state-request';
  static const String getSupliers = '/api/v1/suppliers';
  static const String createSupplier = '/api/v1/suppliers';
  static const String getProducts = '/api/v1/products';
  static const String createProduct = '/api/v1/products';
  static const String updateMinAtWarehouse =
      '/api/v1/products/update-min-warehouse';
  static const String updateMinAtStore = '/api/v1/products/update-min-store';
  static const String updateChildInfoStore =
      '/api/v1/products/update-child-info-store';
  static const String updatePriceAtStore =
      '/api/v1/products/update-price-store';
  static const String updatePriceAtSupplier =
      '/api/v1/products/update-price-supplier';
  static const String deleteProduct = '/api/v1/products';
  static const String deleteProductInStore =
      '/api/v1/products/delete-product-in-store';
  static const String deleteProductInWarehouse =
      '/api/v1/products/delete-product-in-warehouse';
  static const String createCategories = '/api/v1/categories';
  static const String getCategories = '/api/v1/categories';
  static const String getSupliersWithProduct =
      '/api/v1/suppliers-with-products';
  static const String warehouse = '/api/v1/warehouses';
  static const String addProductToWarehouse = '/api/v1/warehouses/add-products';
  static const String updateProductInWarehouse =
      '/api/v1/warehouses/update-product-in-warehouse';
  static const String onlyWarehouse =
      '/api/v1/warehouses/{user_id}/only-warehouse';
  static const String splitProductInWarehouse =
      '/api/v1/warehouses/split-product';
  static const String mergeProductInWarehouse =
      '/api/v1/warehouses/merge-products';
  static const String getEmployees = '/api/v1/employees';
  static const String createEmployee = '/api/v1/employees';
  static const String updateVehicleType =
      '/api/v1/employees/update-vehicle-type';
  static const String roles = '/api/v1/roles';
  static const String stores = '/api/v1/stores';
  static const String addProductToStore = '/api/v1/stores/add-products';
  static const String splitProductInStore = '/api/v1/stores/split-product';

  static const String login = '/api/v1/auth/login';
  static const String googleLogin = '/api/v1/auth/google-login';
  static const String appleLogin = '/api/v1/auth/apple-login';
  static const String addUser = '/api/v1/auth/register-manager';
  static const String deleteUser = '/api/v1/auth/delete-account';
  static const String employeeLogin = '/api/v1/auth/login-employee';
  static const String updateInfoUser = '/api/v1/managers/update-info-user';
  static const String getUserCountdown = '/api/v1/managers/get-user-info';
  static const String refeshToken = '/api/v1/auth/refresh-token';
  static const String signinWithGoogle = '/api/v1/auth/signin-with-google';
  static const String register = '/api/v1/auth/register';
  static const String logout = '/api/v1/auth/logout';
  static const String logoutEmployee = '/api/v1/employees/logout';
  static const String resetPassword = '/api/v1/auth/reset-password';
  static const String otp = '/api/v1/auth/otp';
  static const String geoGoogleMapAutoComplete = '/Place/AutoComplete';
  static const String geoGoogleMapGetDetail = '/Place/Detail';
  static const String geoGoogleMapReverseGeocode = '/geocode';

  static const String configurations = '/app/configurations';
  static const String sendMessage = 'send_message';
  static const String newMessage = 'new_message';

  static const String historySell = '/api/v1/history_sell';
  static const String historySupplier = '/api/v1/history_supplier';
  static const String historyWarehouse = '/api/v1/history_warehouse';
  static const String billingStore = '/api/v1/billing_store';

  static const String purchasedWarehouse = '/api/v1/item_purchased';
  static const String usePurchasedWarehouseItem =
      '/api/v1/item_purchased/use';
}
