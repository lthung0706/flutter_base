// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Vietnamese (`vi`).
class AppLocalizationsVi extends AppLocalizations {
  AppLocalizationsVi([String locale = 'vi']) : super(locale);

  @override
  String get storeName => 'Tên cửa hàng';

  @override
  String get address => 'Địa chỉ';

  @override
  String get phone => 'Số điện thoại';

  @override
  String get unknown => 'Không xác định';

  @override
  String get notAvailable => 'Không có';

  @override
  String get systemManagement => 'QUẢN LÝ HỆ THỐNG';

  @override
  String get employees => 'Nhân viên';

  @override
  String get appSettings => 'Cài đặt ứng dụng';

  @override
  String get reportIssue => 'Báo cáo sự cố';

  @override
  String get regulationsAndPolicies => 'QUY ĐỊNH & CHÍNH SÁCH';

  @override
  String get termsConditions => 'Điều khoản và Điều kiện';

  @override
  String get privacyPolicy => 'Chính sách bảo mật';

  @override
  String get termsConditionsMarkdown =>
      '## ĐIỀU KHOẢN DỊCH VỤ\n\n### 1. Chấp nhận điều khoản\nBằng việc đăng ký tài khoản và sử dụng ứng dụng SStrip, người dùng (bao gồm Chủ cửa hàng, Nhân viên kho và Nhân viên giao hàng) đồng ý tuân thủ toàn bộ các điều khoản dưới đây. Nếu bạn không đồng ý, vui lòng ngừng sử dụng dịch vụ ngay lập tức.\n\n### 2. Mô tả dịch vụ\nSStrip là nền tảng quản lý chuỗi cung ứng và vận chuyển hàng hóa. Ứng dụng cung cấp các công cụ để:\n* Quản lý kho, cửa hàng và nhà cung cấp.\n* Tạo và theo dõi đơn giao hàng.\n* Giám sát lộ trình giao hàng theo thời gian thực trên bản đồ.\n* Quét mã QR để tra cứu sản phẩm và đơn hàng.\n* Nhận thông báo đẩy về trạng thái đơn hàng.\n\n### 3. Tài khoản người dùng\n* **Đăng ký:** Người dùng đăng ký bằng địa chỉ email hoặc số điện thoại. Tài khoản nhân viên được Chủ cửa hàng tạo và phân quyền.\n* **Bảo mật:** Người dùng chịu trách nhiệm bảo vệ thông tin đăng nhập và mọi hoạt động được thực hiện dưới tài khoản của mình.\n* **Phân quyền:** Quyền truy cập các tính năng (tạo, sửa, xóa đơn hàng hoặc dữ liệu) được quản lý thông qua hệ thống vai trò do Chủ cửa hàng phân công.\n\n### 4. Trách nhiệm của người dùng\n* Cung cấp thông tin chính xác và trung thực về hàng hóa (tên, giá, đơn vị, hình ảnh).\n* Cam kết không vận chuyển hàng cấm, chất nổ, hàng lậu hoặc bất kỳ mặt hàng nào vi phạm pháp luật Việt Nam.\n* Không sử dụng ứng dụng cho mục đích gian lận, phá hoại hoặc bất hợp pháp.\n* Đảm bảo hình ảnh tải lên không vi phạm quyền sở hữu trí tuệ của bất kỳ bên thứ ba nào.\n\n### 5. Phí dịch vụ và thanh toán\n* Mọi chi phí liên quan sẽ được hiển thị công khai trong ứng dụng trước khi người dùng xác nhận đơn hàng.\n* Giá sản phẩm được tính bằng VNĐ và hiển thị rõ ràng cho từng mặt hàng.\n\n### 6. Giới hạn trách nhiệm\n* SStrip cung cấp giải pháp công nghệ và không chịu trách nhiệm trực tiếp về chất lượng hàng hóa hoặc sự cố do bên thứ ba gây ra.\n* Mọi khiếu nại về hàng hóa hư hỏng sẽ được giải quyết dựa trên bằng chứng (hình ảnh, biên bản giao nhận) được ghi nhận trong ứng dụng.\n* Chúng tôi không chịu trách nhiệm về việc gián đoạn dịch vụ do lỗi mạng, thiên tai hoặc các sự kiện bất khả kháng.\n\n### 7. Chấm dứt dịch vụ\n* Chúng tôi có quyền tạm ngừng hoặc chấm dứt tài khoản người dùng nếu phát hiện vi phạm các điều khoản này.\n* Người dùng có thể yêu cầu xóa tài khoản bất kỳ lúc nào.\n\n---\n*Cập nhật lần cuối: Ngày 05 tháng 03 năm 2026*';

  @override
  String get privacyPolicyMarkdown =>
      '## CHÍNH SÁCH BẢO MẬT\n\n> Chính sách này được soạn thảo tuân thủ Nghị định 13/2023/NĐ-CP về bảo vệ dữ liệu cá nhân tại Việt Nam.\n\n### 1. Dữ liệu chúng tôi thu thập\n\n**a) Thông tin tài khoản:**\n* Họ tên, email và số điện thoại (khi đăng ký).\n* Mật khẩu (được mã hóa và không bao giờ lưu dưới dạng văn bản thuần).\n* Vai trò và quyền hạn trong hệ thống (Chủ cửa hàng, Nhân viên kho, Nhân viên giao hàng).\n\n**b) Dữ liệu vị trí (GPS):**\n* Vị trí nhân viên giao hàng được thu thập theo thời gian thực, bao gồm cả khi ứng dụng chạy nền, để cập nhật lộ trình giao hàng cho các bên liên quan.\n* Vị trí kho, cửa hàng và nhà cung cấp được lưu để hiển thị trên bản đồ.\n\n**c) Hình ảnh và tệp:**\n* Hình ảnh sản phẩm, kho và cửa hàng do người dùng tải lên.\n* Ảnh chụp từ camera hoặc chọn từ thư viện ảnh phục vụ mục đích quản lý hàng hóa.\n\n**d) Thông tin thiết bị:**\n* Loại thiết bị, hệ điều hành và mã định danh thiết bị để gửi thông báo.\n* Thông tin lỗi ứng dụng được thu thập tự động để cải thiện chất lượng phần mềm.\n\n**e) Dữ liệu kinh doanh:**\n* Thông tin đơn hàng: người tạo, sản phẩm, số lượng, giá, trạng thái và ghi chú.\n* Thông tin nhà cung cấp: tên, địa chỉ, số điện thoại và danh mục sản phẩm.\n* Thông tin kho và cửa hàng: tên, địa chỉ, tọa độ và mô tả.\n\n### 2. Mục đích sử dụng dữ liệu\n\n* **Vận hành:** Quản lý kho, cửa hàng, đơn hàng và kết nối việc giao hàng với nhân viên phù hợp.\n* **Theo dõi:** Hiển thị vị trí giao hàng theo thời gian thực trên bản đồ để đảm bảo an toàn hàng hóa.\n* **Thông báo:** Gửi thông báo đẩy về trạng thái đơn hàng và cập nhật hệ thống.\n* **Hỗ trợ:** Giải quyết tranh chấp hoặc khiếu nại dựa trên dữ liệu giao dịch đã lưu.\n* **Cải thiện:** Phân tích lỗi và cải thiện tính năng dựa trên hành vi sử dụng.\n\n### 3. Quyền truy cập thiết bị\n\nỨng dụng yêu cầu các quyền sau trên thiết bị của bạn:\n\n| Quyền | Mục đích |\n|------------|---------|\n| Vị trí (khi sử dụng) | Hiển thị vị trí trên bản đồ, tìm nhà cung cấp gần nhất |\n| Vị trí (chạy nền) | Theo dõi liên tục lộ trình giao hàng (chỉ nhân viên giao hàng) |\n| Camera | Chụp ảnh sản phẩm, quét mã QR |\n| Thư viện ảnh | Chọn ảnh sản phẩm và kho từ thiết bị |\n| Thông báo | Nhận thông báo trạng thái đơn hàng và cập nhật hệ thống |\n| Bộ nhớ | Lưu dữ liệu cục bộ để cải thiện hiệu năng |\n\nBạn có thể tắt bất kỳ quyền nào trong **Cài đặt** của điện thoại. Tuy nhiên, việc tắt một số quyền có thể ảnh hưởng đến chức năng của ứng dụng.\n\n### 4. Chia sẻ thông tin\n\nChúng tôi cam kết **không bán** dữ liệu cá nhân cho bên thứ ba. Dữ liệu chỉ được chia sẻ trong các trường hợp sau:\n* **Trong nội bộ hệ thống:** Nhân viên giao hàng có thể xem thông tin đơn hàng (địa chỉ giao, sản phẩm); chủ cửa hàng có thể xem vị trí nhân viên giao hàng.\n* **Nhà cung cấp dịch vụ bản đồ:** Đối tác bản đồ nhận dữ liệu vị trí để hiển thị bản đồ và tính toán lộ trình.\n* **Dịch vụ thông báo:** Nhà cung cấp dịch vụ thông báo đẩy nhận mã định danh thiết bị để gửi thông báo.\n* **Cơ quan có thẩm quyền:** Khi có yêu cầu bằng văn bản theo quy định của pháp luật Việt Nam.\n\n### 5. Quyền của bạn (Theo Nghị định 13/2023/NĐ-CP)\n\nBạn có quyền:\n1. **Truy cập và Chỉnh sửa:** Cập nhật thông tin cá nhân (tên, số điện thoại) bất kỳ lúc nào trong mục Tài khoản.\n2. **Xóa dữ liệu:** Yêu cầu xóa tài khoản và dữ liệu liên quan bằng cách liên hệ bộ phận hỗ trợ.\n3. **Rút quyền:** Tắt quyền truy cập vị trí, camera hoặc thông báo trong cài đặt điện thoại.\n4. **Phản đối xử lý:** Phản đối việc xử lý dữ liệu cá nhân trong một số trường hợp theo quy định của pháp luật.\n\n### 6. Lưu trữ và bảo mật\n\n* Dữ liệu được truyền qua các giao thức mã hóa an toàn.\n* Dữ liệu nhạy cảm (mật khẩu) được mã hóa trước khi lưu trữ.\n* Dữ liệu cục bộ trên thiết bị được lưu bằng cơ sở dữ liệu được mã hóa.\n* Hệ thống sử dụng kết nối an toàn để theo dõi giao hàng theo thời gian thực.\n\n### 7. Thời gian lưu trữ dữ liệu\n\n* Dữ liệu tài khoản: Được lưu cho đến khi người dùng yêu cầu xóa.\n\n---\n*Cập nhật lần cuối: Ngày 05 tháng 03 năm 2026*';

