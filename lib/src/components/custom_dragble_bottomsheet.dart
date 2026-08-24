import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';

/// A highly customizable, gesture-driven bottom sheet that seamlessly hands off
/// scrolling to its inner content.
class CustomDraggableSheet extends StatefulWidget {
  /// Creates a [CustomDraggableSheet].
  ///
  /// The [minFraction], [maxFraction], and [initialFraction] must be
  /// between 0.0 and 1.0.
  const CustomDraggableSheet({
    super.key,
    required this.builder,
    this.initialFraction = 0.5,
    this.minFraction = 0.3,
    this.maxFraction = 0.95,
    this.snapFractions = const [0.4, 0.7, 0.95],
    this.closeThreshold = 0.45,
    this.pointerMoveSnapThreshold = 0.6,
    this.springPhysics = const SpringDescription(
      mass: 1,
      stiffness: 500,
      damping: 30,
    ),
    this.closeDuration = const Duration(milliseconds: 200),
  }) : assert(minFraction >= 0.0 && minFraction <= 1.0),
       assert(maxFraction >= 0.0 && maxFraction <= 1.0),
       assert(initialFraction >= minFraction && initialFraction <= maxFraction),
       assert(closeThreshold >= 0.0);

  /// Builder function that provides a [ScrollController] and [ScrollPhysics]
  /// to be attached to the scrollable child.
  final Widget Function(ScrollController scrollCtrl, ScrollPhysics physics)
  builder;

  /// The initial height of the sheet as a fraction of the screen height.
  final double initialFraction;

  /// The minimum allowed height of the sheet as a fraction of the screen height.
  final double minFraction;

  /// The maximum allowed height of the sheet as a fraction of the screen height.
  final double maxFraction;

  /// A list of fractions to which the sheet will snap when released.
  final List<double> snapFractions;

  /// The fraction threshold below which the sheet will automatically close (pop).
  final double closeThreshold;

  /// The threshold for handling pointer move events.
  final double pointerMoveSnapThreshold;

  /// The physics properties for the snapping spring animation.
  final SpringDescription springPhysics;

  /// The duration of the closing animation.
  final Duration closeDuration;

  @override
  State<CustomDraggableSheet> createState() => _CustomDraggableSheetState();
}

