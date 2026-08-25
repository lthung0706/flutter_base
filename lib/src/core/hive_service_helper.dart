import 'package:injectable/injectable.dart';
import 'package:flutter_base/hive_registrar.g.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

/// Service quản lý Hive database với singleton pattern
/// Sử dụng DI để inject vào repositories/usecases
@lazySingleton
class HiveServiceHelper {
  final Map<String, Box> _openBoxes = {};

  /// Khởi tạo Hive database
  /// Gọi một lần duy nhất khi app khởi động
  Future<void> init() async {
    await Hive.initFlutter();
    Hive.registerAdapters();
  }

  /// Lấy hoặc mở box (với cache)
  Future<Box<T>> _getBox<T>(String boxName) async {
    if (_openBoxes.containsKey(boxName)) {
      return _openBoxes[boxName] as Box<T>;
    }
    final box = await Hive.openBox<T>(boxName);
    _openBoxes[boxName] = box;
    return box;
  }

  /// Lưu một giá trị đơn vào box
  Future<void> saveBox<T>(String boxName, T value) async {
    final box = await _getBox<T>(boxName);
    await box.put(boxName, value);
  }

  /// Lấy một giá trị đơn từ box
  Future<T?> getBox<T>(String boxName) async {
    final box = await _getBox<T>(boxName);
    return box.get(boxName);
  }

  /// Lưu List - Lưu từng item vào box
  Future<void> saveListBox<T>(String boxName, List<T> value) async {
    final box = await _getBox<T>(boxName);
    await box.clear();
    await box.addAll(value);
  }

  /// Lấy List - Lấy tất cả items từ box
  Future<List<T>> getListBox<T>(String boxName) async {
    final box = await _getBox<T>(boxName);
    return box.values.toList();
  }

  /// Lưu List như một value đơn
  Future<void> saveListAsValue<T>(String boxName, List<T> value) async {
    final box = await _getBox(boxName);
    await box.put('data', value);
  }

  /// Lấy List đã lưu như một value đơn
  Future<List<T>?> getListAsValue<T>(String boxName) async {
    final box = await _getBox(boxName);
    final value = box.get('data');
    return value != null ? List<T>.from(value as List) : null;
  }

  /// Thêm một item vào List box
  Future<void> addToListBox<T>(String boxName, T item) async {
    final box = await _getBox<T>(boxName);
    await box.add(item);
  }

  /// Xóa một item khỏi List box theo index
  Future<void> removeFromListBox<T>(String boxName, int index) async {
    final box = await _getBox<T>(boxName);
    await box.deleteAt(index);
  }

  /// Cập nhật một item trong List box theo index
  Future<void> updateListBoxItem<T>(String boxName, int index, T item) async {
    final box = await _getBox<T>(boxName);
    await box.putAt(index, item);
  }

  /// Xóa box khỏi disk
  Future<void> deleteBox(String boxName) async {
    if (_openBoxes.containsKey(boxName)) {
      await _openBoxes[boxName]!.close();
      _openBoxes.remove(boxName);
    }
    await Hive.deleteBoxFromDisk(boxName);
  }

  /// Xóa tất cả dữ liệu
  Future<void> clearAll() async {
    for (final box in _openBoxes.values) {
      await box.close();
    }
    _openBoxes.clear();
    await Hive.deleteFromDisk();
  }

  /// Khởi tạo và cache các asset nếu cần
  Future<void> initAssets() async {}
}