  @override
  String get dangerZone => 'VÙNG NGUY HIỂM';

  @override
  String get deleteAccount => 'Xóa tài khoản';

  @override
  String get deleteAccountConfirm =>
      'Bạn có chắc chắn muốn xóa tài khoản này không?';

  @override
  String get logout => 'Đăng xuất';

  @override
  String get logoutConfirm => 'Bạn có chắc chắn muốn đăng xuất không?';

  @override
  String get employeeLogoutConfirm =>
      'Bạn có chắc chắn muốn đăng xuất khỏi tài khoản nhân viên không?';

  @override
  String get appVersion => 'PHIÊN BẢN ỨNG DỤNG';

  @override
  String get language => 'Ngôn ngữ';

  @override
  String get selectLanguage => 'Chọn ngôn ngữ';

  @override
  String get employeeList => 'Danh sách nhân viên';

  @override
  String get cancel => 'Hủy';

  @override
  String get save => 'Lưu';

  @override
  String get pickupPoints => 'Nhập hàng';

  @override
  String get warehouses => 'Kho hàng';

  @override
  String get importGoods => 'Nhập hàng';

  @override
  String get stores => 'Cửa hàng';

  @override
  String get createPickupPoint => 'Tạo điểm lấy hàng';

  @override
  String get createProduct => 'Tạo sản phẩm';

  @override
  String get createWarehouse => 'Tạo kho';

  @override
  String get createStore => 'Tạo cửa hàng';

  @override
  String get appName => 'SStrip';

  @override
  String get findAddress => 'Tìm địa chỉ';

  @override
  String get searchAddress => 'Tìm kiếm địa chỉ';

  @override
  String get selectThisLocation => 'Chọn vị trí này';

  @override
  String get orderFromWarehouse => 'Đặt hàng từ kho';

  @override
  String get orderSuccessfully => 'Đặt hàng thành công';

  @override
  String get pleaseSelectProduct => 'Vui lòng chọn sản phẩm';

  @override
  String get pleaseSelectDeliveryPoint => 'Vui lòng chọn điểm giao hàng';

  @override
  String get placeOrder => 'Đặt hàng';

  @override
  String get pending => 'Chờ xử lý';

  @override
  String get processing => 'Đang xử lý';

  @override
  String get completed => 'Hoàn thành';

  @override
  String get delivered => 'Đã giao';

  @override
  String get cancelled => 'Đã hủy';

  @override
  String get failed => 'Thất bại';

  @override
  String get deliveryPoint => 'Điểm giao hàng';

  @override
  String get createdDate => 'Ngày tạo';

  @override
  String get notes => 'Ghi chú';

  @override
  String get note => 'Ghi chú';

  @override
  String get enterNote => 'Nhập ghi chú';

  @override
  String get customer => 'Khách hàng';

  @override
  String get location => 'Vị trí';

  @override
  String get time => 'Thời gian';

  @override
  String get confirm => 'Xác nhận';

  @override
  String get sessionExpiredTitle => 'Phiên đã hết hạn';

  @override
  String get sessionExpiredMessage =>
      'Phiên của bạn đã hết hạn, vui lòng đăng nhập lại';

  @override
  String get total => 'Tổng';

  @override
  String get totalAmount => 'Tổng tiền';

  @override
  String get noOrdersYet => 'Chưa có đơn hàng';

  @override
  String get noOrders => 'Không có đơn hàng';

  @override
  String get turnOnLocation => 'Truy cập vị trí';

  @override
  String get locationPermissionDescription =>
      'Chúng tôi cần quyền truy cập vị trí để theo dõi lộ trình và hỗ trợ dịch vụ giao hàng tốt nhất.';

  @override
  String orderCompletedWithId(String id) {
    return 'Đơn hàng $id đã hoàn thành';
  }

  @override
  String get confirmCancelOrderTitle => 'Hủy đơn hàng';

  @override
  String get confirmCancelOrderMessage =>
      'Bạn có chắc chắn muốn hủy đơn hàng này không?';

  @override
  String get noProductsSelected => 'Chưa chọn sản phẩm nào';

  @override
  String get selectProductsFromWarehouseToStart =>
      'Chọn sản phẩm từ kho để bắt đầu';

  @override
  String get selectProductsFromSupplierToStart =>
      'Chọn sản phẩm từ nhà cung cấp để bắt đầu';

  @override
  String orderNumberTitle(String shortId) {
    return 'Đơn hàng #$shortId';
  }

  @override
  String get deliveringOrders => 'Đơn chờ giao';

  @override
  String get deliveredOrders => 'Đơn đã giao';

  @override
  String get receivedOrders => 'Đơn đã nhận';

