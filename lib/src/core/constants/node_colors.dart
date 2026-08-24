import 'package:flutter/material.dart';

/// Bảng 8 màu dễ nhìn, dùng để chọn màu cho từng node (kho / cửa hàng)
/// trên đồ thị home. Các màu sáng, phân biệt rõ trên nền đen.
class NodeColors {
  static const List<Color> palette = [
    Colors.orangeAccent,
    Colors.green,
    Colors.blue,
    Colors.redAccent,
    Colors.purpleAccent,
    Colors.tealAccent,
    Colors.pinkAccent,
    Colors.amberAccent,
  ];

  /// Màu mặc định nếu chưa có lựa chọn (giữ nguyên giao diện cũ).
  static const Color defaultWarehouse = Colors.orangeAccent;
  static const Color defaultStore = Colors.green;

  static Color fallback(bool isWarehouse) =>
      isWarehouse ? defaultWarehouse : defaultStore;
}
