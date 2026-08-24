import 'package:flutter/material.dart';

class AnimatedScaleWrapper extends StatefulWidget {
  final Widget child;
  final VoidCallback? onTap;
  final double endScale;
  final Duration duration;
  final Duration reverseDuration;
  final HitTestBehavior behavior;

  /// Tạo một wrapper bọc xung quanh widget bất kỳ để tạo hiệu ứng
  /// thu nhỏ lại (scale down) khi chạm vào và nảy lại (bounce out) khi nhả tay.
  const AnimatedScaleWrapper({
    super.key,
    required this.child,
    this.onTap,
    this.endScale = 0.92,
    this.duration = const Duration(milliseconds: 100),
    this.reverseDuration = const Duration(milliseconds: 200),
    this.behavior = HitTestBehavior.opaque,
  });

  @override
  State<AnimatedScaleWrapper> createState() => _AnimatedScaleWrapperState();
}

class _AnimatedScaleWrapperState extends State<AnimatedScaleWrapper>
    with SingleTickerProviderStateMixin {
  late AnimationController _scaleController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _scaleController = AnimationController(
      vsync: this,
      duration: widget.duration,
      reverseDuration: widget.reverseDuration,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: widget.endScale).animate(
      CurvedAnimation(
        parent: _scaleController,
        curve: Curves.easeOutCubic,
        reverseCurve: Curves.elasticOut,
      ),
    );
  }

  @override
  void dispose() {
    _scaleController.dispose();
    super.dispose();
  }

  void _onPressDown() {
    if (mounted) {
      _scaleController.forward();
    }
  }

  void _onPressUp() {
    if (!mounted) return;

    // Xử lý bài toán tap nhẹ (cực lẹ):
    // Vì GestureDetector gộp sự kiện trong 1 frame, forward() chưa kịp chạy thì up đã gọi reverse().
    // Để có hiệu ứng giật nảy mà KHÔNG CẦN CHỜ (gây cảm giác lag),
    // ta chủ động ép giá trị tiến trình thụt xuống 50% rồi mới nảy ra.
    if (_scaleController.value < 0.5) {
      _scaleController.value = 0.5;
    }

    if (mounted) {
      _scaleController.reverse();
    }
  }

  void _onPressCancel() {
    if (mounted) {
      _scaleController.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    // Trả lại GestureDetector thay vì Listener để nó nhường sự kiện cho các child (nút con bên trong)
    return GestureDetector(
      behavior: widget.behavior,
      onTapDown: (_) => _onPressDown(),
      onTapUp: (_) => _onPressUp(),
      onTapCancel: _onPressCancel,
      onTap: widget.onTap,
      child: AnimatedBuilder(
        animation: _scaleAnimation,
        builder: (context, child) {
          return Transform.scale(
            scale: _scaleAnimation.value,
            alignment: Alignment.center,
            filterQuality: FilterQuality.medium,
            child: child,
          );
        },
        child: widget.child,
      ),
    );
  }
}