  @override
  String get purchasedOrders => 'Đơn đã mua';

  @override
  String get cancelledOrders => 'Đơn đã hủy';

  @override
  String get completedOrders => 'Đơn hoàn thành';

  @override
  String get supplier => 'Nhà cung cấp';

  @override
  String get noSuppliersYet => 'Chưa có nhà cung cấp';

  @override
  String get addSupplierToStart => 'Thêm nhà cung cấp để bắt đầu lấy hàng';

  @override
  String get noWarehousesYet => 'Chưa có kho hàng';

  @override
  String get addWarehouseToStart => 'Thiết lập kho để bắt đầu quản lý';

  @override
  String get noStoresYet => 'Chưa có cửa hàng';

  @override
  String get addStoreToStart => 'Thiết lập cửa hàng để bắt đầu bán hàng';

  @override
  String get warehouse => 'Kho hàng';

  @override
  String get product => 'Sản phẩm';

  @override
  String get quantity => 'Số lượng';

  @override
  String orderedQuantity(int count) {
    return 'Đã đặt: x$count';
  }

  @override
  String supplierCount(int count) {
    return '$count nhà cung cấp';
  }

  @override
  String itemCount(int count) {
    return '$count mặt hàng';
  }

  @override
  String quantityCount(int count) {
    return 'Số lượng $count';
  }

  @override
  String receivedQuantityLabel(int received, int quantity) {
    return 'Đã nhận: $received/$quantity';
  }

  @override
  String get receivedEnough => 'Đủ';

  @override
  String get receivedShort => 'Chưa đủ';

  @override
  String get continueDelivery => 'Tiếp tục giao hàng';

  @override
  String productsAndQuantitySummary(int productCount, int totalQuantity) {
    return '$productCount mặt hàng • $totalQuantity số lượng';
  }

  @override
  String totalProducts(int totalQuantity) {
    return 'Tổng $totalQuantity sản phẩm';
  }

  @override
  String get createOrder => 'Tạo đơn hàng';

  @override
  String get createImportOrder => 'Tạo đơn nhập hàng';

  @override
  String get createTransferOrder => 'Tạo đơn chuyển hàng';

  @override
  String get createRequestOrder => 'Tạo yêu cầu';

  @override
  String get deliverTo => 'Giao đến: ';

  @override
  String get price => 'Giá';

  @override
  String get warehouseName => 'Tên kho';

  @override
  String get supplierName => 'Tên nhà cung cấp';

  @override
  String get productCode => 'Mã sản phẩm';

  @override
  String get enterProductCode => 'Nhập mã sản phẩm';

  @override
  String get scanCode => 'Quét mã';

  @override
  String get warrantyPeriod => 'Thời hạn bảo hành';

  @override
  String get updateProductCode => 'Cập nhật mã sản phẩm';

  @override
  String get updateSuccessfully => 'Cập nhật thành công';

  @override
  String months(String value) {
    return '$value tháng';
  }

  @override
  String years(String value) {
    return '$value năm';
  }

  @override
  String get home => 'Trang chủ';

  @override
  String get order => 'Đơn hàng';

  @override
  String get storeInfo => 'THÔNG TIN CỬA HÀNG';

  @override
  String get guide => 'Hướng dẫn';

  @override
  String get setupNewStore => 'Thiết lập cửa hàng mới';

  @override
  String get close => 'Đóng';

  @override
  String get exampleStoreName => 'VD: Cửa hàng Quận 1';

  @override
  String get description => 'Mô tả';

  @override
  String get additionalInfo => 'Thông tin thêm...';

  @override
  String get saveStore => 'Lưu cửa hàng';

  @override
  String get supplierInfo => 'THÔNG TIN NHÀ CUNG CẤP';

  @override
  String get setupNewSupplier => 'Thiết lập nhà cung cấp mới';

  @override
  String get exampleSupplierName => 'VD: Đại lý Thành Công';

  @override
  String get phoneNumber => 'Số điện thoại';

  @override
  String get examplePhoneNumber => '0123 456 789';

  @override
  String get addressHint => 'Số nhà, đường, quận/huyện...';

  @override
  String get saveSupplier => 'Lưu nhà cung cấp';

  @override
  String get pleaseSelectAddressBeforeSaving =>
      'Vui lòng chọn địa chỉ trước khi lưu';

  @override
  String get pleaseEnterSupplierName => 'Vui lòng nhập tên nhà cung cấp';

  @override
  String get warehouseInfo => 'THÔNG TIN KHO HÀNG';

  @override
  String get setupNewWarehouse => 'Thiết lập kho mới';

  @override
  String get createSupplierShowcaseDescription =>
      'Nhấn vào đây để tạo kho đầu tiên và bắt đầu quản lý nhà cung cấp và sản phẩm.';

  @override
  String get exampleWarehouseName => 'VD: Kho A';

  @override
  String get saveWarehouse => 'Lưu kho';

  @override
  String get productInfo => 'THÔNG TIN SẢN PHẨM';

  @override
  String get addProduct => 'Thêm sản phẩm';

  @override
  String get productName => 'Tên sản phẩm';

  @override
  String get enterProductName => 'Nhập tên sản phẩm';

  @override
  String get enterPrice => 'Nhập giá';

  @override
  String get saveProduct => 'Lưu sản phẩm';

  @override
  String get editProduct => 'Sửa sản phẩm';

  @override
  String get deleteProduct => 'Xóa sản phẩm';

  @override
  String get warrantyProduct => 'Bảo hành sản phẩm';

  @override
  String get createNewEmployee => 'Tạo nhân viên mới';

  @override
  String get employeeName => 'Tên nhân viên';

  @override
  String get enterEmployeeName => 'Nhập tên nhân viên';

  @override
  String get password => 'Mật khẩu';

  @override
  String get enterPassword => 'Nhập mật khẩu';

  @override
  String get role => 'Vai trò';

  @override
  String get inventoryManagement => 'Quản lý kho';

  @override
  String get delivery => 'Giao hàng';

  @override
  String get sales => 'Bán hàng';

  @override
  String get deliveryVehicle => 'Phương tiện giao hàng';

  @override
  String get motorcycle => 'Xe máy';

  @override
  String get truck => 'Xe tải';

  @override
  String get create => 'Tạo';

  @override
  String get chatPage => 'Trang trò chuyện';

  @override
  String get chatFunctionality => 'Chức năng trò chuyện sẽ ở đây';

  @override
  String get profile => 'Hồ sơ';

  @override
  String get settings => 'Cài đặt';

  @override
  String get store => 'Cửa hàng';

  @override
  String get enableGps => 'Tiếp tục';

  @override
  String trackingInfoUpdated(String data) {
    return 'Đã cập nhật thông tin theo dõi: $data';
  }

  @override
  String get reject => 'Từ chối';

  @override
  String get acceptOrder => 'Nhận đơn';

  @override
  String get declineOrder => 'Từ chối đơn';

  @override
  String detailsTitle(String index) {
    return 'Chi tiết $index';
  }

  @override
  String get orderInformation => 'Thông tin đơn hàng';

  @override
  String detailedViewForOrder(String index) {
    return 'Xem chi tiết đơn hàng #$index';
  }

  @override
  String get demoCustomerName => 'Nguyễn Văn A';

  @override
  String get demoOrderLocation => '123 Đường Chính, Quận 1, TP.HCM';

  @override
  String get demoOrderTime => '10:30 - Hôm nay';

  @override
  String get demoOrderNotes =>
      'Khách hàng yêu cầu giao hàng cẩn thận và gọi điện trước khi đến.';

  @override
  String get settingsMapRemovedDescription =>
      'Chức năng bản đồ đã bị gỡ khỏi cài đặt. Vui lòng chuyển sang MapLibre.';

