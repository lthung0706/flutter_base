# Prompt: Tạo project mới từ `flutter_base`

> Dán nguyên phần trong khung bên dưới cho AI agent. Chỉ cần sửa 2 biến ở đầu: `PROJECT_NEW` và (tuỳ chọn) thông tin rebrand.

---

```text
Bạn là agent thiết lập project Flutter. Hãy tạo project mới bằng cách SAO CHÉP toàn bộ
project base `flutter_base` sang một thư mục mới. KHÔNG sửa gì trong `flutter_base`.

## Biến (tôi sẽ thay trước khi chạy)
- SOURCE_DIR   = /Users/lehung/flutter_base
- PROJECT_NEW  = project_new            # tên thư mục mới
- TARGET_DIR   = /Users/lehung/$PROJECT_NEW

## Bước 1 – Kiểm tra trước khi copy
1. Nếu TARGET_DIR đã tồn tại → DỪNG và hỏi tôi, tuyệt đối không ghi đè / xoá.
2. Xác nhận SOURCE_DIR tồn tại và có `pubspec.yaml`.

## Bước 2 – Copy (KHÔNG mang theo git)
Chạy đúng lệnh sau (zsh, macOS):

    rsync -a \
      --exclude='.git/' \
      --exclude='build/' \
      --exclude='.dart_tool/' \
      --exclude='.DS_Store' \
      "$SOURCE_DIR/" "$TARGET_DIR/"

Quy tắc:
- TUYỆT ĐỐI không copy thư mục `.git` và KHÔNG chạy `git init`, `git add`, `git commit`
  trong project mới. Việc `git init` là của tôi.
- Mọi thứ còn lại giữ nguyên (lib/, packages/, android/, ios/, assets/, scripts/, .agent/,
  .agents/, .github/, .vscode/, *.sh, file .g.dart đã generate, ...).
- `build/` và `.dart_tool/` được bỏ vì sẽ tự sinh lại bằng `flutter pub get`.

## Bước 3 – Xác minh
1. `ls -a $TARGET_DIR` → phải KHÔNG có `.git`.
2. So sánh nhanh: `diff -rq $SOURCE_DIR $TARGET_DIR -x .git -x build -x .dart_tool -x .DS_Store`
   → kết quả rỗng.
3. In ra cây thư mục cấp 1 của TARGET_DIR.

## Bước 4 – (Chỉ làm khi tôi cung cấp tên app / package id) Rebrand
Nếu tôi có đưa APP_NAME, DART_NAME, PACKAGE_ID, BASE_URL thì chạy trong TARGET_DIR:

    cd "$TARGET_DIR" && ./setup_project.sh \
      --app-name "<APP_NAME>" \
      --dart-name "<DART_NAME>" \
      --package-id "<PACKAGE_ID>" \
      --base-url "<BASE_URL>" -y

Nếu tôi KHÔNG đưa các thông tin này → bỏ qua bước 4, chỉ nhắc tôi lệnh để tự chạy.

## Bước 5 – Báo cáo
Trả lời ngắn gọn: đường dẫn project mới, đã/ chưa rebrand, và nhắc tôi tự chạy:

    cd $TARGET_DIR && git init

## Lưu ý về mock login (đã bật sẵn trong base)
- `AuthRepositoryImpl.isMockup = true` trong `lib/src/authentication/auth_repository.dart`
  → login dùng dữ liệu giả từ `packages/app_config/assets/mockup/auth_login.json`
  (đăng nhập bất kỳ email/mật khẩu nào cũng thành công).
- Khi nối backend thật: đổi `isMockup` thành `false`.
- Thêm API mock mới: đặt file JSON vào `packages/app_config/assets/mockup/` và khai báo
  endpoint → tên file trong `packages/app_config/lib/src/network/mockup/map_mock_api.dart`.
```

---

## Cách dùng nhanh (không cần AI)

```bash
rsync -a --exclude='.git/' --exclude='build/' --exclude='.dart_tool/' --exclude='.DS_Store' \
  /Users/lehung/flutter_base/ /Users/lehung/project_new/

cd /Users/lehung/project_new
./setup_project.sh      # rebrand (tuỳ chọn)
git init                # tự tạo git
```
