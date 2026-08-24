// Flutter imports:
import 'package:flutter/material.dart';

class ValueNotifierList<T> extends ValueNotifier<List<T>> {
  ValueNotifierList(super.value);

  void add(final T valueToAdd) {
    value = [...value, valueToAdd];
    notifyListeners();
  }

  void remove(final T valueToRemove) {
    value = value.where((final value) => value != valueToRemove).toList();
    notifyListeners();
  }

  void removeIndex(final int index) {
    value.removeAt(index);
    notifyListeners();
  }

  void setValue(final List<T>? newValue) {
    value = [...newValue ?? []];
    notifyListeners();
  }

  void updateValuebyIndex(final int index, final T newValue) {
    value[index] = newValue;
    notifyListeners();
  }

  void addLastList(final List<T>? newValue) {
    value.addAll([...newValue ?? []]);
    notifyListeners();
  }

  void addFirstList(final List<T>? newValue) {
    value.insertAll(0, [...newValue ?? []]);
    notifyListeners();
  }

  void addFirstItem(final T newValue) {
    value = [newValue, ...value];
    notifyListeners();
  }

  void replaceItem(final int i, final T newValue) {
    value.replaceRange(i, i + 1, [newValue]);
    notifyListeners();
  }

  void addItem(final T item) {
    value.add(item);
    notifyListeners();
  }
}

extension ValueX<T> on ValueNotifierList<T> {
  int length() => value.length;

  T getItem(final int i) => value[i];

  bool isEmpty() => value.isEmpty;
  bool isNotEmpty() => value.isNotEmpty;
}