  @override
  String get noProducts => 'Không có sản phẩm';

  @override
  String get addProductsToCategory => 'Thêm sản phẩm vào danh mục này.';

  @override
  String get completeOrder => 'Hoàn thành đơn';

  @override
  String get receiveOrder => 'Nhận đơn';

  @override
  String get pickupCompleted => 'Đã lấy hàng';

  @override
  String get refreshList => 'Làm mới danh sách';

  @override
  String get enableGPS => 'Tiếp tục';

  @override
  String get start => 'Bắt đầu';

  @override
  String get back => 'Quay lại';

  @override
  String get scanQRReceiveNotification =>
      'Quét QR, nhận thông báo\nvà bắt đầu ngay';

  @override
  String get manageWarehouseStore => 'Quản lý kho, cửa hàng\nvà nhà cung cấp';

  @override
  String get createOrderTrackShipment =>
      'Tạo đơn và theo dõi giao hàng\ntheo thời gian thực';

  @override
  String get sstripPlatform => 'SStrip - nền tảng vận hành\nchuỗi cung ứng';

  @override
  String get search => 'Tìm kiếm';

  @override
  String get anErrorOccurred => 'Đã xảy ra lỗi';

  @override
  String error(String message) {
    return 'Lỗi: $message';
  }

  @override
  String get noName => 'Chưa có tên';

  @override
  String get noPhoneNumber => 'Chưa có số điện thoại';

  @override
  String get noEmployees => 'Không có nhân viên';

  @override
  String get pressButtonToAddEmployee =>
      'Nhấn nút bên dưới để thêm nhân viên mới';

  @override
  String get loading => 'Đang tải...';

  @override
  String get storeList => 'Danh sách cửa hàng';

  @override
  String get productsAtCounter => 'Sản phẩm tại quầy';

  @override
  String get salesHistory => 'Lịch sử bán hàng';

  @override
  String get windbreakerJacket => 'Áo khoác gió';

  @override
  String get sportSneakers => 'Giày thể thao';

  @override
  String get meshCap => 'Mũ lưới';

  @override
  String get khakiPants => 'Quần kaki';

  @override
  String get completeProductInfoInOneGo =>
      'Chọn nhà cung cấp và hoàn thiện thông tin từng sản phẩm để cập nhật danh mục gọn gàng trong một lần.';

  @override
  String get locked => 'Đã khóa';

  @override
  String get changeSupplier => 'Đổi nhà cung cấp';

  @override
  String get selectSupplier => 'Chọn nhà cung cấp';

  @override
  String get tapToChooseSupplierBeforeAddingProducts =>
      'Nhấn để chọn nhà cung cấp trước khi thêm sản phẩm.';

  @override
  String productNumber(int number) {
    return 'Sản phẩm $number';
  }

  @override
  String get newestItem => 'Mặt hàng mới nhất';

  @override
  String get uploadImage => 'TẢI ẢNH LÊN';

  @override
  String get changeImage => 'Đổi ảnh';

  @override
  String get pleaseSelectSupplierBeforeSaving =>
      'Vui lòng chọn nhà cung cấp trước khi lưu.';

  @override
  String get pleaseSelectImagesBeforeSaving =>
      'Vui lòng chọn ảnh cho tất cả sản phẩm trước khi lưu.';

  @override
  String get productType => 'Loại sản phẩm';

  @override
  String get selectType => '-- Chọn loại --';

  @override
  String get vnd => 'VNĐ';

  @override
  String get materialPieceType => 'Vật tư (cái)';

  @override
  String get materialKilogramType => 'Vật tư (kg)';

  @override
  String get materialBoxType => 'Vật tư (thùng)';

  @override
  String get pieceUnit => 'cái';

  @override
  String get kilogramUnit => 'kg';

  @override
  String get boxUnit => 'thùng';

  @override
  String get active => 'Hoạt động';

  @override
  String get noData => 'Không có dữ liệu';

  @override
  String get chat => 'Trò chuyện';

  @override
  String get chatFunctionalityComingSoon => 'Chức năng trò chuyện sẽ ở đây';

  @override
  String get owner => 'Chủ cửa hàng';

  @override
  String get employee => 'Nhân viên';

  @override
  String get welcomeBack => 'Chào mừng trở lại';

  @override
  String get loginToContinueManagingStore =>
      'Đăng nhập để tiếp tục quản lý cửa hàng của bạn';

  @override
  String get email => 'Email';

  @override
  String get enterEmail => 'Nhập địa chỉ email';

  @override
  String get enterPhone => 'Nhập số điện thoại';

  @override
  String get loginFailed => 'Đăng nhập thất bại';

  @override
  String get login => 'Đăng nhập';

  @override
  String get dontHaveAccountRegisterNow => 'Chưa có tài khoản? Tạo miễn phí';

  @override
  String get createAccount => 'Tạo tài khoản miễn phí';

  @override
  String get registerToStartManagingStore =>
      'Tạo tài khoản SStrip miễn phí để bắt đầu';

  @override
  String get userName => 'Tên đăng nhập';

  @override
  String get enterName => 'Nhập tên của bạn';

  @override
  String get confirmPassword => 'Xác nhận mật khẩu';

  @override
  String get enterConfirmPassword => 'Nhập lại mật khẩu';

  @override
  String get passwordsMatch => 'Mật khẩu khớp';

  @override
  String get passwordsDoNotMatch => 'Mật khẩu không khớp';

  @override
  String get registerFailed => 'Đăng ký thất bại';

  @override
  String get register => 'Đăng ký';

  @override
  String get alreadyHaveAccountLogin => 'Đã có tài khoản? Đăng nhập';

  @override
  String get onboardingOverviewTitle =>
      'SStrip - nền tảng vận hành\nchuỗi cung ứng';

  @override
  String get onboardingOverviewDescription =>
      'Quản lý kho bãi, luân chuyển hàng hóa và mạng lưới phân phối tập trung trong một ứng dụng duy nhất.';

  @override
  String get onboardingOverviewHeadline => 'Một màn hình - nhiều quy trình';

  @override
  String get onboardingOverviewHighlight1 => 'Chuỗi cung ứng';

  @override
  String get onboardingOverviewHighlight2 => 'Vận chuyển hàng hóa';

  @override
  String get onboardingOverviewHighlight3 => 'Dữ liệu tập trung';

  @override
  String get onboardingOverviewStat1 => 'Kho hàng';

  @override
  String get onboardingOverviewStat2 => 'Cửa hàng';

  @override
  String get onboardingOverviewStat3 => 'Nhà cung cấp';

  @override
  String get onboardingLocationsTitle =>
      'Quản lý kho, cửa hàng\nvà nhà cung cấp';

  @override
  String get onboardingLocationsDescription =>
      'Thiết lập và giám sát các địa điểm vận hành quan trọng để kiểm soát tồn kho, nguồn cung và mạng lưới phân phối chính xác hơn.';

  @override
  String get onboardingLocationsHeadline => 'Hệ sinh thái điểm bán rõ ràng';

  @override
  String get onboardingLocationsHighlight1 => 'Kho hàng';

  @override
  String get onboardingLocationsHighlight2 => 'Cửa hàng';

  @override
  String get onboardingLocationsHighlight3 => 'Nhà cung cấp';

  @override
  String get onboardingLocationsStat1 => 'Theo dõi địa điểm';

  @override
  String get onboardingLocationsStat2 => 'Đồng bộ thông tin';

  @override
  String get onboardingLocationsStat3 => 'Mở rộng hệ thống';

  @override
  String get onboardingDeliveryTitle =>
      'Tạo đơn và theo dõi\ngiao hàng theo thời gian thực';

