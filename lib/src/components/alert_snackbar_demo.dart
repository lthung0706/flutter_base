import 'package:flutter/material.dart';
import 'app_alert_dialog.dart';
import 'app_snackbar.dart';

class AlertSnackBarDemoScreen extends StatelessWidget {
  const AlertSnackBarDemoScreen({super.key});

  // 1. Dialog Xác nhận xóa (Danger / Warning)
  void _showDeleteDialog(BuildContext context) {
    AppAlertDialog.showDelete(
      context,
      title: 'Xác nhận xóa',
      message:
          'Bạn có chắc chắn muốn xóa mục này không? Hành động này không thể hoàn tác.',
      confirmText: 'Xóa ngay',
      cancelText: 'Hủy',
      onConfirm: () {
        AppSnackBar.showSuccess(
          context,
          title: 'Đã xóa!',
          message: 'Mục này đã được xóa thành công khỏi hệ thống.',
        );
      },
    );
  }

  // 2. Dialog Xác nhận hành động chung (Submit / Confirm)
  void _showConfirmDialog(BuildContext context) {
    AppAlertDialog.showConfirm(
      context,
      title: 'Xác nhận gửi',
      message: 'Bạn có muốn lưu thông tin và gửi dữ liệu này đi không?',
      confirmText: 'Xác nhận',
      cancelText: 'Xem lại',
      onConfirm: () {
        AppSnackBar.showSuccess(
          context,
          title: 'Gửi thành công',
          message: 'Dữ liệu của bạn đã được cập nhật vào hệ thống.',
        );
      },
    );
  }

  // 3. Dialog Tùy chỉnh thiết kế Modern (Icon căn giữa)
  void _showModernCustomDialog(BuildContext context) {
    AppAlertDialog.showModern(
      context,
      title: 'Hoàn tất tác vụ',
      message: 'Bạn có muốn đánh dấu đơn hàng này là đã hoàn thành không?',
      type: AppAlertDialogType.success,
      confirmText: 'Đồng ý',
      cancelText: 'Bỏ qua',
      onConfirm: () {
        AppSnackBar.showInfo(
          context,
          title: 'Cập nhật',
          message: 'Đơn hàng đã được đánh dấu là hoàn thành!',
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom Alert & SnackBar Demo'),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // SECTION 1: ALERT DIALOGS
              const Text(
                'ALERT DIALOGS SYSTEM',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 16),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red.shade50,
                    foregroundColor: Colors.red.shade700,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  icon: const Icon(Icons.delete_outline_rounded),
                  label: const Text('Mở Dialog Xác nhận Xóa'),
                  onPressed: () => _showDeleteDialog(context),
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue.shade50,
                    foregroundColor: Colors.blue.shade700,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  icon: const Icon(Icons.send_outlined),
                  label: const Text('Mở Dialog Xác nhận Chung'),
                  onPressed: () => _showConfirmDialog(context),
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green.shade50,
                    foregroundColor: Colors.green.shade700,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  icon: const Icon(Icons.check_circle_outline_rounded),
                  label: const Text('Mở Dialog Modern Custom'),
                  onPressed: () => _showModernCustomDialog(context),
                ),
              ),

              const SizedBox(height: 36),
              const Divider(),
              const SizedBox(height: 24),

              // SECTION 2: TOP ANIMATED SNACKBARS
              const Text(
                'TOP ANIMATED SNACKBAR (TOAST)',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 16),

              Wrap(
                spacing: 8,
                runSpacing: 8,
                alignment: WrapAlignment.center,
                children: [
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                    ),
                    icon: const Icon(Icons.check_rounded, size: 18),
                    label: const Text('Top Success'),
                    onPressed: () => AppSnackBar.showSuccess(
                      context,
                      title: 'Thành công!',
                      message: 'Đã lưu thay đổi thông tin thành công.',
                    ),
                  ),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                    ),
                    icon: const Icon(Icons.error_outline_rounded, size: 18),
                    label: const Text('Top Error'),
                    onPressed: () => AppSnackBar.showError(
                      context,
                      title: 'Thất bại!',
                      message: 'Không thể kết nối đến máy chủ. Vui lòng thử lại.',
                    ),
                  ),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange.shade800,
                      foregroundColor: Colors.white,
                    ),
                    icon: const Icon(Icons.warning_amber_rounded, size: 18),
                    label: const Text('Top Warning'),
                    onPressed: () => AppSnackBar.showWarning(
                      context,
                      title: 'Cảnh báo',
                      message: 'Phiên đăng nhập của bạn sắp hết hạn.',
                    ),
                  ),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue.shade700,
                      foregroundColor: Colors.white,
                    ),
                    icon: const Icon(Icons.info_outline_rounded, size: 18),
                    label: const Text('Top Info'),
                    onPressed: () => AppSnackBar.showInfo(
                      context,
                      title: 'Thông tin mới',
                      message: 'Hệ thống đã có bản cập nhật tính năng mới.',
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
