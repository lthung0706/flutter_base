import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:photo_manager_image_provider/photo_manager_image_provider.dart';
import 'package:app_intl/ez_intl.dart';

import '../utils/value_notifier_list.dart';
import 'custom_dragble_bottomsheet.dart';

enum _PickerView { grid, albums }

class GalleryPage extends StatefulWidget {
  const GalleryPage({
    super.key,
    this.onPathFromGallery,
    this.onPathFromCamera,
    this.isMultiple = false,
  });

  final bool isMultiple;
  final Function(String path)? onPathFromCamera;
  final Function(List<String> paths)? onPathFromGallery;

  @override
  State<GalleryPage> createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage>
    with SingleTickerProviderStateMixin {
  _PickerView _view = _PickerView.grid;
  final Set<AssetEntity> _selected = {};

  late final AnimationController _chevronCtrl;
  late final Animation<double> _chevronTurns;

  final ValueNotifier<bool> isLoadingMore = ValueNotifier(false);
  bool isLoad = false;
  int _page = 0;

  final ValueNotifierList<AssetPathEntity> folders = ValueNotifierList([]);
  AssetPathEntity? _path;
  ValueNotifierList<AssetEntity> images = ValueNotifierList([]);
  final ValueNotifierList<List<AssetEntity>> albums = ValueNotifierList([]);
  final int _sizePerPage = 50;

  @override
  void initState() {
    super.initState();
    _chevronCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 220),
    );
    _chevronTurns = Tween<double>(
      begin: 0,
      end: 0.5,
    ).animate(CurvedAnimation(parent: _chevronCtrl, curve: Curves.easeInOut));