  @override
  String get onboardingDeliveryDescription =>
      'Tạo đơn vận chuyển nhanh chóng, theo dõi lộ trình giao hàng trên bản đồ và cập nhật trạng thái tức thì trong suốt hành trình.';

  @override
  String get onboardingDeliveryHeadline =>
      'Logistics minh bạch theo thời gian thực';

  @override
  String get onboardingDeliveryHighlight1 => 'Tạo đơn nhanh';

  @override
  String get onboardingDeliveryHighlight2 => 'Theo dõi lộ trình';

  @override
  String get onboardingDeliveryHighlight3 => 'Cập nhật trạng thái';

  @override
  String get onboardingDeliveryStat1 => 'Bản đồ trực quan';

  @override
  String get onboardingDeliveryStat2 => 'Tiến độ giao hàng';

  @override
  String get onboardingDeliveryStat3 => 'Xử lý chủ động';

  @override
  String get onboardingReadyTitle => 'Kết nối & ';

  @override
  String get onboardingReadyDescription =>
      'Tra cứu sản phẩm và đơn hàng bằng mã QR và nhận thông báo đẩy để luôn cập nhật hoạt động mới nhất.';

  @override
  String get onboardingReadyHeadline => 'Sẵn sàng vào ứng dụng';

  @override
  String get onboardingReadyHighlight1 => 'Quét QR';

  @override
  String get onboardingReadyHighlight2 => 'Tra cứu đơn hàng';

  @override
  String get onboardingReadyHighlight3 => 'Thông báo đẩy';

  @override
  String get onboardingReadyStat1 => 'Chính xác';

  @override
  String get onboardingReadyStat2 => 'Nhanh chóng';

  @override
  String get onboardingReadyStat3 => 'Luôn cập nhật';

  @override
  String get purchaseCompleted => 'Đã lấy hàng';

  @override
  String get deliverToWarehouse => 'Giao về kho';

  @override
  String get startDelivery => 'Bắt đầu giao hàng';

  @override
  String get complete => 'Hoàn thành';

  @override
  String get isEnd => 'Đã hết danh sách';

  @override
  String get shippingTab => 'Giao hàng';

  @override
  String get switchWarehouseTab => 'Chuyển kho';

  @override
  String get requestTab => 'Yêu cầu';

  @override
  String get pleaseEnterWarehouseName => 'Vui lòng nhập tên kho';

  @override
  String get transferToWarehouse => 'Chuyển đến kho';

  @override
  String get nearlyOutOfStock => 'Sắp hết hàng';

  @override
  String get updateMinimumQuantity => 'Cập nhật số lượng tối thiểu';

  @override
  String get minimumQuantity => 'Số lượng tối thiểu';

  @override
  String get enterMinimumQuantity => 'Nhập số lượng tối thiểu';

  @override
  String get pleaseEnterValidMinimumQuantity =>
      'Vui lòng nhập số lượng tối thiểu hợp lệ';

  @override
  String minCount(String count) {
    return 'Tối thiểu: $count';
  }

  @override
  String get onboardingSstripTag => 'SSTRIP';

  @override
  String get onboardingSstripTitle => 'Logistics thông minh ';

  @override
  String get onboardingSstripTitleEm => 'Đơn giản hóa chuỗi cung ứng';

  @override
  String get onboardingSstripDesc =>
      'Kết nối kho hàng, nhà cung cấp và tài xế trên một nền tảng duy nhất.';

  @override
  String get onboardingFeatureTag => 'TÍNH NĂNG';

  @override
  String get onboardingFeatureTitle => 'Quản lý ';

  @override
  String get onboardingFeatureTitleEm => 'thế hệ mới';

  @override
  String get onboardingFeatureDesc =>
      'Công cụ mạnh mẽ để tối ưu hoạt động logistics hằng ngày của bạn.';

  @override
  String get onboardingStartTag => 'BẮT ĐẦU';

  @override
  String get onboardingStartTitle => 'Thiết lập trong ';

  @override
  String get onboardingStartTitleEm => 'vài phút';

  @override
  String get onboardingStartDesc =>
      'Thiết lập hệ thống logistics của bạn nhanh chóng và dễ dàng.';

  @override
  String get onboardingReadyTag => 'SẴN SÀNG';

  @override
  String get onboardingReadyTitleEm => 'Bắt đầu ngay hôm nay';

  @override
  String get onboardingReadyDesc =>
      'Bắt đầu quản lý hàng hóa và đơn hàng với SStrip.';

  @override
  String get onboardingWelcome => '🎉 Chào mừng đến với SStrip!';

  @override
  String get onboardingSkip => 'Bỏ qua';

  @override
  String get onboardingStartNow => 'Bắt đầu ngay';

  @override
  String get onboardingNext => 'Tiếp theo';

  @override
  String get onboardingFeatOrderTitle => 'Quản lý đơn hàng';

  @override
  String get onboardingFeatOrderDesc => 'Tạo & theo dõi từ kho đến người nhận';

  @override
  String get onboardingFeatMapTitle => 'Theo dõi bản đồ';

  @override
  String get onboardingFeatMapDesc =>
      'Vị trí và lộ trình tài xế theo thời gian thực';

  @override
  String get onboardingFeatReportTitle => 'Báo cáo kho';

  @override
  String get onboardingFeatReportDesc => 'Thống kê tồn kho và lịch sử';

  @override
  String get onboardingStep1Title => 'Tạo tài khoản miễn phí';

  @override
  String get onboardingStep1Desc =>
      'Đăng ký trong vài giây để bắt đầu sử dụng SStrip';

  @override
  String get onboardingStep2Title => 'Thiết lập kho & sản phẩm';

  @override
  String get onboardingStep2Desc => 'Thêm kho, nhà cung cấp và danh mục';

  @override
  String get onboardingStep3Title => 'Tạo & phân công';

  @override
  String get onboardingStep3Desc => 'Tạo và phân công đơn hàng tự động';

  @override
  String get onboardingStep4Title => 'Theo dõi & xác nhận';

  @override
  String get onboardingStep4Desc =>
      'Theo dõi thời gian thực và xác nhận giao hàng';

  @override
  String get onboardingOwner => 'Chủ cửa hàng';

  @override
  String get onboardingDriver => 'Tài xế';

  @override
  String get onboardingWarehouse => 'Kho hàng';

  @override
  String get onboardingBubbleOwner => 'Người gửi';

  @override
  String get onboardingBubbleDriver => 'Tài xế';

  @override
  String get onboardingBubbleWarehouse => 'Kho hàng';

  @override
  String get onboardingBubbleSupply => 'Nhà cung cấp';

  @override
  String get interfaceTitle => 'GIAO DIỆN';

  @override
  String get themeTitle => 'Giao diện';

  @override
  String get themeAuto => 'Theo hệ thống';

  @override
  String get themeLight => 'Sáng';

  @override
  String get themeDark => 'Tối';

  @override
  String get selectTheme => 'Chọn giao diện';

  @override
  String get paymentSection => 'THANH TOÁN';

  @override
  String get currencyTitle => 'Tiền tệ';

  @override
  String get cash => 'Tiền mặt';

  @override
  String get bankTransfer => 'Chuyển khoản';

  @override
  String get nodeColor => 'Màu node';

  @override
  String get selectNodeColor => 'Chọn màu';

  @override
  String get orderUpdateCompletedSuccess => 'Hoàn thành đơn hàng thành công';

  @override
  String get orderUpdateCancelledSuccess => 'Hủy đơn hàng thành công';

  @override
  String get priceNotUpdated => 'Chưa cập nhật giá';

  @override
  String get invalidPriceTitle => 'Giá không hợp lệ';

