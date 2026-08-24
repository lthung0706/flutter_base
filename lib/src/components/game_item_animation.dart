import 'dart:math' as math;
import 'package:flutter/material.dart';

/// A widget that applies a game-like floating and rotating animation to its child.
///
/// The character floats up and down smoothly and rotates continuously.
class GameItemAnimation extends StatefulWidget {
  const GameItemAnimation({
    super.key,
    required this.child,
    this.floatDistance = 4.0,
    this.floatDuration = const Duration(milliseconds: 1500),
    this.rotateDuration = const Duration(seconds: 4),
    this.enabled = true,
  });

  final Widget child;

  /// The maximum vertical distance the child will "float".
  final double floatDistance;

  /// The duration of one full floating cycle (up and down).
  final Duration floatDuration;

  /// The duration of one full 360-degree rotation.
  final Duration rotateDuration;

  /// Whether the animation is currently active.
  final bool enabled;

  @override
  State<GameItemAnimation> createState() => _GameItemAnimationState();
}

class _GameItemAnimationState extends State<GameItemAnimation>
    with TickerProviderStateMixin {
  late final AnimationController _floatController;
  late final AnimationController _rotateController;

  @override
  void initState() {
    super.initState();
    _floatController = AnimationController(
      vsync: this,
      duration: widget.floatDuration,
    );

    _rotateController = AnimationController(
      vsync: this,
      duration: widget.rotateDuration,
    );

    if (widget.enabled) {
      _startAnimations();
    }
  }

  void _startAnimations() {
    _floatController.repeat(reverse: true);
    _rotateController.repeat();
  }

  void _stopAnimations() {
    _floatController.stop();
    _rotateController.stop();
  }

  @override
  void didUpdateWidget(GameItemAnimation oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.enabled != oldWidget.enabled) {
      if (widget.enabled) {
        _startAnimations();
      } else {
        _stopAnimations();
      }
    }
  }

  @override
  void dispose() {
    _floatController.dispose();
    _rotateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: Listenable.merge([_floatController, _rotateController]),
      builder: (context, child) {
        // Smooth floating using Curves.easeInOut
        final floatValue = Curves.easeInOut.transform(_floatController.value);
        final verticalOffset = -widget.floatDistance * floatValue;

        // 3D Rotation around the Y-axis with perspective
        final rotationAngle = _rotateController.value * 2 * math.pi;
        final matrix = Matrix4.identity()
          ..setEntry(3, 2, 0.001) // perspective
          ..rotateY(rotationAngle);

        return Transform.translate(
          offset: Offset(0, verticalOffset),
          child: Transform(
            transform: matrix,
            alignment: Alignment.center,
            child: child,
          ),
        );
      },
      child: widget.child,
    );
  }
}
