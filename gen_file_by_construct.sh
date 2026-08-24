#!/bin/bash

# Function to convert to lowercase
to_lowercase() {
    echo "$1" | tr "[:upper:]" "[:lower:]"
}

# Function to convert to PascalCase
to_pascal_case() {
    local input="$1"
    echo "$(echo "${input:0:1}" | tr "[:lower:]" "[:upper:]")${input:1}"
}

# Function to convert to snake_case
to_snake_case() {
    echo "$1" | sed "s/\([A-Z]\)/_\1/g" | sed "s/^_//" | tr "[:upper:]" "[:lower:]"
}

# Auto-detect project name from pubspec.yaml
PROJECT_NAME=$(grep "^name:" pubspec.yaml | head -n 1 | awk "{print \$2}" | tr -d "\r\n")
if [ -z "$PROJECT_NAME" ]; then
    PROJECT_NAME="report_person"
fi

echo "🚀 Feature & Architecture Generator (Project: $PROJECT_NAME)"
echo "🧱 Chọn loại bạn muốn tạo:"
echo "1) Feature (đầy đủ Clean Architecture: Data, Domain, Presentation)"
echo "2) Model"
echo "3) Params"
read -p "👉 Nhập số tương ứng (1-3): " OPTION

BASE_DIR="lib/src"

case $OPTION in
  1)
    read -p "📦 Tên feature (vd: profile, order, billing): " FEATURE_NAME

    FEATURE_LOWER=$(to_lowercase "$FEATURE_NAME")
    FEATURE_SNAKE=$(to_snake_case "$FEATURE_NAME")
    FEATURE_PASCAL=$(to_pascal_case "$FEATURE_NAME")

    DIRS=(
        "$BASE_DIR/data/datasources/remote"
        "$BASE_DIR/data/models"
        "$BASE_DIR/data/repositories"
        "$BASE_DIR/domain/entities"
        "$BASE_DIR/domain/repositories"
        "$BASE_DIR/domain/usecases"
        "$BASE_DIR/presentation/${FEATURE_LOWER}/view"
        "$BASE_DIR/presentation/${FEATURE_LOWER}/widgets"
        "$BASE_DIR/presentation/${FEATURE_LOWER}/bloc"
    )

    for DIR in "${DIRS[@]}"; do
      mkdir -p "$DIR"
    done

    # 1. API Service
    FILE="$BASE_DIR/data/datasources/remote/${FEATURE_SNAKE}_api_service.dart"
    cat <<EOF > "$FILE"
import "package:app_config/app_config.dart";
import "package:retrofit/retrofit.dart";
part "${FEATURE_SNAKE}_api_service.g.dart";

@RestApi()
abstract class ${FEATURE_PASCAL}ApiService {
  factory ${FEATURE_PASCAL}ApiService(final Dio dio, {final String baseUrl}) =
      _${FEATURE_PASCAL}ApiService;
}
EOF

    # 2. Model
    FILE="$BASE_DIR/data/models/${FEATURE_SNAKE}_model.dart"
    cat <<EOF > "$FILE"
import "package:json_annotation/json_annotation.dart";
part "${FEATURE_SNAKE}_model.g.dart";

@JsonSerializable()
class ${FEATURE_PASCAL}Model {
  final String? id;

  ${FEATURE_PASCAL}Model({this.id});

  factory ${FEATURE_PASCAL}Model.fromJson(Map<String, dynamic> json) =>
      _\$${FEATURE_PASCAL}ModelFromJson(json);

  Map<String, dynamic> toJson() => _\$${FEATURE_PASCAL}ModelToJson(this);
}
EOF

    # 3. Entity
    FILE="$BASE_DIR/domain/entities/${FEATURE_SNAKE}.dart"
    cat <<EOF > "$FILE"
class ${FEATURE_PASCAL} {
  final String? id;

  const ${FEATURE_PASCAL}({this.id});
}
EOF

    # 4. Repository Interface
    FILE="$BASE_DIR/domain/repositories/${FEATURE_SNAKE}_repository.dart"
    cat <<EOF > "$FILE"
import "package:${PROJECT_NAME}/src/data/models/data/data.dart";
import "package:${PROJECT_NAME}/src/domain/entities/${FEATURE_SNAKE}.dart";

abstract class ${FEATURE_PASCAL}Repository {
  Future<DataState<${FEATURE_PASCAL}>> get${FEATURE_PASCAL}();
}
EOF

    # 5. Repository Implementation
    FILE="$BASE_DIR/data/repositories/${FEATURE_SNAKE}_repository_impl.dart"
    cat <<EOF > "$FILE"
import "package:injectable/injectable.dart";
import "package:${PROJECT_NAME}/src/data/datasources/remote/${FEATURE_SNAKE}_api_service.dart";
import "package:${PROJECT_NAME}/src/data/models/data/data.dart";
import "package:${PROJECT_NAME}/src/domain/entities/${FEATURE_SNAKE}.dart";
import "package:${PROJECT_NAME}/src/domain/repositories/${FEATURE_SNAKE}_repository.dart";