  @override
  String get invalidPriceMessage =>
      'Một số sản phẩm có giá không hợp lệ hoặc chưa được cập nhật. Vui lòng kiểm tra lại.';

  @override
  String get nameNotUpdated => '(Chưa cập nhật tên)';

  @override
  String get unitPrice => 'Đơn giá';

  @override
  String get select => 'Chọn';

  @override
  String get clearAll => 'Xóa tất cả';

  @override
  String get recent => 'Gần đây';

  @override
  String get scanInstruction => 'Đặt mã vạch vào khung để quét';

  @override
  String get updateProductCodeHelper =>
      'Thông tin bảo hành sẽ được lưu cùng mã sản phẩm.';

  @override
  String get monthsTitle => 'Tháng';

  @override
  String get yearsTitle => 'Năm';

  @override
  String get pleaseEnterProductCode => 'Vui lòng nhập mã sản phẩm';

  @override
  String addPhotos(int count) {
    return 'Thêm $count ảnh';
  }

  @override
  String get clearSelectedProducts => 'Xóa sản phẩm đã chọn';

  @override
  String get confirmClearSelectedProducts =>
      'Bạn có muốn xóa tất cả sản phẩm đã chọn không?';

  @override
  String get movingTo => 'Đang chuyển đến';

  @override
  String get deliverySuccess => 'Giao hàng thành công';

  @override
  String get products => 'Sản phẩm';

  @override
  String deliveryToWarehouseCompleted(String name) {
    return 'Đã giao đến kho $name';
  }

  @override
  String deliveryToStoreCompleted(String name) {
    return 'Đã giao đến cửa hàng $name';
  }

  @override
  String get selectProductFromStoreToStart =>
      'Chọn sản phẩm từ cửa hàng để bắt đầu';

  @override
  String get sold => 'Đã bán';

  @override
  String get minStock => 'Tồn kho tối thiểu';

  @override
  String get updatePrice => 'Cập nhật giá bán';

  @override
  String get sellingPrice => 'Giá bán';

  @override
  String get purchasePrice => 'Giá nhập';

  @override
  String get updateProduct => 'Cập nhật sản phẩm';

  @override
  String get delete => 'Xóa';

  @override
  String get confirmDeleteProduct =>
      'Bạn có chắc chắn muốn xóa sản phẩm này không?';

  @override
  String get edit => 'Sửa';

  @override
  String get information => 'Thông tin';

  @override
  String get noInformation => 'Không có thông tin';

  @override
  String get confirmDeleteSupplier =>
      'Bạn có chắc chắn muốn xóa nhà cung cấp này không?';

  @override
  String get confirmDeleteWarehouse =>
      'Bạn có chắc chắn muốn xóa kho này không?';

  @override
  String get confirmDeleteStore =>
      'Bạn có chắc chắn muốn xóa cửa hàng này không?';

  @override
  String confirmDeleteRole(String roleName) {
    return 'Bạn có chắc chắn muốn xóa vai trò $roleName không?';
  }

  @override
  String get deleteActionCannotBeUndone => 'Hành động này không thể hoàn tác.';

  @override
  String get receiptSuccessFully => 'Nhập hàng thành công';

  @override
  String get deleteCategory => 'Xóa danh mục';

  @override
  String get deleteCategoryConfirmation =>
      'Bạn có chắc chắn muốn xóa danh mục này không?';

  @override
  String get createCategory => 'Tạo danh mục';

  @override
  String get categoryName => 'Tên danh mục';

  @override
  String get unit => 'Đơn vị';

  @override
  String get deleteSuccess => 'Xóa thành công';

  @override
  String get confirmDeleteEmployee =>
      'Bạn có chắc chắn muốn xóa nhân viên này không?';

  @override
  String get addRole => 'Thêm vai trò';

  @override
  String currentQuantity(int quantity) {
    return 'Số lượng hiện tại: $quantity';
  }

  @override
  String remainingQuantity(int count) {
    return 'Còn: $count';
  }

  @override
  String get enterSplitQuantity => 'Nhập số lượng cần tách';

  @override
  String get splitQuantityHint => 'Số lượng (ví dụ: 10)';

  @override
  String splitQuantityInvalid(int quantity) {
    return 'Số lượng phải > 0 và < $quantity';
  }

  @override
  String get splitProduct => 'Tách sản phẩm';

  @override
  String get productCannotBeSplit => 'Sản phẩm này không thể tách.';

  @override
  String get mergeProduct => 'Gộp sản phẩm';

  @override
  String get selectProductsToMerge => 'Chọn sản phẩm cần gộp vào mục này';

  @override
  String get noProductsToMerge => 'Không có sản phẩm nào để gộp';

  @override
  String mergeProductConfirm(int count) {
    return 'Gộp $count sản phẩm đã chọn?';
  }

  @override
  String get cannotMergeDifferentCode => 'Sản phẩm khác mã không thể gộp';

  @override
  String get cannotMergeDifferentExpiry => 'Không thể gộp do khác hạn sử dụng';

  @override
  String get manufacturingDate => 'Ngày sản xuất';

  @override
  String get expirationDate => 'Hạn sử dụng (dự kiến)';

  @override
  String get outOfStock => 'Hết hàng';

  @override
  String confirmDeleteItem(String name) {
    return 'Bạn có chắc chắn muốn xóa $name không?';
  }

  @override
  String get billFromStore => 'Hóa đơn từ cửa hàng';

  @override
  String get orderFromStore => 'Đặt hàng từ cửa hàng';

  @override
  String get viewLocation => 'Xem vị trí';

  @override
  String get defaultCurrency => 'Tiền tệ mặc định';

  @override
  String get selectCurrency => 'Chọn tiền tệ';

  @override
  String get productCodeNotUpdated => 'Chưa cập nhật mã sản phẩm';

  @override
  String get mfgDateNotUpdated => 'Chưa cập nhật ngày sản xuất';

  @override
  String get expired => 'Đã hết hạn';

  @override
  String expiresInDays(int days) {
    return 'Hết hạn sau $days ngày';
  }

  @override
  String get longPressToSelectProduct => 'Nhấn giữ vào sản phẩm để chọn';

  @override
  String deleteItemConfirmation(String name) {
    return 'Bạn có chắc chắn muốn xóa $name không?';
  }

  @override
  String get pickingUpGoods => 'ĐANG LẤY HÀNG';

  @override
  String get deliveringGoods => 'ĐANG GIAO HÀNG';

  @override
  String get selectDeliveryPoint => '- Chọn điểm giao hàng -';

  @override
  String get storeDescriptionHint =>
      'Hoàn thiện thông tin nhận diện và vị trí để cửa hàng hiển thị rõ ràng trong hệ thống.';

  @override
  String get supplierDescriptionHint =>
      'Sắp xếp thông tin liên hệ và địa chỉ rõ ràng để dễ dàng theo dõi hàng hóa trong chuỗi cung ứng.';

  @override
  String get warehouseDescriptionHint =>
      'Thêm thông tin nhận diện, vị trí và ghi chú để đội ngũ quản lý kho dễ dàng hơn.';

  @override
  String get selectCurrencyToStart => 'Vui lòng chọn tiền tệ để bắt đầu';

  @override
  String quantityWithCount(String count) {
    return 'Số lượng $count';
  }

  @override
  String get updateSupplierImage => 'Cập nhật ảnh nhà cung cấp';

  @override
  String get currentImage => 'Ảnh hiện tại';

  @override
  String get selectImage => 'Chọn ảnh';

  @override
  String get selectFromDevice => 'Chọn từ thiết bị';

  @override
  String get updateWarehouseImage => 'Cập nhật ảnh kho';

  @override
  String get noProductData => 'Không có dữ liệu sản phẩm';

