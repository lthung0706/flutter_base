#!/bin/bash

# Flutter Assets Code Generator

# Thư mục assets
ASSETS_DIR="assets"
IMAGES_DIR="$ASSETS_DIR/images"
ICONS_DIR="$ASSETS_DIR/icons"

# File output
OUTPUT_FILE="lib/src/core/constants/app_assets.dart"

# Tạo thư mục assets nếu chưa tồn tại
mkdir -p "$IMAGES_DIR"
mkdir -p "$ICONS_DIR"
mkdir -p "$(dirname "$OUTPUT_FILE")"

# Function để convert tên file thành tên biến Dart (camelCase)
convert_to_variable_name() {
    local filename=$1
    # Bỏ extension
    filename="${filename%.*}"

    # Convert snake_case hoặc kebab-case thành camelCase
    # Ví dụ: ic_green_success -> icGreenSuccess
    local result=""
    local capitalize_next=false

    for ((i=0; i<${#filename}; i++)); do
        char="${filename:$i:1}"
        if [[ "$char" == "_" ]] || [[ "$char" == "-" ]]; then
            capitalize_next=true
        elif [[ "$char" =~ [a-zA-Z0-9] ]]; then
            if [ "$capitalize_next" = true ]; then
                result+=$(echo "$char" | tr '[:lower:]' '[:upper:]')
                capitalize_next=false
            else
                result+="$char"
            fi
        fi
    done

    # Nếu bắt đầu bằng số, thêm underscore
    if [[ $result =~ ^[0-9] ]]; then
        result="_$result"
    fi

    echo "$result"
}

# Function để generate code cho một nhóm assets
generate_assets_section() {
    local dir=$1
    local section_name=$2
    local prefix=$3  # 'im' cho images, 'ic' cho icons

    # Tìm tất cả files trong thư mục
    local files=$(find "$dir" -type f -not -name '.*' 2>/dev/null | sort)

    # Nếu không có file nào, return
    if [ -z "$files" ]; then
        return
    fi

    echo ""
    echo "  // $section_name"

    while IFS= read -r asset_path; do
        if [ -n "$asset_path" ]; then
            filename=$(basename "$asset_path")
            var_name=$(convert_to_variable_name "$filename")

            # Thay đổi prefix: nếu là images thì ic -> im
            if [ "$prefix" = "im" ] && [[ "$var_name" == ic* ]]; then
                var_name="im${var_name:2}"
            fi

            echo "  static const String $var_name = '$asset_path';"
        fi
    done <<< "$files"
}

# Tạo file Dart
cat > "$OUTPUT_FILE" << 'EOF'
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: constant_identifier_names

/// Lớp quản lý tất cả assets trong ứng dụng
class AppAssets {
  AppAssets._();
EOF

# Generate Images section
generate_assets_section "$IMAGES_DIR" "Images" "im" >> "$OUTPUT_FILE"

# Generate Icons section
generate_assets_section "$ICONS_DIR" "Icons" "ic" >> "$OUTPUT_FILE"

# Đóng class
cat >> "$OUTPUT_FILE" << 'EOF'
}
EOF

echo "✅ Generated $OUTPUT_FILE successfully!"