class _CustomDraggableSheetState extends State<CustomDraggableSheet>
    with SingleTickerProviderStateMixin {
  late double _fraction;
  late final AnimationController _animCtrl;
  late final ScrollController _scrollCtrl;

  // Flag to prevent double popping or handling gestures while closing
  bool _isClosing = false;

  // Tracks whether the current gesture is driving the sheet or the scroll view
  bool _sheetDriving = false;

  bool get _isAtMax => _fraction >= widget.maxFraction - 0.005;
  bool get _scrollAtTop => !_scrollCtrl.hasClients || _scrollCtrl.offset <= 0;

  @override
  void initState() {
    super.initState();
    _fraction = widget.initialFraction;
    _animCtrl = AnimationController.unbounded(vsync: this)
      ..addListener(() {
        setState(() {
          _fraction = _animCtrl.value.clamp(
            widget.minFraction,
            widget.maxFraction,
          );
        });
      });
    _scrollCtrl = ScrollController();
  }

  @override
  void dispose() {
    _animCtrl.dispose();
    _scrollCtrl.dispose();
    super.dispose();
  }

  // ── Gesture Handling ──────────────────────────────────────────────────────

  void _onVerticalDragStart(DragStartDetails d) {
    if (_isClosing) return;
    _animCtrl.stop();

    // Decide whether to drive the sheet or the scroll view
    _sheetDriving = !_isAtMax || _scrollAtTop;
  }

  void _onVerticalDragUpdate(DragUpdateDetails d) {
    if (_isClosing) return;
    final delta = d.primaryDelta ?? 0;
    final screenH = MediaQuery.of(context).size.height;
    final fractionDelta = -delta / screenH;

    if (_sheetDriving) {
      // User is driving the sheet. If it hits max and they pull up, switch to scroll.
      if (_isAtMax && fractionDelta > 0) {
        _sheetDriving = false;
        return;
      }
      _animCtrl.stop();
      setState(() {
        _fraction = (_fraction + fractionDelta).clamp(
          widget.minFraction,
          widget.maxFraction,
        );
      });
    } else {
      // Scroll driving: pull down when at top → switch back to sheet driving
      if (delta > 0 && _scrollAtTop) {
        _sheetDriving = true;
        _onVerticalDragUpdate(d); // re-process as sheet drag
      }
    }
  }

  void _onVerticalDragEnd(DragEndDetails d) {
    if (!_sheetDriving || _isClosing) return;

    final screenH = MediaQuery.of(context).size.height;
    final velocity = -(d.primaryVelocity ?? 0) / screenH;
    _snapSheet(velocity: velocity);
  }

  double _snapTarget(double velocity) {
    const threshold = 0.3;
    if (velocity > threshold) {
      return widget.snapFractions.firstWhere(
        (s) => s > _fraction + 0.02,
        orElse: () => widget.snapFractions.last,
      );
    } else if (velocity < -threshold) {
      return widget.snapFractions.lastWhere(
        (s) => s < _fraction - 0.02,
        orElse: () => widget.snapFractions.first,
      );
    } else {
      return widget.snapFractions.reduce(
        (a, b) => (a - _fraction).abs() < (b - _fraction).abs() ? a : b,
      );
    }
  }

  void _snapSheet({double velocity = 0.0}) {
    if (_isClosing) return;

    final target = _snapTarget(velocity);
    _animCtrl.animateWith(
      SpringSimulation(widget.springPhysics, _fraction, target, velocity),
    );

    // Check if the sheet has been dragged below the close threshold
    if (_fraction < widget.closeThreshold && _scrollCtrl.hasClients) {
      _isClosing = true;

      _animCtrl.animateTo(-0.1, duration: widget.closeDuration);
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenH = MediaQuery.of(context).size.height;

    // Physics: NeverScrollable when sheet is not maxed, Bouncing/AlwaysScrollable when maxed.
    final physics = _isAtMax
        ? const _SheetHandoffScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          )
        : const NeverScrollableScrollPhysics();

    return Listener(
      onPointerMove: (event) {
        if (_isClosing) return;
        if (event.delta.dy > 0 && _scrollAtTop) {
          if (_fraction > widget.pointerMoveSnapThreshold) {
            _animCtrl.stop();
            setState(() {
              _fraction = (_fraction - event.delta.dy / screenH).clamp(
                widget.minFraction,
                widget.maxFraction,
              );
            });
          }
        }
      },
      onPointerUp: (event) {
        if (!_isAtMax && _scrollAtTop && !_isClosing) {
          _snapSheet(velocity: 0.0);
        }
      },
      onPointerCancel: (event) {
        if (!_isAtMax && _scrollAtTop && !_isClosing) {
          _snapSheet(velocity: 0.0);
        }
      },
      child: Align(
        alignment: Alignment.bottomCenter,
        child: SizedBox(
          height: screenH * _fraction,
          child: GestureDetector(
            onVerticalDragStart: _onVerticalDragStart,
            onVerticalDragUpdate: _onVerticalDragUpdate,
            onVerticalDragEnd: _onVerticalDragEnd,
            behavior: HitTestBehavior.translucent,
            child: widget.builder(_scrollCtrl, physics),
          ),
        ),
      ),
    );
  }
}

/// A custom [ScrollPhysics] that prevents the internal scroll view from scrolling
/// upwards (overscrolling at the top) so that the gesture can be handed back
/// to the draggable sheet.
class _SheetHandoffScrollPhysics extends ScrollPhysics {
  /// Creates a physics that hands off scrolling.
  const _SheetHandoffScrollPhysics({super.parent});

  @override
  _SheetHandoffScrollPhysics applyTo(ScrollPhysics? ancestor) =>
      _SheetHandoffScrollPhysics(parent: buildParent(ancestor));

  @override
  double applyBoundaryConditions(ScrollMetrics position, double value) {
    // Prevent overscroll at the top.
    if (value < position.pixels &&
        position.pixels <= position.minScrollExtent) {
      return value - position.pixels;
    }
    return super.applyBoundaryConditions(position, value);
  }
}