  @override
  String totalQuantityWithCount(num count, String unit) {
    return 'Tổng SL: $count $unit';
  }

  @override
  String get somethingWentWrongTryAgain =>
      'Đã có lỗi xảy ra, vui lòng thử lại sau!';

  @override
  String get requestCancelled => 'Yêu cầu đến máy chủ đã bị hủy';

  @override
  String get sendTimeout => 'Hết thời gian gửi';

  @override
  String get receiveTimeout => 'Hết thời gian nhận';

  @override
  String get connectionTimeout => 'Hết thời gian kết nối';

  @override
  String serverStatusCode(int code) {
    return 'Mã trạng thái máy chủ: $code';
  }

  @override
  String get connectionFailed => 'Kết nối đến máy chủ thất bại';

  @override
  String get pleaseSelectCurrencyToStart => 'Vui lòng chọn tiền tệ để bắt đầu';

  @override
  String get organizeSupplierInfoDescription =>
      'Sắp xếp thông tin liên hệ và địa chỉ rõ ràng để dễ dàng theo dõi nguồn cung trong chuỗi cung ứng.';

  @override
  String get addWarehouseInfoDescription =>
      'Thêm thông tin nhận diện, vị trí và ghi chú để đội ngũ vận hành quản lý kho dễ dàng hơn.';

  @override
  String get allowImportGoods => 'Cho phép nhập hàng';

  @override
  String get createRequest => 'Tạo đơn yêu cầu';

  @override
  String get noPurchasedMaterials => 'Chưa có gói lượt tạo đơn nào';

  @override
  String get newPurchasedMaterialsWillAppearHere =>
      'Các gói đã mua qua App Store sẽ xuất hiện tại đây';

  @override
  String get quantityUsedUpdated => 'Đã thêm lượt tạo đơn';

  @override
  String quantityMustBeBetween(int count) {
    return 'Chọn từ 1 đến $count gói';
  }

  @override
  String get useMaterial => 'Thêm lượt tạo đơn';

  @override
  String get useQuantity => 'Số gói muốn dùng';

  @override
  String get availableQuantity => 'Tồn kho';

  @override
  String get remainingMaterial => 'Gói còn lại: ';

  @override
  String get usedCountRemaining => 'Lượt tạo đơn còn lại';

  @override
  String usedQuantityOfTotal(int used, int total) {
    return 'Đã dùng: $used/$total';
  }

  @override
  String get useMaterialAction => 'Thêm lượt';

  @override
  String get orderCreditsStore => 'Mua lượt tạo đơn';

  @override
  String get orderCreditsStoreSubtitle => 'Mua gói lượt tạo đơn qua App Store';

  @override
  String get orderCreditBundles => 'Gói lượt tạo đơn đã mua';

  @override
  String get orderCreditBundleHint => 'Mỗi gói thêm 35 lượt tạo đơn';

  @override
  String get createdBy => 'Người tạo';

  @override
  String get receivedBy => 'Người nhận';

  @override
  String get vehicleType => 'Phương tiện';

  @override
  String get quantityEnough => 'Đủ';

  @override
  String get quantityNotEnough => 'Chưa đủ';

  @override
  String get ordered => 'Đặt';

  @override
  String get received => 'Nhận';

  @override
  String get checkWarehouseStock => 'Kiểm tra tồn kho';

  @override
  String get sufficient => 'Đủ';

  @override
  String get insufficient => 'Chưa đủ';

  @override
  String get createQuickOrder => 'Tạo đơn nhanh';

  @override
  String get allProductsSufficient => 'Tất cả sản phẩm đủ hàng';

  @override
  String get requestedQuantity => 'SL yêu cầu';

  @override
  String get productNotInWarehouse => 'Không có trong kho';

  @override
  String get pendingPurchaseBadge => 'Giao dịch dở dang';

  @override
  String get pendingPurchaseTitle => 'Đã mua / Khôi phục';

  @override
  String get productId => 'Mã sản phẩm';

  @override
  String get completePendingTransaction => 'Hoàn tất giao dịch này';

  @override
  String get buyMoreCredits => 'Mua thêm lượt';

  @override
  String get buyCreditsSuccess => 'Mua lượt thành công';

  @override
  String get useCreditsNowMessage =>
      'Bạn đã cập nhật lượt tạo đơn thành công. Bạn có muốn dùng ngay 1 lượt không?';

  @override
  String get useNow => 'Dùng ngay';

  @override
  String get useCreditSuccess => 'Sử dụng 1 lượt tạo đơn thành công!';

  @override
  String get purchaseFailed => 'Mua hàng thất bại!';

  @override
  String verificationError(Object error) {
    return 'Lỗi xử lý xác thực: $error';
  }

  @override
  String buyPackageWithPrice(Object price) {
    return 'Mua gói với giá $price';
  }

  @override
  String get selectOrderPackage => 'Chọn một gói lượt tạo đơn';

  @override
  String get setupConversion => 'Thiết lập quy đổi';

  @override
  String get setupConversionSuccess => 'Thiết lập quy đổi thành công';

  @override
  String get conversionProductName => 'Tên sản phẩm quy đổi';

  @override
  String get conversionProductNameHint => 'Ví dụ: Hộp nhỏ, Gói';

  @override
  String get tapToSelectProductImage => 'Chạm vào ảnh để chọn ảnh sản phẩm';

  @override
  String get productImageSelected => 'Đã chọn ảnh sản phẩm';

  @override
  String get conversionQuantity => 'Số lượng quy đổi';

  @override
  String get conversionQuantityHint => 'Ví dụ: 10';

  @override
  String get saveConversion => 'Lưu quy đổi';

  @override
  String get originalUnit => 'Đơn vị gốc';

  @override
  String originalUnitLabel(String unit) {
    return 'Đơn vị gốc: $unit';
  }

  @override
  String oneUnit(String unit) {
    return '1 $unit';
  }

  @override
  String currentStock(int count, String unit) {
    return 'Hiện có: $count $unit';
  }

  @override
  String get pleaseSelectConversionImage =>
      'Vui lòng chọn ảnh cho sản phẩm quy đổi.';

  @override
  String get pleaseEnterConversionName => 'Vui lòng nhập tên sản phẩm quy đổi.';

  @override
  String get pleaseEnterValidConversionQuantity =>
      'Vui lòng nhập số lượng quy đổi hợp lệ.';

  @override
  String get pleaseSelectConversionUnit => 'Vui lòng chọn đơn vị quy đổi.';

  @override
  String get conversionUnit => 'Đơn vị quy đổi';

  @override
  String afterSplit(int count, String unit) {
    return 'Sau tách: $count $unit';
  }

  @override
  String splitObtained(int count, String unit) {
    return 'Nhận được: $count $unit';
  }

  @override
  String conversionFormula(String parentUnit, String value, String childUnit) {
    return '1 $parentUnit = $value $childUnit';
  }

  @override
  String get conversionInfo => 'Thông tin quy đổi';

  @override
  String get errorTitle => 'Lỗi';

  @override
  String get productNotSetupConversion =>
      'Sản phẩm chưa được thiết lập quy đổi.';

  @override
  String get originalProduct => 'Sản phẩm gốc';

  @override
  String get conversionProductDefault => 'Sản phẩm quy đổi';

  @override
  String get enterQuantity => 'Nhập số lượng';

  @override
  String exceedsCurrentQuantity(int count, String unit) {
    return 'Vượt quá số lượng hiện tại ($count $unit)';
  }

  @override
  String get warehouseImportStats => 'Thống kê nhập kho';

  @override
  String monthLabel(String month) {
    return 'Tháng $month';
  }

  @override
  String yearLabel(String year) {
    return 'Năm $year';
  }