@LazySingleton(as: ${FEATURE_PASCAL}Repository)
class ${FEATURE_PASCAL}RepositoryImpl implements ${FEATURE_PASCAL}Repository {
  final ${FEATURE_PASCAL}ApiService _apiService;

  ${FEATURE_PASCAL}RepositoryImpl(this._apiService);

  @override
  Future<DataState<${FEATURE_PASCAL}>> get${FEATURE_PASCAL}() async {
    return const DataSuccess(${FEATURE_PASCAL}());
  }
}
EOF

    # 6. Usecase
    FILE="$BASE_DIR/domain/usecases/get_${FEATURE_SNAKE}_usecase.dart"
    cat <<EOF > "$FILE"
import "package:injectable/injectable.dart";
import "package:${PROJECT_NAME}/src/data/models/data/data.dart";
import "package:${PROJECT_NAME}/src/data/models/usecase/usecase.dart";
import "package:${PROJECT_NAME}/src/domain/entities/${FEATURE_SNAKE}.dart";
import "package:${PROJECT_NAME}/src/domain/repositories/${FEATURE_SNAKE}_repository.dart";

@injectable
class Get${FEATURE_PASCAL}Usecase implements UseCase<DataState<${FEATURE_PASCAL}>, void> {
  final ${FEATURE_PASCAL}Repository _repository;

  Get${FEATURE_PASCAL}Usecase(this._repository);

  @override
  Future<DataState<${FEATURE_PASCAL}>> call({void params}) {
    return _repository.get${FEATURE_PASCAL}();
  }
}
EOF

    # 7. Presentation Page & Body
    FILE="$BASE_DIR/presentation/${FEATURE_LOWER}/view/${FEATURE_SNAKE}_page.dart"
    cat <<EOF > "$FILE"
import "package:flutter/material.dart";
import "../widgets/${FEATURE_SNAKE}_body.dart";

class ${FEATURE_PASCAL}Page extends StatelessWidget {
  const ${FEATURE_PASCAL}Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("${FEATURE_PASCAL}")),
      body: const ${FEATURE_PASCAL}Body(),
    );
  }
}
EOF

    FILE="$BASE_DIR/presentation/${FEATURE_LOWER}/widgets/${FEATURE_SNAKE}_body.dart"
    cat <<EOF > "$FILE"
import "package:flutter/material.dart";

class ${FEATURE_PASCAL}Body extends StatelessWidget {
  const ${FEATURE_PASCAL}Body({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("${FEATURE_PASCAL} Body"),
    );
  }
}
EOF

    echo "✅ Đã tạo cấu trúc Clean Architecture cho feature: $FEATURE_NAME"
    ;;

  2)
    read -p "📄 Tên model (vd: user_profile): " MODEL
    MODEL_SNAKE=$(to_snake_case "$MODEL")
    MODEL_PASCAL=$(to_pascal_case "$MODEL")
    DIR="$BASE_DIR/data/models"
    FILE="$DIR/${MODEL_SNAKE}_model.dart"
    mkdir -p "$DIR"
    cat <<EOF > "$FILE"
import "package:json_annotation/json_annotation.dart";
part "${MODEL_SNAKE}_model.g.dart";

@JsonSerializable()
class ${MODEL_PASCAL}Model {
  final String? id;

  ${MODEL_PASCAL}Model({this.id});

  factory ${MODEL_PASCAL}Model.fromJson(Map<String, dynamic> json) =>
      _\$${MODEL_PASCAL}ModelFromJson(json);

  Map<String, dynamic> toJson() => _\$${MODEL_PASCAL}ModelToJson(this);
}
EOF
    echo "✅ Đã tạo model: $FILE"
    ;;

  3)
    read -p "📄 Tên params (vd: user_param): " PARAMS
    PARAMS_SNAKE=$(to_snake_case "$PARAMS")
    PARAMS_PASCAL=$(to_pascal_case "$PARAMS")
    DIR="$BASE_DIR/core/params"
    FILE="$DIR/${PARAMS_SNAKE}_params.dart"
    mkdir -p "$DIR"
    cat <<EOF > "$FILE"
import "package:json_annotation/json_annotation.dart";
part "${PARAMS_SNAKE}_params.g.dart";

@JsonSerializable()
class ${PARAMS_PASCAL}Params {
  final String? id;

  const ${PARAMS_PASCAL}Params({this.id});

  factory ${PARAMS_PASCAL}Params.fromJson(Map<String, dynamic> json) =>
      _\$${PARAMS_PASCAL}ParamsFromJson(json);

  Map<String, dynamic> toJson() => _\$${PARAMS_PASCAL}ParamsToJson(this);
}
EOF
    echo "✅ Đã tạo param: $FILE"
    ;;

  *)
    echo "❌ Lựa chọn không hợp lệ."
    ;;
esac
