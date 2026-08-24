---
description: How to implement "Get More" (Pagination) using NotificationListener in Flutter/Bloc
---

# Workflow: Implementing Get More Pagination

This workflow guides you through implementing infinite scroll / pagination using `NotificationListener<ScrollUpdateNotification>` and BLoC.

## 1. Domain/Core Layer
Ensure your query parameters support paging.
```dart
class MyQueryParams {
  final int? page;
  // ... other filters
  MyQueryParams({this.page = 1});
  
  MyQueryParams copyWith({int? page}) => MyQueryParams(page: page ?? this.page);
}
```

## 2. BLoC Layer

### Update State
Add `loadingMore` and `successGetMore` statuses to your state enum.
```dart
enum MyStatus { init, loading, success, loadingMore, successGetMore, failure }
```

### Update Events
Create a new event specifically for loading more data.
```dart
class GetMoreEvent extends MyEvent {
  final MyQueryParams params;
  const GetMoreEvent(this.params);
}
```

### Update Bloc Logic
Handle the `GetMoreEvent` by emitting `loadingMore` first, then `successGetMore` with the new data.
```dart
on<GetMoreEvent>((event, emit) async {
  emit(state.copyWith(MyStatus.loadingMore));
  final result = await useCase.call(params: event.params);
  emit(state.copyWith(MyStatus.successGetMore, data: result.data));
});
```

## 3. Presentation Layer

### Component State
Maintain `ValueNotifier` for `isLoadingMore` and `isEndList`.
```dart
final ValueNotifier<bool> isEndList = ValueNotifier(false);
final ValueNotifier<bool> isLoadingMore = ValueNotifier(false);
MyQueryParams params = MyQueryParams(page: 1);
```

### Scroll Listener Logic
Implement a method to detect when the user is near the end of the list.
```dart
void _onLazyScroll(double maxScroll, double currentScroll) {
  if (!isEndList.value && !isLoadingMore.value) {
    if (currentScroll >= (maxScroll * 0.9)) { // Trigger at 90% scroll
      _getMore();
    }
  }
}

void _getMore() {
  params = params.copyWith(page: (params.page ?? 1) + 1);
  context.read<MyBloc>().add(GetMoreEvent(params));
}
```

### UI Implementation
Wrap your `ListView` with `NotificationListener`.
```dart
NotificationListener<ScrollUpdateNotification>(
  onNotification: (notification) {
    if (notification.metrics.axis == Axis.vertical) {
      _onLazyScroll(
        notification.metrics.maxScrollExtent,
        notification.metrics.pixels,
      );
    }
    return false;
  },
  child: ListView.builder(
    itemCount: (isLoadingMore.value || isEndList.value) 
      ? list.length + 1 
      : list.length,
    itemBuilder: (context, index) {
      if (index == list.length) {
        if (isLoadingMore.value) return LoadingIndicator();
        if (isEndList.value) return EndOfListMessage();
      }
      return ListItem(item: list[index]);
    },
  ),
)
```

### BLoC Listener
Update your state notifiers based on the BLoC state.
```dart
if (state.status == MyStatus.loadingMore) {
  isLoadingMore.value = true;
}
if (state.status == MyStatus.successGetMore) {
  if (state.data.isEmpty) {
    isEndList.value = true;
  } else {
    sourceList.addAll(state.data);
  }
  isLoadingMore.value = false;
}
```

> [!TIP]
> **Multiple Tabs:**
> If your screen has multiple tabs with lists, ensure each tab has its own set of `ValueNotifier`s (`isEndList`, `isLoadingMore`), `OrderQueryParams`, and `_onLazyScroll` methods to avoid state conflicts.