  @override
  String get storeInvoiceByDayTitle => 'Số hoá đơn theo ngày';

  @override
  String get storeInvoiceCount => 'Số hoá đơn';

  @override
  String get storeExportTableTitle => 'Bảng xuất dữ liệu';

  @override
  String get storeExportExcel => 'Xuất Excel';

  @override
  String get storeExportSuccessOpen =>
      'Đã tạo file Excel và mở bằng ứng dụng mặc định.';

  @override
  String storeExportSuccessSaved(String path, String message) {
    return 'Đã tạo file: $path\nKhông mở được tự động ($message).';
  }

  @override
  String get storeExportTable => 'Xuất bảng';

  @override
  String get storeHistoryStats => 'Thống kê số lượng';

  @override
  String get storeSoldLeast => 'Bán ít nhất';

  @override
  String get storeSoldMost => 'Bán nhiều nhất';

  @override
  String storeNoDataForMonth(int month, int year) {
    return 'Không có dữ liệu\ntháng $month/$year';
  }

  @override
  String get storeColStt => 'STT';

  @override
  String get storeColDate => 'Ngày giao dịch';

  @override
  String get storeColRevenue => 'Doanh thu';

  @override
  String get storePreview => 'Xem trước';

  @override
  String get storeNoteColumn => 'Diễn giải';

  @override
  String get storeTodayRevenue => 'Doanh thu hôm nay';

  @override
  String get storeColumnNameLabel => 'Tên cột hiển thị';

  @override
  String get storeColumnNameHint => 'Ví dụ: Diễn giải';

  @override
  String get storeDefaultValueLabel => 'Giá trị mặc định khi note trống';

  @override
  String get storeDefaultValueHint => 'Ví dụ: Doanh thu hôm nay';

  @override
  String get storeShowProductNames => 'Hiển thị tên sản phẩm';

  @override
  String get storeShowProductNamesSubtitle =>
      'Cột diễn giải sẽ tự nối tên các sản phẩm';

  @override
  String get storeShowQuantity => 'Hiển thị số lượng';

  @override
  String get storeShowQuantitySubtitle =>
      'Nối thêm \"(số lượng đơn vị)\" sau mỗi tên sản phẩm';

  @override
  String get storeSplitPayment => 'Tách tiền mặt / chuyển khoản';

  @override
  String get storeSplitPaymentSubtitle =>
      'Tách cột Doanh thu thành 2 cột theo hình thức thanh toán';

  @override
  String get empEditOrder => 'Chỉnh sửa đơn hàng';

  @override
  String get empProductCost => 'Tiền hàng';

  @override
  String get empTotalReceivedQty => 'Tổng SL nhận';

  @override
  String get empPleaseEnterQuantity => 'Vui lòng nhập số lượng';

  @override
  String get empInvalidQuantity => 'Số lượng không hợp lệ';

  @override
  String get empDeleteSupplier => 'Xoá nhà cung cấp';

  @override
  String get empSlAbbr => 'SL';

  @override
  String get empLineTotal => 'Thành tiền';

  @override
  String get empEstimatedOrderAmount => 'Tiền đặt (ước tính)';

  @override
  String get empReceivedLineTotal => 'Thành tiền nhận';

  @override
  String empPickupPointsCount(int count) {
    return '$count điểm lấy';
  }

  @override
  String empProductsItemsCount(int productCount, int itemCount) {
    return '$productCount sản phẩm • $itemCount món';
  }

  @override
  String empMoreProducts(int count) {
    return '+$count sản phẩm khác';
  }

  @override
  String empItemSummaryCount(int productCount, int totalQuantity) {
    return '$productCount SP ($totalQuantity)';
  }

  @override
  String empPickupPointCount(int count) {
    return '$count điểm';
  }

  @override
  String empSpAbbr(int count) {
    return '$count SP';
  }

  @override
  String empMonAbbr(int count) {
    return '($count món)';
  }

  @override
  String get empPickupPoint => 'điểm lấy';

  @override
  String empMoreProductsDetail(int count) {
    return '+$count sản phẩm khác (nhấn để xem chi tiết)';
  }

  @override
  String get empLocationNotObtained => 'Chưa lấy được vị trí';

  @override
  String get empLocationRetryMessage =>
      'Chưa lấy được vị trí hiện tại của bạn. Vui lòng xác nhận để thử lấy lại vị trí.';

  @override
  String get empPickupFailed => 'Lấy hàng thất bại. Vui lòng kiểm tra lại kho!';

  @override
  String get employeePhoneAlreadyExists => 'Số điện thoại đã tồn tại';

  @override
  String get employeePermissionUpdatedTitle => 'Cập nhật quyền hạn';

  @override
  String get employeePermissionUpdatedBody =>
      'Quyền hạn của bạn vừa được cập nhật.';

  @override
  String get supplierHistoryStats => 'Thống kê nhập hàng';

  @override
  String get supplierUpdateImage => 'Cập nhật ảnh nhà cung cấp';

  @override
  String get supplierCurrentImage => 'Ảnh hiện tại';

  @override
  String get supplierChooseImage => 'Chọn ảnh';

  @override
  String get supplierChooseFromDevice => 'Chọn từ thiết bị';

  @override
  String get orderUpdateSuccess => 'Cập nhật đơn hàng thành công!';

  @override
  String get orderDeleteSuccess => 'Xoá đơn hàng thành công!';

  @override
  String get orderDeleteTitle => 'Xoá đơn hàng';

  @override
  String get orderDeleteConfirmMessage =>
      'Bạn có chắc chắn muốn xoá đơn hàng này?';

  @override
  String get orderPleaseEnterQuantity => 'Vui lòng nhập số lượng';

  @override
  String get orderInvalidQuantity => 'Số lượng không hợp lệ';

  @override
  String get orderExceedsStock => 'Vượt quá số lượng tồn kho';

  @override
  String get orderStt => 'STT';

  @override
  String get homeDeliveryWaiting => 'Chờ giao';

  @override
  String get homeSalesEmployee => 'Nhân viên bán hàng';

  @override
  String get homeWarehouseEmployee => 'Nhân viên kho';

  @override
  String get homeLoadingEmployees => 'Đang tải nhân viên...';

  @override
  String get homeSelectWarehouseEmployee => 'Chọn nhân viên kho';

  @override
  String get homePickupGoods => 'Lấy hàng';

  @override
  String get homePickingUpGoods => 'Đang lấy hàng';

  @override
  String get homePickingUpSubtitle => 'Tài xế đang thực hiện chặng lấy hàng';

  @override
  String homePickupPointCount(int count) {
    return '$count điểm lấy hàng';
  }

  @override
  String get homeDelivering => 'Đang giao hàng';

  @override
  String get homeDeliveringSubtitle => 'Tài xế đang di chuyển tới điểm giao';

  @override
  String homeDeliveryPointName(String name) {
    return 'Điểm giao: $name';
  }

  @override
  String homePickupCountDest(int count, String destination) {
    return '$count điểm lấy · $destination';
  }

  @override
  String get homeViewJourney => 'Xem hành trình';

  @override
  String get homeNoPickupInfo => 'Chưa có thông tin điểm lấy hàng.';

  @override
  String homeProductCount(int count) {
    return '$count sản phẩm';
  }

  @override
  String homeOtherProducts(int count) {
    return '+$count sản phẩm khác';
  }

  @override
  String get homeDestination => 'Điểm đến';

  @override
  String homeRecipient(String name) {
    return 'Người nhận: $name';
  }

  @override
  String get homeAddWarehouseOrStore => 'Thêm kho / cửa hàng';

  @override
  String supplierImportHistory(String name) {
    return 'Lịch sử nhập hàng ở $name';
  }
}