    WidgetsBinding.instance.addPostFrameCallback((final timeStamp) async {
      PhotoManager.requestPermissionExtend()
          .then((final state) async {
            if (state == PermissionState.denied ||
                state == PermissionState.restricted) {
              PhotoCachingManager.instance.cancelCacheRequest();
            } else {
              getImageFromGallery().then((_) {
                Future.wait([
                  ...folders.value.map(
                    (final e) async => e.getAssetListRange(start: 0, end: 9999),
                  ),
                ]).then((vList) {
                  albums.setValue(vList);
                });
              });
            }
          })
          .whenComplete(() {
            if (mounted) {
              setState(() => isLoad = true);
            }
          });
    });
  }

  @override
  void dispose() {
    _chevronCtrl.dispose();
    super.dispose();
  }

  Future<void> getImageFromGallery() async {
    final List<AssetPathEntity> paths = await PhotoManager.getAssetPathList(
      type: RequestType.image,
      filterOption: PMFilter.defaultValue(),
    );
    if (!mounted) return;
    if (paths.isEmpty) return;

    folders.setValue(paths);
    _path = paths.firstOrNull;
    final List<AssetEntity> entities =
        await _path?.getAssetListPaged(page: _page, size: _sizePerPage) ?? [];
    if (!mounted) return;

    images.setValue([
      AssetEntity(id: '', width: 0, height: 0, typeInt: 0),
      ...entities,
    ]);
  }

  Future<void> _loadMoreAsset() async {
    isLoadingMore.value = true;
    final List<AssetEntity> entities =
        await _path?.getAssetListPaged(page: _page + 1, size: _sizePerPage) ??
        [];
    if (!mounted) return;
    images.addLastList(entities);
    _page++;
    isLoadingMore.value = false;
  }

  void _toggleView() {
    setState(() {
      if (_view == _PickerView.grid) {
        _view = _PickerView.albums;
        _chevronCtrl.forward();
      } else {
        _view = _PickerView.grid;
        _chevronCtrl.reverse();
      }
    });
  }

  void _onAlbumSelected(AssetPathEntity folder) async {
    setState(() {
      _path = folder;
      _page = 0;
      isLoad = false;
      _toggleView();
    });

    final List<AssetEntity> entities =
        await _path?.getAssetListPaged(page: _page, size: _sizePerPage) ?? [];
    if (!mounted) return;

    images.setValue([
      AssetEntity(id: '', width: 0, height: 0, typeInt: 0),
      ...entities,
    ]);
    setState(() => isLoad = true);
  }

  void _onItemTap(int index) async {
    final entity = images.value[index];

    if (index == 0 && entity.id.isEmpty) {
      ImagePicker().pickImage(source: ImageSource.camera).then((xfile) {
        if (mounted && xfile != null) {
          if (widget.onPathFromCamera != null) {
            widget.onPathFromCamera?.call(xfile.path);
          } else {
            Navigator.of(context).pop(xfile.path);
          }
        }
      });
      return;
    }

    if (!widget.isMultiple) {
      final file = await entity.file;
      if (mounted && file != null) {
        if (widget.onPathFromGallery != null) {
          widget.onPathFromGallery?.call([file.path]);
        } else {
          Navigator.of(context).pop(file.path);
        }
      }
      return;
    }

    setState(() {
      if (_selected.contains(entity)) {
        _selected.remove(entity);
      } else {
        _selected.add(entity);
      }
    });
  }

  void _onConfirmMultiple() async {
    final listFile = await Future.wait(_selected.map((e) => e.file).toList());
    final paths = listFile.where((e) => e != null).map((e) => e!.path).toList();
    if (!mounted) return;
    if (widget.onPathFromGallery != null) {
      widget.onPathFromGallery?.call(paths);
    } else {
      Navigator.of(context).pop(paths);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pop(),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: CustomDraggableSheet(
          initialFraction: 0.6,
          minFraction: 0.3,
          maxFraction: 0.95,
          snapFractions: const [0.6, 0.95],
          builder: (scrollCtrl, physics) {
            return Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              clipBehavior: Clip.hardEdge,
              child: Column(
                children: [
                  _Header(
                    title: _path?.name ?? context.l10n.recent,
                    onClose: () => Navigator.of(context).pop(),
                    onToggleView: _toggleView,
                    chevronTurns: _chevronTurns,
                  ),

                  // Scrollable body
                  Expanded(
                    child: !isLoad
                        ? const Center(child: CircularProgressIndicator())
                        : NotificationListener<ScrollNotification>(
                            onNotification: (ScrollNotification scrollInfo) {
                              if (!isLoadingMore.value &&
                                  scrollInfo.metrics.pixels >=
                                      scrollInfo.metrics.maxScrollExtent *
                                          0.8) {
                                _loadMoreAsset();
                              }
                              // false → cho phép bubble lên CustomDraggableSheet
                              return false;
                            },
                            child: AnimatedSwitcher(
                              duration: const Duration(milliseconds: 200),
                              switchInCurve: Curves.easeOut,
                              switchOutCurve: Curves.easeIn,
                              transitionBuilder: (child, anim) =>
                                  FadeTransition(opacity: anim, child: child),
                              child: _view == _PickerView.grid
                                  ? ValueListenableBuilder(
                                      key: const ValueKey('grid'),
                                      valueListenable: images,
                                      builder: (context, vImages, child) {
                                        return _GridBody(
                                          images: vImages,
                                          selected: _selected,
                                          isMultiple: widget.isMultiple,
                                          onToggle: _onItemTap,
                                          controller: scrollCtrl,
                                          physics: physics,
                                        );
                                      },
                                    )
                                  : ValueListenableBuilder(
                                      key: const ValueKey('albums'),
                                      valueListenable: folders,
                                      builder: (context, vFolders, child) {
                                        return ValueListenableBuilder(
                                          valueListenable: albums,
                                          builder: (context, vAlbums, child) {
                                            return _AlbumBody(
                                              folders: vFolders,
                                              albums: vAlbums,
                                              onAlbumTap: _onAlbumSelected,
                                              controller: scrollCtrl,
                                              physics: physics,
                                            );
                                          },
                                        );
                                      },
                                    ),
                            ),
                          ),
                  ),

                  // Bottom bar (chỉ hiện khi chọn nhiều ảnh)
                  if (widget.isMultiple)
                    _BottomBar(
                      selectedCount: _selected.length,
                      onConfirm: _onConfirmMultiple,
                    ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({
    required this.title,
    required this.onClose,
    required this.onToggleView,
    required this.chevronTurns,
  });
  final String title;
  final VoidCallback onClose;
  final VoidCallback onToggleView;
  final Animation<double> chevronTurns;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 4, 16, 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(onPressed: onClose, icon: const Icon(Icons.close)),
          GestureDetector(
            onTap: onToggleView,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
              decoration: BoxDecoration(
                color: const Color(0xFFF2F2F2),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(width: 6),
                  RotationTransition(
                    turns: chevronTurns,
                    child: const CustomPaint(
                      size: Size(12, 12),
                      painter: _ChevronPainter(),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 32),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Grid Body
// ---------------------------------------------------------------------------

class _GridBody extends StatelessWidget {
  const _GridBody({
    required this.images,
    required this.selected,
    required this.isMultiple,
    required this.onToggle,
    required this.controller,
    required this.physics,
  });
  final List<AssetEntity> images;
  final Set<AssetEntity> selected;
  final bool isMultiple;
  final ValueChanged<int> onToggle;
  final ScrollController controller;
  final ScrollPhysics physics;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      controller: controller,
      padding: EdgeInsets.zero,
      physics: physics,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 2,
        mainAxisSpacing: 2,
      ),
      itemCount: images.length,
      itemBuilder: (_, i) => _GridCell(
        index: i,
        entity: images[i],
        isSelected: selected.contains(images[i]),
        isMultiple: isMultiple,
        onTap: () => onToggle(i),
      ),
    );
  }
}

class _GridCell extends StatelessWidget {
  const _GridCell({
    required this.index,
    required this.entity,
    required this.isSelected,
    required this.isMultiple,
    required this.onTap,
  });
  final int index;
  final AssetEntity entity;
  final bool isSelected;
  final bool isMultiple;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    if (index == 0 && entity.id.isEmpty) {
      return GestureDetector(
        onTap: onTap,
        child: ColoredBox(
          color: Theme.of(context).colorScheme.outlineVariant,
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [Icon(Icons.camera_alt, color: Colors.grey)],
          ),
        ),
      );
    }

    return GestureDetector(
      onTap: onTap,
      child: Stack(
        fit: StackFit.expand,
        children: [
          AssetEntityImage(
            entity,
            isOriginal: false,
            fit: BoxFit.cover,
            thumbnailSize: const ThumbnailSize.square(200),
            errorBuilder: (context, error, stackTrace) => _ImageLoadErrorTile(),
          ),
          if (isSelected) Container(color: const Color(0x330A84FF)),
          if (isMultiple)
            Positioned(
              top: 6,
              right: 6,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 150),
                width: 22,
                height: 22,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isSelected
                      ? const Color(0xFF0A84FF)
                      : const Color(0x33000000),
                  border: isSelected
                      ? null
                      : Border.all(color: const Color(0xE6FFFFFF), width: 2),
                ),
                child: isSelected
                    ? const Center(
                        child: CustomPaint(
                          size: Size(12, 12),
                          painter: _CheckPainter(),
                        ),
                      )
                    : null,
              ),
            ),
        ],
      ),
    );
  }
}

class _ImageLoadErrorTile extends StatelessWidget {
  const _ImageLoadErrorTile();

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: const Color(0xFFEFEFEF),
      child: Center(
        child: Icon(
          Icons.broken_image_outlined,
          size: 20,
          color: Theme.of(context).colorScheme.onSurfaceVariant,
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Album Body
// ---------------------------------------------------------------------------

class _AlbumBody extends StatelessWidget {
  const _AlbumBody({
    required this.folders,
    required this.albums,
    required this.onAlbumTap,
    required this.controller,
    required this.physics,
  });
  final List<AssetPathEntity> folders;
  final List<List<AssetEntity>> albums;
  final Function(AssetPathEntity) onAlbumTap;
  final ScrollController controller;
  final ScrollPhysics physics;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      controller: controller,
      padding: EdgeInsets.zero,
      physics: physics,
      itemCount: folders.length,
      separatorBuilder: (_, __) => const Divider(
        height: 1,
        thickness: 1,
        color: Color(0xFFF0F0F0),
        indent: 16,
        endIndent: 16,
      ),
      itemBuilder: (_, i) {
        final folder = folders[i];
        final albumImages = albums.length > i ? albums[i] : [];
        final thumb = albumImages.isNotEmpty ? albumImages.first : null;

        return FutureBuilder<int>(
          future: folder.assetCountAsync,
          builder: (context, snapshot) {
            final count = snapshot.data ?? 0;
            return GestureDetector(
              onTap: () => onAlbumTap(folder),
              behavior: HitTestBehavior.opaque,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 10,
                ),
                child: Row(
                  children: [
                    Container(
                      width: 72,
                      height: 72,
                      decoration: BoxDecoration(
                        color: const Color(0xFFE8E0D8),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      clipBehavior: Clip.hardEdge,
                      child: thumb != null
                          ? AssetEntityImage(
                              thumb,
                              isOriginal: false,
                              fit: BoxFit.cover,
                              thumbnailSize: const ThumbnailSize.square(150),
                              errorBuilder: (context, error, stackTrace) =>
                                  const _ImageLoadErrorTile(),
                            )
                          : const Center(
                              child: CustomPaint(
                                size: Size(26, 26),
                                painter: _PhotoIconPainter(opacity: 0.6),
                              ),
                            ),
                    ),
                    const SizedBox(width: 14),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          folder.name,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          '$count',
                          style: const TextStyle(
                            fontSize: 14,
                            color: Color(0xFF999999),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}

// ---------------------------------------------------------------------------
// Bottom Bar
// ---------------------------------------------------------------------------

class _BottomBar extends StatelessWidget {
  const _BottomBar({required this.selectedCount, required this.onConfirm});
  final int selectedCount;
  final VoidCallback onConfirm;

  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.of(context).padding.bottom;
    final hasSelected = selectedCount > 0;
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: Color(0xFFF0F0F0))),
      ),
      padding: EdgeInsets.fromLTRB(16, 10, 16, bottom + 10),
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 200),
        child: hasSelected
            ? SizedBox(
                key: const ValueKey('btn'),
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: onConfirm,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF0A84FF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  child: Text(
                    context.l10n.addPhotos(selectedCount),
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            : SizedBox(
                key: const ValueKey('handle'),
                height: 5 + bottom,
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    width: 134,
                    height: 5,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Custom Painters
// ---------------------------------------------------------------------------

class _ChevronPainter extends CustomPainter {
  const _ChevronPainter();
  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawPath(
      Path()
        ..moveTo(size.width * .167, size.height * .333)
        ..lineTo(size.width * .5, size.height * .667)
        ..lineTo(size.width * .833, size.height * .333),
      Paint()
        ..color = Colors.black
        ..strokeWidth = 1.8
        ..strokeCap = StrokeCap.round
        ..strokeJoin = StrokeJoin.round
        ..style = PaintingStyle.stroke,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter _) => false;
}

class _PhotoIconPainter extends CustomPainter {
  const _PhotoIconPainter({this.opacity = 0.5});
  final double opacity;

  @override
  void paint(Canvas canvas, Size size) {
    final c = Color.fromRGBO(255, 255, 255, opacity);
    final stroke = Paint()
      ..color = c
      ..strokeWidth = 1.5
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;
    final fill = Paint()
      ..color = c
      ..style = PaintingStyle.fill;

    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(
          size.width * .125,
          size.height * .125,
          size.width * .75,
          size.height * .75,
        ),
        Radius.circular(size.width * .083),
      ),
      stroke,
    );
    canvas.drawCircle(
      Offset(size.width * .354, size.height * .354),
      size.width * .063,
      fill,
    );
    canvas.drawPath(
      Path()
        ..moveTo(size.width * .875, size.height * .625)
        ..lineTo(size.width * .667, size.height * .417)
        ..lineTo(size.width * .208, size.height * .875),
      stroke,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter _) => false;
}

class _CheckPainter extends CustomPainter {
  const _CheckPainter();
  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawPath(
      Path()
        ..moveTo(size.width * .167, size.height * .5)
        ..lineTo(size.width * .417, size.height * .75)
        ..lineTo(size.width * .833, size.height * .25),
      Paint()
        ..color = Colors.white
        ..strokeWidth = 1.8
        ..strokeCap = StrokeCap.round
        ..strokeJoin = StrokeJoin.round
        ..style = PaintingStyle.stroke,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter _) => false;
}
