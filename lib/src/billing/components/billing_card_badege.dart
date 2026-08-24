import 'package:flutter/material.dart';

// ============================================================
// CÁC COMPONENT UI ĐƯỢC TÁCH TỪ OrderQuotaPurchaseScreen
// Mục đích: tái sử dụng style (card viền màu primary, badge nổi,
// benefit row với icon tròn, nút CTA bo góc + shadow) cho BillingPage.
//
// LƯU Ý: các widget này CHỈ nhận data qua constructor và gọi callback
// ra ngoài. Không chứa bất kỳ logic nghiệp vụ / gọi bloc / side-effect
// nào bên trong. Toàn bộ logic vẫn nằm nguyên ở BillingPage.
// ============================================================

/// Badge nổi góc trên bên phải card, ví dụ "GÓI PHỔ BIẾN", "ĐANG CHỌN".
/// Tách từ đoạn Positioned + TweenAnimationBuilder(elasticOut) trong
/// _buildAnimatedCard của OrderQuotaPurchaseScreen.
class BillingCardBadge extends StatelessWidget {
  const BillingCardBadge({
    super.key,
    required this.text,
    this.color = const Color(0xFFE17055),
  });

  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: -12,
      right: 20,
      child: TweenAnimationBuilder<double>(
        tween: Tween(begin: 0.0, end: 1.0),
        duration: const Duration(milliseconds: 700),
        curve: Curves.elasticOut,
        builder: (context, value, child) {
          return Transform.scale(scale: value, child: child);
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 10,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

/// Icon tròn + text 1 dòng, dùng cho danh sách benefit/mô tả sản phẩm.
/// Tách từ _buildAnimatedBenefit của OrderQuotaPurchaseScreen, bỏ phần
/// animation theo _pageController (vì đây dùng lại cho list item, không
/// phải page entrance) nhưng giữ nguyên hình hài UI.
class BillingBenefitRow extends StatelessWidget {
  const BillingBenefitRow({
    super.key,
    required this.icon,
    required this.text,
    this.iconColor = const Color(0xFF00B894),
  });

  final IconData icon;
  final String text;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Row(
      children: [
        Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            color: iconColor.withValues(alpha: 0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, size: 18, color: iconColor),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 13,
              color: colorScheme.onSurface,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}

class BillingInfoRow extends StatelessWidget {
  const BillingInfoRow({super.key, required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            child: Text(
              label,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: colorScheme.onSurfaceVariant,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              value,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: colorScheme.onSurface,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Khung card style OrderQuotaPurchaseScreen: nền trắng, bo góc 24,
/// viền 2px màu primary (nhạt hơn khi không selected), shadow nhẹ.
/// Đây là "vỏ" dùng chung cho cả _StoreProductCard và _PendingPurchaseCard
/// mới, để 2 nơi đó không phải lặp lại decoration.
class BillingCardShell extends StatelessWidget {
  const BillingCardShell({
    super.key,
    required this.child,
    required this.selected,
    this.badge,
    this.onTap,
  });

  final Widget child;
  final bool selected;
  final Widget? badge;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: selected ? colorScheme.primary : colorScheme.outlineVariant,
          width: selected ? 2 : 1,
        ),
        boxShadow: [
          BoxShadow(
            color: colorScheme.primary.withValues(alpha: selected ? 0.08 : 0.03),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Material(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(24),
            child: InkWell(
              borderRadius: BorderRadius.circular(24),
              onTap: onTap,
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: child,
              ),
            ),
          ),
          if (badge != null) badge!,
        ],
      ),
    );
  }
}

/// Header của card: radio + tên gói, style theo hàng "+35 / Lượt tạo
/// đơn" trong OrderQuotaPurchaseScreen nhưng thay số lớn bằng radio dot,
/// vì _StoreProductCard gốc dùng radio để chọn gói chứ không phải hiển thị
/// số cố định.
class BillingCardHeader extends StatelessWidget {
  const BillingCardHeader({
    super.key,
    required this.title,
    required this.selected,
    this.subtitle,
  });

  final String title;
  final bool selected;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 22,
          height: 22,
          margin: const EdgeInsets.only(top: 2),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: selected
                  ? colorScheme.primary
                  : colorScheme.outlineVariant,
              width: 2,
            ),
            color: selected ? colorScheme.primary : Colors.transparent,
          ),
          child: selected
              ? Icon(Icons.check, size: 16, color: colorScheme.onPrimary)
              : null,
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              if (subtitle != null) ...[
                const SizedBox(height: 2),
                Text(
                  subtitle!,
                  style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }
}

/// Khối giá style pill xám nhạt bo góc, giống khối "49.000 đ / lần" trong
/// OrderQuotaPurchaseScreen.
class BillingPricePill extends StatelessWidget {
  const BillingPricePill({super.key, required this.price, this.suffix});

  final String price;
  final String? suffix;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            price,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: colorScheme.primary,
            ),
          ),
          if (suffix != null)
            Text(
              suffix!,
              style: const TextStyle(fontSize: 14, color: Colors.grey),
            ),
        ],
      ),
    );
  }
}

/// Nút CTA lớn full-width, bo góc 16, shadow theo trạng thái loading,
/// AnimatedSwitcher cho nội dung (loading / bình thường). Tách từ
/// _buildPurchaseButton + _buildButtonContent của OrderQuotaPurchaseScreen,
/// nhận content từ ngoài để BillingPage tự quyết icon/label/loading state
/// theo đúng logic hiện có (không đổi text tiếng Việt, không đổi điều kiện).
class BillingPrimaryButton extends StatelessWidget {
  const BillingPrimaryButton({
    super.key,
    required this.isLoading,
    required this.onPressed,
    required this.child,
    this.success = false,
  });

  final bool isLoading;
  final bool success;
  final VoidCallback? onPressed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return SizedBox(
      width: double.infinity,
      height: 56,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: colorScheme.primary.withValues(alpha: isLoading ? 0.05 : 0.25),
              blurRadius: isLoading ? 4 : 12,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: success
                ? Colors.green.shade600
                : colorScheme.primary,
            disabledBackgroundColor: colorScheme.primary.withValues(alpha: 0.7),
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 0,
          ),
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            transitionBuilder: (child, animation) {
              return FadeTransition(
                opacity: animation,
                child: ScaleTransition(scale: animation, child: child),
              );
            },
            child: child,
          ),
        ),
      ),
    );
  }
}