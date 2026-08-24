// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class AppLocalizationsJa extends AppLocalizations {
  AppLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get storeName => '店舗名';

  @override
  String get address => '住所';

  @override
  String get phone => '電話番号';

  @override
  String get unknown => '不明';

  @override
  String get notAvailable => 'N/A';

  @override
  String get systemManagement => 'システム管理';

  @override
  String get employees => '従業員';

  @override
  String get appSettings => 'アプリ設定';

  @override
  String get reportIssue => '問題を報告';

  @override
  String get regulationsAndPolicies => '規約とポリシー';

  @override
  String get termsConditions => '利用規約';

  @override
  String get privacyPolicy => 'プライバシーポリシー';

  @override
  String get termsConditionsMarkdown =>
      '## 利用規約\n\n### 1. 規約の承諾\nSStripアプリケーションにアカウントを登録し使用することにより、ユーザー（店舗オーナー、倉庫スタッフ、配送スタッフを含む）は、以下のすべての規約を遵守することに同意するものとします。同意いただけない場合は、直ちにサービスの利用を中止してください。\n\n### 2. サービスの説明\nSStripはサプライチェーンおよび物流管理のプラットフォームです。本アプリケーションは以下のツールを提供します：\n* 倉庫、店舗、サプライヤーの管理。\n* 配送注文の作成と追跡。\n* 地図上でのリアルタイムの配送ルート監視。\n* QRコードをスキャンして商品や注文を検索。\n* 注文ステータスに関するプッシュ通知の受信。\n\n### 3. ユーザーアカウント\n* **登録：** ユーザーはメールアドレスまたは電話番号で登録します。従業員アカウントは店舗オーナーによって作成され、権限が付与されます。\n* **セキュリティ：** ユーザーは自身のログイン認証情報およびアカウント下で行われるすべての活動に対して責任を負います。\n* **認可：** 機能（注文やデータの作成、編集、削除）へのアクセスは、店舗オーナーが付与する役割システムによって管理されます。\n\n### 4. ユーザーの責任\n* 商品に関する正確かつ真実の情報（名称、価格、単位、画像）を提供すること。\n* 禁止物品、爆発物、密輸品、またはベトナムの法律に違反するいかなる物品の輸送も行わないこと。\n* アプリを詐欺的、破壊的、または違法な目的で使用しないこと。\n* アップロードされた画像が第三者の知的財産権を侵害しないことを確認すること。\n\n### 5. サービス料金および支払い\n* 関連する費用は、ユーザーが注文を確定する前にアプリ内で公開表示されます。\n* 商品価格はVNDで計算され、各商品ごとに明確に表示されます。\n\n### 6. 責任の制限\n* SStripは技術ソリューションを提供しており、商品の品質や第三者の行為により生じた事故について直接の責任を負いません。\n* 損傷した商品に関するいかなるクレームも、アプリに記録された証拠（画像、配送記録）に基づいて解決されます。\n* ネットワーク障害、自然災害、または不可抗力によるサービス中断について、当社は責任を負いません。\n\n### 7. サービスの終了\n* これらの規約への違反が確認された場合、当社はユーザーアカウントを停止または終了する権利を留保します。\n* ユーザーはいつでもアカウントの削除を申請できます。\n\n---\n*最終更新：2026年3月5日*';

  @override
  String get privacyPolicyMarkdown =>
      '## プライバシーポリシー\n\n> 本ポリシーは、ベトナムの個人データ保護に関する第13/2023/ND-CP号決議に準拠して策定されています。\n\n### 1. 収集するデータ\n\n**a) アカウント情報：**\n* 氏名、メールアドレス、電話番号（登録時）。\n* パスワード（暗号化され、平文では保存されません）。\n* システム内の役割と権限（店舗オーナー、倉庫スタッフ、配送スタッフ）。\n\n**b) 位置情報（GPS）：**\n* 配送スタッフの位置情報は、アプリがバックグラウンドで動作している場合を含め、リアルタイムで収集され、関係各所の配送ルートを更新するために使用されます。\n* 倉庫、店舗、サプライヤーの位置情報は、地図表示の目的で保存されます。\n\n**c) 画像およびファイル：**\n* ユーザーがアップロードした商品、倉庫、店舗の画像。\n* 商品管理の目的でカメラで撮影、またはフォトライブラリから選択された写真。\n\n**d) デバイス情報：**\n* 通知配信のためのデバイス種別、OS、デバイス識別子。\n* ソフトウェア品質向上のために自動収集されるアプリケーションのエラー情報。\n\n**e) ビジネスデータ：**\n* 注文情報：作成者、商品、数量、価格、ステータス、備考。\n* サプライヤー情報：名称、住所、電話番号、商品カタログ。\n* 倉庫および店舗情報：名称、住所、座標、説明。\n\n### 2. データ利用の目的\n\n* **運用：** 倉庫、店舗、注文を管理し、適切なスタッフへ配送をつなぎます。\n* **追跡：** 地図上でリアルタイムの配送位置を表示し、貨物の安全を確保します。\n* **通知：** 注文ステータスやシステム更新に関するプッシュ通知を送信します。\n* **サポート：** 保存された取引データに基づき、紛争や苦情を解決します。\n* **改善：** エラーを分析し、利用状況に基づいて機能を改善します。\n\n### 3. デバイス権限\n\nアプリはデバイスに対して以下の権限を要求します：\n\n| 権限 | 目的 |\n|------------|---------|\n| 位置情報（使用中） | 地図上に位置を表示し、最寄りのサプライヤーを検索 |\n| 位置情報（バックグラウンド） | 配送ルートを継続的に追跡（配送スタッフのみ） |\n| カメラ | 商品の写真撮影、QRコードのスキャン |\n| フォトライブラリ | デバイスから商品および倉庫の画像を選択 |\n| 通知 | 注文ステータスおよびシステム更新の通知を受信 |\n| ストレージ | ローカルデータを保存し、パフォーマンスを向上 |\n\nスマートフォンの**設定**からいつでも権限を無効にできます。ただし、一部の権限を無効にするとアプリの機能に影響を与える可能性があります。\n\n### 4. 情報共有\n\n当社は個人データを第三者に**販売しない**ことをお約束します。データの共有は以下の場合に限定されます：\n* **システム内：** 配送スタッフは注文情報（配送先住所、商品）を閲覧可能。オーナーは配送スタッフの位置を閲覧可能。\n* **地図サービス提供元：** 地図の表示とルート計算のため、地図パートナーは位置情報を受け取ります。\n* **通知サービス：** プッシュ通知サービス提供元は、通知配信のためデバイス識別子を受け取ります。\n* **管轄当局：** ベトナムの法律に基づく書面による請求がある場合。\n\n### 5. あなたの権利（第13/2023/ND-CP号決議に基づく）\n\nあなたには以下の権利があります：\n1. **閲覧・編集：** アカウント画面でいつでも個人情報（氏名、電話番号）を更新。\n2. **データの削除：** サポートに連絡することで、アカウント削除および関連データの消去を申請。\n3. **権限の撤回：** スマートフォンの設定から位置情報、カメラ、通知へのアクセスを無効化。\n4. **処理への異議：** 法律で定める一定の場合、個人データの処理に異議を申し立て。\n\n### 6. 保管およびセキュリティ\n\n* データは安全な暗号化プロトコルを介して送信されます。\n* 機密データ（パスワード）は保存前に暗号化されます。\n* デバイス上のローカルデータは暗号化データベースで保存されます。\n* システムはリアルタイム配送追跡に安全な接続を使用します。\n\n### 7. データ保存期間\n\n* アカウントデータ：ユーザーが削除を申請するまで保存。\n\n---\n*最終更新：2026年3月5日*';

  @override
  String get dangerZone => '危険ゾーン';

  @override
  String get deleteAccount => 'アカウント削除';

  @override
  String get deleteAccountConfirm => 'このアカウントを削除してもよろしいですか？';

  @override
  String get logout => 'ログアウト';

  @override
  String get logoutConfirm => 'ログアウトしてもよろしいですか？';

  @override
  String get employeeLogoutConfirm => '従業員アカウントからログアウトしてもよろしいですか？';

  @override
  String get appVersion => 'アプリバージョン';

  @override
  String get language => '言語';

  @override
  String get selectLanguage => '言語を選択';

  @override
  String get employeeList => '従業員リスト';

  @override
  String get cancel => 'キャンセル';

  @override
  String get save => '保存';

  @override
  String get pickupPoints => '入荷';

  @override
  String get warehouses => '倉庫一覧';

  @override
  String get importGoods => '仕入れ';

  @override
  String get stores => '店舗一覧';

  @override
  String get createPickupPoint => '集荷ポイント作成';

  @override
  String get createProduct => '商品作成';

  @override
  String get createWarehouse => '倉庫作成';

  @override
  String get createStore => '店舗作成';

  @override
  String get appName => 'SStrip';

  @override
  String get findAddress => '住所を検索';

  @override
  String get searchAddress => '住所を検索';

  @override
  String get selectThisLocation => 'この場所を選択';

  @override
  String get orderFromWarehouse => '倉庫から注文';

  @override
  String get orderSuccessfully => '注文が完了しました';

  @override
  String get pleaseSelectProduct => '商品を選択してください';

  @override
  String get pleaseSelectDeliveryPoint => '配送先を選択してください';

  @override
  String get placeOrder => '注文する';

  @override
  String get pending => '保留中';

  @override
  String get processing => '処理中';

  @override
  String get completed => '完了';

  @override
  String get delivered => '配達済み';

  @override
  String get cancelled => 'キャンセル済み';

  @override
  String get failed => '失敗';

  @override
  String get deliveryPoint => '配送先';

  @override
  String get createdDate => '作成日';

  @override
  String get notes => 'メモ';

  @override
  String get note => '備考';

  @override
  String get enterNote => '備考を入力';

  @override
  String get customer => '顧客';

  @override
  String get location => '場所';

  @override
  String get time => '時間';

  @override
  String get confirm => '確認';

  @override
  String get sessionExpiredTitle => 'セッションの有効期限切れ';

  @override
  String get sessionExpiredMessage => 'セッションの有効期限が切れました。再度ログインしてください。';

  @override
  String get total => '合計';

  @override
  String get totalAmount => '合計金額';

  @override
  String get noOrdersYet => '注文はまだありません';

  @override
  String get noOrders => '注文なし';

  @override
  String get turnOnLocation => '位置情報をオンにする';

  @override
  String get locationPermissionDescription =>
      '配送ルートの追跡と最適な配送サービスのために位置情報へのアクセスが必要です。';

  @override
  String orderCompletedWithId(String id) {
    return '注文$idが正常に完了しました';
  }

  @override
  String get confirmCancelOrderTitle => '注文キャンセル';

  @override
  String get confirmCancelOrderMessage => 'この注文をキャンセルしてもよろしいですか？';

  @override
  String get noProductsSelected => '商品が選択されていません';

  @override
  String get selectProductsFromWarehouseToStart => '倉庫から商品を選択して開始';

  @override
  String get selectProductsFromSupplierToStart => 'サプライヤーから商品を選択して開始';

  @override
  String orderNumberTitle(String shortId) {
    return '注文 #$shortId';
  }

  @override
  String get deliveringOrders => '配送中の注文';

  @override
  String get deliveredOrders => '配達済み注文';

  @override
  String get receivedOrders => '受領済み注文';

  @override
  String get purchasedOrders => '集荷済み注文';

  @override
  String get cancelledOrders => 'キャンセル済み注文';

  @override
  String get completedOrders => '完了済み注文';

  @override
  String get supplier => 'サプライヤー';

  @override
  String get noSuppliersYet => 'サプライヤーはまだありません';

  @override
  String get addSupplierToStart => 'サプライヤーを追加して商品の取得を開始';

  @override
  String get noWarehousesYet => '倉庫はまだありません';

  @override
  String get addWarehouseToStart => '倉庫を設定して管理を開始';

  @override
  String get noStoresYet => '店舗はまだありません';

  @override
  String get addStoreToStart => '店舗を設定して販売を開始';

  @override
  String get warehouse => '倉庫';

  @override
  String get product => '商品';

  @override
  String get quantity => '数量';

  @override
  String orderedQuantity(int count) {
    return '発注数: x$count';
  }

  @override
  String supplierCount(int count) {
    return '$count社のサプライヤー';
  }

  @override
  String itemCount(int count) {
    return '$count件';
  }

  @override
  String quantityCount(int count) {
    return '数量$count';
  }

  @override
  String receivedQuantityLabel(int received, int quantity) {
    return '受領: $received/$quantity';
  }

  @override
  String get receivedEnough => '充足';

  @override
  String get receivedShort => '不足';

  @override
  String get continueDelivery => '配送を続ける';

  @override
  String productsAndQuantitySummary(int productCount, int totalQuantity) {
    return '$productCount件 • 数量$totalQuantity';
  }

  @override
  String totalProducts(int totalQuantity) {
    return '合計$totalQuantity商品';
  }

  @override
  String get createOrder => '注文作成';

  @override
  String get createImportOrder => '仕入れ発注の作成';

  @override
  String get createTransferOrder => '移動伝票の作成';

  @override
  String get createRequestOrder => '依頼の作成';

  @override
  String get deliverTo => '配送先: ';

  @override
  String get price => '価格';

  @override
  String get warehouseName => '倉庫名';

  @override
  String get supplierName => 'サプライヤー名';

  @override
  String get productCode => '商品コード';

  @override
  String get enterProductCode => '商品コードを入力';

  @override
  String get scanCode => 'コードをスキャン';

  @override
  String get warrantyPeriod => '保証期間';

  @override
  String get updateProductCode => '商品コードを更新';

  @override
  String get updateSuccessfully => '更新が完了しました';

  @override
  String months(String value) {
    return '$valueヶ月';
  }

  @override
  String years(String value) {
    return '$value年';
  }

  @override
  String get home => 'ホーム';

  @override
  String get order => '注文';

  @override
  String get storeInfo => '店舗情報';

  @override
  String get guide => 'ガイド';

  @override
  String get setupNewStore => '新しい店舗を設定';

  @override
  String get close => '閉じる';

  @override
  String get exampleStoreName => '例: 第1地区店舗';

  @override
  String get description => '説明';

  @override
  String get additionalInfo => '追加情報...';

  @override
  String get saveStore => '店舗を保存';

  @override
  String get supplierInfo => 'サプライヤー情報';

  @override
  String get setupNewSupplier => '新しいサプライヤーを追加';

  @override
  String get exampleSupplierName => '例: 成功エージェンシー';

  @override
  String get phoneNumber => '電話番号';

  @override
  String get examplePhoneNumber => '0123 456 789';

  @override
  String get addressHint => '番地、通り、地区...';

  @override
  String get saveSupplier => 'サプライヤーを保存';

  @override
  String get pleaseSelectAddressBeforeSaving => '保存する前に住所を選択してください';

  @override
  String get pleaseEnterSupplierName => 'サプライヤー名を入力してください';

  @override
  String get warehouseInfo => '倉庫情報';

  @override
  String get setupNewWarehouse => '新しい倉庫を設定';

  @override
  String get createSupplierShowcaseDescription =>
      'ここをタップして最初の倉庫を作成し、サプライヤーと商品管理を開始します。';

  @override
  String get exampleWarehouseName => '例: 倉庫A';

  @override
  String get saveWarehouse => '倉庫を保存';

  @override
  String get productInfo => '商品情報';

  @override
  String get addProduct => '商品を追加';

  @override
  String get productName => '商品名';

  @override
  String get enterProductName => '商品名を入力';

  @override
  String get enterPrice => '価格を入力';

  @override
  String get saveProduct => '商品を保存';

  @override
  String get editProduct => '商品を編集';

  @override
  String get deleteProduct => '商品を削除';

  @override
  String get warrantyProduct => '保証商品';

  @override
  String get createNewEmployee => '新しい従業員を作成';

  @override
  String get employeeName => '従業員名';

  @override
  String get enterEmployeeName => '従業員名を入力';

  @override
  String get password => 'パスワード';

  @override
  String get enterPassword => 'パスワードを入力';

  @override
  String get role => '役割';

  @override
  String get inventoryManagement => '在庫管理';

  @override
  String get delivery => '配送';

  @override
  String get sales => '販売';

  @override
  String get deliveryVehicle => '配送車両';

  @override
  String get motorcycle => 'バイク';

  @override
  String get truck => 'トラック';

  @override
  String get create => '作成';

  @override
  String get chatPage => 'チャットページ';

  @override
  String get chatFunctionality => 'チャット機能はこちらに表示されます';

  @override
  String get profile => 'プロフィール';

  @override
  String get settings => '設定';

  @override
  String get store => '店舗';

  @override
  String get enableGps => 'GPSを有効にする';

  @override
  String trackingInfoUpdated(String data) {
    return '追跡情報が更新されました: $data';
  }

  @override
  String get reject => '拒否';

  @override
  String get acceptOrder => '注文を受ける';

  @override
  String get declineOrder => '注文を断る';

  @override
  String detailsTitle(String index) {
    return '詳細 $index';
  }

  @override
  String get orderInformation => '注文情報';

  @override
  String detailedViewForOrder(String index) {
    return '注文 #$index の詳細ビュー';
  }

  @override
  String get demoCustomerName => '田中太郎';

  @override
  String get demoOrderLocation => '東京都渋谷区1-2-3';

  @override
  String get demoOrderTime => '午前10:30 - 本日';

  @override
  String get demoOrderNotes => 'お客様から丁寧な配送と到着前の電話連絡を依頼されています。';

  @override
  String get settingsMapRemovedDescription =>
      'マップ機能は設定から削除されました。MapLibreに移行してください。';

  @override
  String get noProducts => '商品なし';

  @override
  String get addProductsToCategory => 'このカテゴリに商品を追加してください。';

  @override
  String get completeOrder => '注文を完了';

  @override
  String get receiveOrder => '注文を受領';

  @override
  String get pickupCompleted => '集荷完了';

  @override
  String get refreshList => 'リストを更新';

  @override
  String get enableGPS => 'GPSを有効にする';

  @override
  String get start => '開始';

  @override
  String get back => '戻る';

  @override
  String get scanQRReceiveNotification => 'QRをスキャンし、通知を受け取り\nすぐに始めましょう';

  @override
  String get manageWarehouseStore => '倉庫、店舗、\nサプライヤーを管理';

  @override
  String get createOrderTrackShipment => '注文を作成し、配送を\nリアルタイムで追跡';

  @override
  String get sstripPlatform => 'SStrip - サプライチェーン\n運営プラットフォーム';

  @override
  String get search => '検索';

  @override
  String get anErrorOccurred => 'エラーが発生しました';

  @override
  String error(String message) {
    return 'エラー: $message';
  }

  @override
  String get noName => '名前なし';

  @override
  String get noPhoneNumber => '電話番号なし';

  @override
  String get noEmployees => '従業員なし';

  @override
  String get pressButtonToAddEmployee => '下のボタンを押して新しい従業員を追加';

  @override
  String get loading => '読み込み中...';

  @override
  String get storeList => '店舗リスト';

  @override
  String get productsAtCounter => 'カウンターの商品';

  @override
  String get salesHistory => '販売履歴';

  @override
  String get windbreakerJacket => 'ウィンドブレーカー';

  @override
  String get sportSneakers => 'スポーツスニーカー';

  @override
  String get meshCap => 'メッシュキャップ';

  @override
  String get khakiPants => 'カーキパンツ';

  @override
  String get completeProductInfoInOneGo =>
      'サプライヤーを選択し、各商品の情報を入力して、カタログを一括更新しましょう。';

  @override
  String get locked => 'ロック済み';

  @override
  String get changeSupplier => 'サプライヤーを変更';

  @override
  String get selectSupplier => 'サプライヤーを選択';

  @override
  String get tapToChooseSupplierBeforeAddingProducts =>
      '商品を追加する前にサプライヤーを選択してください。';

  @override
  String productNumber(int number) {
    return '商品 $number';
  }

  @override
  String get newestItem => '最新アイテム';

  @override
  String get uploadImage => '画像をアップロード';

  @override
  String get changeImage => '画像を変更';

  @override
  String get pleaseSelectSupplierBeforeSaving => '保存する前にサプライヤーを選択してください。';

  @override
  String get pleaseSelectImagesBeforeSaving => '保存する前にすべての商品の画像を選択してください。';

  @override
  String get productType => '商品タイプ';

  @override
  String get selectType => '-- タイプを選択 --';

  @override
  String get vnd => 'VND';

  @override
  String get materialPieceType => '素材（個）';

  @override
  String get materialKilogramType => '素材（kg）';

  @override
  String get materialBoxType => '素材（箱）';

  @override
  String get pieceUnit => '個';

  @override
  String get kilogramUnit => 'kg';

  @override
  String get boxUnit => '箱';

  @override
  String get active => 'アクティブ';

  @override
  String get noData => 'データがありません';

  @override
  String get chat => 'チャット';

  @override
  String get chatFunctionalityComingSoon => 'チャット機能はこちらに表示されます';

  @override
  String get owner => '店舗オーナー';

  @override
  String get employee => '従業員';

  @override
  String get welcomeBack => 'おかえりなさい';

  @override
  String get loginToContinueManagingStore => '店舗管理を続けるにはログインしてください';

  @override
  String get email => 'メール';

  @override
  String get enterEmail => 'メールアドレスを入力';

  @override
  String get enterPhone => '電話番号を入力';

  @override
  String get loginFailed => 'ログイン失敗';

  @override
  String get login => 'ログイン';

  @override
  String get dontHaveAccountRegisterNow => 'アカウントをお持ちでないですか？無料で作成';

  @override
  String get createAccount => '無料アカウントを作成';

  @override
  String get registerToStartManagingStore => '無料のSStripアカウントを作成して始めましょう';

  @override
  String get userName => 'ユーザー名';

  @override
  String get enterName => '名前を入力';

  @override
  String get confirmPassword => 'パスワード確認';

  @override
  String get enterConfirmPassword => 'パスワードを再入力';

  @override
  String get passwordsMatch => 'パスワードが一致しています';

  @override
  String get passwordsDoNotMatch => 'パスワードが一致しません';

  @override
  String get registerFailed => '登録に失敗しました';

  @override
  String get register => '登録';

  @override
  String get alreadyHaveAccountLogin => 'すでにアカウントをお持ちですか？ログイン';

  @override
  String get onboardingOverviewTitle => 'SStrip - サプライチェーン\n運営プラットフォーム';

  @override
  String get onboardingOverviewDescription => '倉庫管理、物流、流通ネットワークを1つのアプリで一元管理。';

  @override
  String get onboardingOverviewHeadline => '1画面で複数のワークフロー';

  @override
  String get onboardingOverviewHighlight1 => 'サプライチェーン';

  @override
  String get onboardingOverviewHighlight2 => '物流';

  @override
  String get onboardingOverviewHighlight3 => 'データ一元化';

  @override
  String get onboardingOverviewStat1 => '倉庫';

  @override
  String get onboardingOverviewStat2 => '店舗';

  @override
  String get onboardingOverviewStat3 => 'サプライヤー';

  @override
  String get onboardingLocationsTitle => '倉庫、店舗、\nサプライヤーを管理';

  @override
  String get onboardingLocationsDescription =>
      '主要な拠点を設定・監視し、在庫、供給源、流通ネットワークをより正確に管理。';

  @override
  String get onboardingLocationsHeadline => '明確な販売拠点エコシステム';

  @override
  String get onboardingLocationsHighlight1 => '倉庫';

  @override
  String get onboardingLocationsHighlight2 => '店舗';

  @override
  String get onboardingLocationsHighlight3 => 'サプライヤー';

  @override
  String get onboardingLocationsStat1 => '拠点追跡';

  @override
  String get onboardingLocationsStat2 => '情報同期';

  @override
  String get onboardingLocationsStat3 => 'システム拡張';

  @override
  String get onboardingDeliveryTitle => '注文を作成し、\nリアルタイムで配送を追跡';

  @override
  String get onboardingDeliveryDescription =>
      '配送注文を素早く作成し、地図上で配送ルートを監視し、配送全過程でステータスを即座に更新。';

  @override
  String get onboardingDeliveryHeadline => 'リアルタイムの透明な物流';

  @override
  String get onboardingDeliveryHighlight1 => '迅速な注文作成';

  @override
  String get onboardingDeliveryHighlight2 => 'ルート追跡';

  @override
  String get onboardingDeliveryHighlight3 => 'ステータス更新';

  @override
  String get onboardingDeliveryStat1 => 'ビジュアルマップ';

  @override
  String get onboardingDeliveryStat2 => '配送進捗';

  @override
  String get onboardingDeliveryStat3 => '先手対応';

  @override
  String get onboardingReadyTitle => '接続 & ';

  @override
  String get onboardingReadyDescription =>
      'QRコードで商品や注文を検索し、プッシュ通知で最新の運営状況を常に把握。';

  @override
  String get onboardingReadyHeadline => 'アプリに入る準備完了';

  @override
  String get onboardingReadyHighlight1 => 'QRスキャン';

  @override
  String get onboardingReadyHighlight2 => '注文検索';

  @override
  String get onboardingReadyHighlight3 => 'プッシュ通知';

  @override
  String get onboardingReadyStat1 => '正確';

  @override
  String get onboardingReadyStat2 => '高速';

  @override
  String get onboardingReadyStat3 => '常に最新';

  @override
  String get purchaseCompleted => '購入完了';

  @override
  String get deliverToWarehouse => '倉庫に配送';

  @override
  String get startDelivery => '配送を開始';

  @override
  String get complete => '完了';

  @override
  String get isEnd => 'リストの最後';

  @override
  String get shippingTab => '配送';

  @override
  String get switchWarehouseTab => '倉庫切替';

  @override
  String get requestTab => 'リクエスト';

  @override
  String get pleaseEnterWarehouseName => '倉庫名を入力してください';

  @override
  String get transferToWarehouse => '倉庫に転送';

  @override
  String get nearlyOutOfStock => '在庫切れ間近';

  @override
  String get updateMinimumQuantity => '最小数量を更新';

  @override
  String get minimumQuantity => '最小数量';

  @override
  String get enterMinimumQuantity => '最小数量を入力';

  @override
  String get pleaseEnterValidMinimumQuantity => '有効な最小数量を入力してください';

  @override
  String minCount(String count) {
    return '最小: $count';
  }

  @override
  String get onboardingSstripTag => 'SSTRIP';

  @override
  String get onboardingSstripTitle => 'スマート物流 ';

  @override
  String get onboardingSstripTitleEm => 'サプライチェーンを簡素化';

  @override
  String get onboardingSstripDesc => '倉庫、サプライヤー、ドライバーを1つのプラットフォームで接続。';

  @override
  String get onboardingFeatureTag => '機能';

  @override
  String get onboardingFeatureTitle => '次世代の ';

  @override
  String get onboardingFeatureTitleEm => '管理';

  @override
  String get onboardingFeatureDesc => '日々の物流業務を最適化する強力なツール。';

  @override
  String get onboardingStartTag => '始めましょう';

  @override
  String get onboardingStartTitle => '数分で ';

  @override
  String get onboardingStartTitleEm => 'セットアップ';

  @override
  String get onboardingStartDesc => '物流システムを素早く簡単にセットアップ。';

  @override
  String get onboardingReadyTag => '準備完了';

  @override
  String get onboardingReadyTitleEm => '今日から始めよう';

  @override
  String get onboardingReadyDesc => 'SStripで商品と注文の管理を始めましょう。';

  @override
  String get onboardingWelcome => '🎉 SStripへようこそ！';

  @override
  String get onboardingSkip => 'スキップ';

  @override
  String get onboardingStartNow => '今すぐ開始';

  @override
  String get onboardingNext => '次へ';

  @override
  String get onboardingFeatOrderTitle => '注文管理';

  @override
  String get onboardingFeatOrderDesc => '倉庫から受取人まで作成・追跡';

  @override
  String get onboardingFeatMapTitle => 'マップ追跡';

  @override
  String get onboardingFeatMapDesc => 'リアルタイムのドライバー位置とルート';

  @override
  String get onboardingFeatReportTitle => '倉庫レポート';

  @override
  String get onboardingFeatReportDesc => '在庫統計と履歴';

  @override
  String get onboardingStep1Title => '無料アカウントを作成';

  @override
  String get onboardingStep1Desc => '数秒で登録してSStripを始めましょう';

  @override
  String get onboardingStep2Title => '倉庫と商品を設定';

  @override
  String get onboardingStep2Desc => '倉庫、サプライヤー、カテゴリを追加';

  @override
  String get onboardingStep3Title => '作成と割当';

  @override
  String get onboardingStep3Desc => '自動注文作成と割当';

  @override
  String get onboardingStep4Title => '追跡と確認';

  @override
  String get onboardingStep4Desc => 'リアルタイム追跡と配達確認';

  @override
  String get onboardingOwner => 'オーナー';

  @override
  String get onboardingDriver => 'ドライバー';

  @override
  String get onboardingWarehouse => '倉庫';

  @override
  String get onboardingBubbleOwner => '送り主';

  @override
  String get onboardingBubbleDriver => 'ドライバー';

  @override
  String get onboardingBubbleWarehouse => '倉庫';

  @override
  String get onboardingBubbleSupply => 'サプライヤー';

  @override
  String get interfaceTitle => 'インターフェース';

  @override
  String get themeTitle => 'テーマ';

  @override
  String get themeAuto => 'システム';

  @override
  String get themeLight => 'ライト';

  @override
  String get themeDark => 'ダーク';

  @override
  String get selectTheme => 'テーマを選択';

  @override
  String get paymentSection => '支払い';

  @override
  String get currencyTitle => '通貨';

  @override
  String get cash => '現金';

  @override
  String get bankTransfer => '銀行振込';

  @override
  String get nodeColor => 'ノードの色';

  @override
  String get selectNodeColor => '色を選択';

  @override
  String get orderUpdateCompletedSuccess => '注文が正常に完了しました';

  @override
  String get orderUpdateCancelledSuccess => '注文が正常にキャンセルされました';

  @override
  String get priceNotUpdated => '価格未更新';

  @override
  String get invalidPriceTitle => '無効な価格';

  @override
  String get invalidPriceMessage => '一部の商品の価格が無効または未設定です。確認してください。';

  @override
  String get nameNotUpdated => '（名前未更新）';

  @override
  String get unitPrice => '単価';

  @override
  String get select => '選択';

  @override
  String get clearAll => 'すべてクリア';

  @override
  String get recent => '最近';

  @override
  String get scanInstruction => 'バーコードをフレーム内に配置してスキャン';

  @override
  String get updateProductCodeHelper => '保証情報は商品コードと一緒に保存されます。';

  @override
  String get monthsTitle => 'ヶ月';

  @override
  String get yearsTitle => '年';

  @override
  String get pleaseEnterProductCode => '商品コードを入力してください';

  @override
  String addPhotos(int count) {
    return '写真を$count枚追加';
  }

  @override
  String get clearSelectedProducts => '選択した商品をクリア';

  @override
  String get confirmClearSelectedProducts => '選択したすべての商品をクリアしますか？';

  @override
  String get movingTo => '移動中';

  @override
  String get deliverySuccess => '配達が完了しました';

  @override
  String get products => '商品';

  @override
  String deliveryToWarehouseCompleted(String name) {
    return '倉庫$nameへの配達が完了しました';
  }

  @override
  String deliveryToStoreCompleted(String name) {
    return '店舗$nameへの配達が完了しました';
  }

  @override
  String get selectProductFromStoreToStart => '店舗から商品を選択して開始';

  @override
  String get sold => '販売済み';

  @override
  String get minStock => '最小在庫';

  @override
  String get updatePrice => '販売価格を更新';

  @override
  String get sellingPrice => '販売価格';

  @override
  String get purchasePrice => '仕入価格';

  @override
  String get updateProduct => '商品を更新';

  @override
  String get delete => '削除';

  @override
  String get confirmDeleteProduct => 'この商品を削除してもよろしいですか？';

  @override
  String get edit => '編集';

  @override
  String get information => '情報';

  @override
  String get noInformation => '情報がありません';

  @override
  String get confirmDeleteSupplier => 'このサプライヤーを削除してもよろしいですか？';

  @override
  String get confirmDeleteWarehouse => 'この倉庫を削除してもよろしいですか？';

  @override
  String get confirmDeleteStore => 'この店舗を削除してもよろしいですか？';

  @override
  String confirmDeleteRole(String roleName) {
    return '役割 $roleName を削除してもよろしいですか？';
  }

  @override
  String get deleteActionCannotBeUndone => 'この操作は取り消せません。';

  @override
  String get receiptSuccessFully => '受領に成功しました';

  @override
  String get deleteCategory => 'カテゴリーを削除';

  @override
  String get deleteCategoryConfirmation => 'このカテゴリーを削除してもよろしいですか？';

  @override
  String get createCategory => 'カテゴリーを作成';

  @override
  String get categoryName => 'カテゴリー名';

  @override
  String get unit => '単位';

  @override
  String get deleteSuccess => '正常に削除されました';

  @override
  String get confirmDeleteEmployee => 'この従業員を削除してもよろしいですか？';

  @override
  String get addRole => 'ロールを追加';

  @override
  String currentQuantity(int quantity) {
    return '現在の数量: $quantity';
  }

  @override
  String remainingQuantity(int count) {
    return '残り: $count';
  }

  @override
  String get enterSplitQuantity => '分割する数量を入力';

  @override
  String get splitQuantityHint => '数量（例: 10）';

  @override
  String splitQuantityInvalid(int quantity) {
    return '数量は 0 より大きく $quantity 未満で入力してください';
  }

  @override
  String get splitProduct => '商品を分割';

  @override
  String get productCannotBeSplit => 'この商品は分割できません。';

  @override
  String get mergeProduct => '商品を統合';

  @override
  String get selectProductsToMerge => '統合する商品を選択してください';

  @override
  String get noProductsToMerge => '統合可能な商品がありません';

  @override
  String mergeProductConfirm(int count) {
    return '$count件の商品を統合しますか？';
  }

  @override
  String get cannotMergeDifferentCode => 'コードが異なる商品は統合できません';

  @override
  String get cannotMergeDifferentExpiry => '賞味期限が異なるため統合できません';

  @override
  String get manufacturingDate => '製造日';

  @override
  String get expirationDate => '賞味期限（推定）';

  @override
  String get outOfStock => '在庫切れ';

  @override
  String confirmDeleteItem(String name) {
    return '「$name」を削除してもよろしいですか？';
  }

  @override
  String get billFromStore => '店舗からの請求書';

  @override
  String get orderFromStore => '店舗からの注文';

  @override
  String get viewLocation => '場所を表示';

  @override
  String get defaultCurrency => 'デフォルト通貨';

  @override
  String get selectCurrency => '通貨を選択';

  @override
  String get productCodeNotUpdated => '商品コードは未更新';

  @override
  String get mfgDateNotUpdated => '製造日は未更新';

  @override
  String get expired => '期限切れ';

  @override
  String expiresInDays(int days) {
    return '$days日後に期限切れ';
  }

  @override
  String get longPressToSelectProduct => '商品を長押しして選択';

  @override
  String deleteItemConfirmation(String name) {
    return '「$name」を削除してもよろしいですか？';
  }

  @override
  String get pickingUpGoods => '集荷中';

  @override
  String get deliveringGoods => '配送中';

  @override
  String get selectDeliveryPoint => '- 配送先を選択 -';

  @override
  String get storeDescriptionHint => '店舗をシステム内で分かりやすく表示するために、識別情報と場所を完備してください。';

  @override
  String get supplierDescriptionHint =>
      'サプライヤー情報と住所を明確に整理し、サプライチェーンでの荷物の追跡を容易にします。';

  @override
  String get warehouseDescriptionHint =>
      '識別情報、場所、備考を追加することで、倉庫管理チームの作業を効率化します。';

  @override
  String get selectCurrencyToStart => '開始するには通貨を選択してください';

  @override
  String quantityWithCount(String count) {
    return '数量 $count';
  }

  @override
  String get updateSupplierImage => 'サプライヤーの画像を更新';

  @override
  String get currentImage => '現在の画像';

  @override
  String get selectImage => '画像を選択';

  @override
  String get selectFromDevice => 'デバイスから選択';

  @override
  String get updateWarehouseImage => '倉庫の画像を更新';

  @override
  String get noProductData => '商品データがありません';

  @override
  String totalQuantityWithCount(num count, String unit) {
    return '合計数量: $count $unit';
  }

  @override
  String get somethingWentWrongTryAgain => 'エラーが発生しました。後でもう一度お試しください。';

  @override
  String get requestCancelled => 'サーバーへのリクエストがキャンセルされました';

  @override
  String get sendTimeout => '送信タイムアウト';

  @override
  String get receiveTimeout => '受信タイムアウト';

  @override
  String get connectionTimeout => '接続タイムアウト';

  @override
  String serverStatusCode(int code) {
    return 'サーバーステータスコード: $code';
  }

  @override
  String get connectionFailed => 'サーバーへの接続に失敗しました';

  @override
  String get pleaseSelectCurrencyToStart => '開始するには通貨を選択してください';

  @override
  String get organizeSupplierInfoDescription =>
      'サプライヤー情報と住所を明確に整理し、サプライチェーンでの荷物の追跡を容易にします。';

  @override
  String get addWarehouseInfoDescription =>
      '識別情報、場所、備考を追加することで、運用チームの倉庫管理を効率化します。';

  @override
  String get allowImportGoods => '入荷を許可する';

  @override
  String get createRequest => 'リクエスト注文を作成';

  @override
  String get noPurchasedMaterials => '注文作成回数パックはまだありません';

  @override
  String get newPurchasedMaterialsWillAppearHere =>
      'App Storeで購入したパックがここに表示されます';

  @override
  String get quantityUsedUpdated => '注文作成回数を追加しました';

  @override
  String quantityMustBeBetween(int count) {
    return '1～$countパックを選択してください';
  }

  @override
  String get useMaterial => '注文作成回数を追加';

  @override
  String get useQuantity => '使用するパック数';

  @override
  String get availableQuantity => '在庫数';

  @override
  String get remainingMaterial => '残りのパック: ';

  @override
  String get usedCountRemaining => '残りの注文作成回数';

  @override
  String usedQuantityOfTotal(int used, int total) {
    return '使用済み: $used/$total';
  }

  @override
  String get useMaterialAction => '回数を追加';

  @override
  String get orderCreditsStore => '注文作成回数を購入';

  @override
  String get orderCreditsStoreSubtitle => 'App Storeで注文作成回数パックを購入';

  @override
  String get orderCreditBundles => '購入済みの注文作成回数パック';

  @override
  String get orderCreditBundleHint => '各パックで注文作成回数が35回追加されます';

  @override
  String get createdBy => '作成者';

  @override
  String get receivedBy => '受取人';

  @override
  String get vehicleType => '輸送手段';

  @override
  String get quantityEnough => '十分';

  @override
  String get quantityNotEnough => '不十分';

  @override
  String get ordered => '注文';

  @override
  String get received => '受取';

  @override
  String get checkWarehouseStock => '在庫確認';

  @override
  String get sufficient => '十分';

  @override
  String get insufficient => '不足';

  @override
  String get createQuickOrder => 'クイックオーダー';

  @override
  String get allProductsSufficient => '全商品在庫あり';

  @override
  String get requestedQuantity => '要求数';

  @override
  String get productNotInWarehouse => '倉庫にない';

  @override
  String get pendingPurchaseBadge => '保留中の取引';

  @override
  String get pendingPurchaseTitle => '購入 / 復元';

  @override
  String get productId => '商品ID';

  @override
  String get completePendingTransaction => 'この取引を完了';

  @override
  String get buyMoreCredits => 'さらに購入';

  @override
  String get buyCreditsSuccess => '購入完了';

  @override
  String get useCreditsNowMessage => '注文枠を更新しました。今すぐ1枠を使用しますか？';

  @override
  String get useNow => '今すぐ使用';

  @override
  String get useCreditSuccess => '注文枠を1つ使用しました！';

  @override
  String get purchaseFailed => '購入失敗！';

  @override
  String verificationError(Object error) {
    return '認証エラー: $error';
  }

  @override
  String buyPackageWithPrice(Object price) {
    return 'パッケージを$priceで購入';
  }

  @override
  String get selectOrderPackage => '注文パッケージを選択';

  @override
  String get setupConversion => '換算の設定';

  @override
  String get setupConversionSuccess => '換算の設定が完了しました';

  @override
  String get conversionProductName => '換算用商品名';

  @override
  String get conversionProductNameHint => '例：小箱、パック';

  @override
  String get tapToSelectProductImage => '画像をタップして商品写真を選択';

  @override
  String get productImageSelected => '商品写真が選択されました';

  @override
  String get conversionQuantity => '換算数量';

  @override
  String get conversionQuantityHint => '例：10';

  @override
  String get saveConversion => '換算を保存';

  @override
  String get originalUnit => '元の単位';

  @override
  String originalUnitLabel(String unit) {
    return '元の単位: $unit';
  }

  @override
  String oneUnit(String unit) {
    return '1 $unit';
  }

  @override
  String currentStock(int count, String unit) {
    return '在庫: $count $unit';
  }

  @override
  String get pleaseSelectConversionImage => '換算用商品の画像を選択してください。';

  @override
  String get pleaseEnterConversionName => '換算用商品名を入力してください。';

  @override
  String get pleaseEnterValidConversionQuantity => '有効な換算数量を入力してください。';

  @override
  String get pleaseSelectConversionUnit => '換算単位を選択してください。';

  @override
  String get conversionUnit => '換算単位';

  @override
  String afterSplit(int count, String unit) {
    return '分割後: $count $unit';
  }

  @override
  String splitObtained(int count, String unit) {
    return '受取: $count $unit';
  }

  @override
  String conversionFormula(String parentUnit, String value, String childUnit) {
    return '1 $parentUnit = $value $childUnit';
  }

  @override
  String get conversionInfo => '換算情報';

  @override
  String get errorTitle => 'エラー';

  @override
  String get productNotSetupConversion => 'この商品は換算が設定されていません。';

  @override
  String get originalProduct => '元の商品';

  @override
  String get conversionProductDefault => '換算用商品';

  @override
  String get enterQuantity => '数量を入力';

  @override
  String exceedsCurrentQuantity(int count, String unit) {
    return '現在の数量を超えています（$count $unit）';
  }

  @override
  String get warehouseImportStats => '倉庫入庫統計';

  @override
  String monthLabel(String month) {
    return '月 $month';
  }

  @override
  String yearLabel(String year) {
    return '年 $year';
  }

  @override
  String get storeInvoiceByDayTitle => '日別請求書数';

  @override
  String get storeInvoiceCount => '請求書';

  @override
  String get storeExportTableTitle => 'データ書き出し表';

  @override
  String get storeExportExcel => 'Excelに書き出し';

  @override
  String get storeExportSuccessOpen => 'Excelファイルを作成し、既定のアプリで開きました。';

  @override
  String storeExportSuccessSaved(String path, String message) {
    return 'ファイルを作成しました: $path\n自動で開けませんでした ($message)。';
  }

  @override
  String get storeExportTable => '表を書き出し';

  @override
  String get storeHistoryStats => '数量統計';

  @override
  String get storeSoldLeast => '最も売れていない';

  @override
  String get storeSoldMost => '最も売れている';

  @override
  String storeNoDataForMonth(int month, int year) {
    return 'データがありません\n月 $month/$year';
  }

  @override
  String get storeColStt => '番号';

  @override
  String get storeColDate => '取引日';

  @override
  String get storeColRevenue => '収益';

  @override
  String get storePreview => 'プレビュー';

  @override
  String get storeNoteColumn => '説明';

  @override
  String get storeTodayRevenue => '今日の売上';

  @override
  String get storeColumnNameLabel => '表示列名';

  @override
  String get storeColumnNameHint => '例：説明';

  @override
  String get storeDefaultValueLabel => '備考が空の場合のデフォルト値';

  @override
  String get storeDefaultValueHint => '例：今日の売上';

  @override
  String get storeShowProductNames => '商品名を表示';

  @override
  String get storeShowProductNamesSubtitle => '説明列に商品名が自動で連結されます';

  @override
  String get storeShowQuantity => '数量を表示';

  @override
  String get storeShowQuantitySubtitle => '各商品名の後に「(数量 単位)」を付加';

  @override
  String get storeSplitPayment => '現金 / 振込の分割';

  @override
  String get storeSplitPaymentSubtitle => '収益列を決済方法ごとに2列に分割';

  @override
  String get empEditOrder => '注文の編集';

  @override
  String get empProductCost => '商品代金';

  @override
  String get empTotalReceivedQty => '受領総数量';

  @override
  String get empPleaseEnterQuantity => '数量を入力してください';

  @override
  String get empInvalidQuantity => '数量が無効です';

  @override
  String get empDeleteSupplier => 'サプライヤーの削除';

  @override
  String get empSlAbbr => '数量';

  @override
  String get empLineTotal => '小計';

  @override
  String get empEstimatedOrderAmount => '注文見積額';

  @override
  String get empReceivedLineTotal => '受領小計';

  @override
  String empPickupPointsCount(int count) {
    return '$count 集荷ポイント';
  }

  @override
  String empProductsItemsCount(int productCount, int itemCount) {
    return '$productCount 商品 • $itemCount 点';
  }

  @override
  String empMoreProducts(int count) {
    return '+$count 件のその他の商品';
  }

  @override
  String empItemSummaryCount(int productCount, int totalQuantity) {
    return '$productCount 商品 ($totalQuantity)';
  }

  @override
  String empPickupPointCount(int count) {
    return '$count ポイント';
  }

  @override
  String empSpAbbr(int count) {
    return '$count 商品';
  }

  @override
  String empMonAbbr(int count) {
    return '($count 点)';
  }

  @override
  String get empPickupPoint => '集荷ポイント';

  @override
  String empMoreProductsDetail(int count) {
    return '+$count 件のその他の商品 (詳細を見るにはタップ)';
  }

  @override
  String get empLocationNotObtained => '位置を取得できませんでした';

  @override
  String get empLocationRetryMessage => '現在の位置を取得できませんでした。確認して再取得してください。';

  @override
  String get empPickupFailed => '集荷に失敗しました。倉庫を確認してください。';

  @override
  String get employeePhoneAlreadyExists => '電話番号は既に存在します';

  @override
  String get employeePermissionUpdatedTitle => '権限が更新されました';

  @override
  String get employeePermissionUpdatedBody => 'あなたの権限が更新されました。';

  @override
  String get supplierHistoryStats => '入荷統計';

  @override
  String get supplierUpdateImage => 'サプライヤー画像を更新';

  @override
  String get supplierCurrentImage => '現在の画像';

  @override
  String get supplierChooseImage => '画像を選択';

  @override
  String get supplierChooseFromDevice => 'デバイスから選択';

  @override
  String get orderUpdateSuccess => '注文の更新に成功しました';

  @override
  String get orderDeleteSuccess => '注文の削除に成功しました';

  @override
  String get orderDeleteTitle => '注文を削除';

  @override
  String get orderDeleteConfirmMessage => 'この注文を削除してもよろしいですか？';

  @override
  String get orderPleaseEnterQuantity => '数量を入力してください';

  @override
  String get orderInvalidQuantity => '数量が無効です';

  @override
  String get orderExceedsStock => '在庫数量を超えています';

  @override
  String get orderStt => '番号';

  @override
  String get homeDeliveryWaiting => '配送待ち';

  @override
  String get homeSalesEmployee => '販売担当者';

  @override
  String get homeWarehouseEmployee => '倉庫担当者';

  @override
  String get homeLoadingEmployees => '従業員を読み込み中...';

  @override
  String get homeSelectWarehouseEmployee => '倉庫担当者を選択';

  @override
  String get homePickupGoods => '集荷';

  @override
  String get homePickingUpGoods => '集荷中';

  @override
  String get homePickingUpSubtitle => 'ドライバーが集荷中です';

  @override
  String homePickupPointCount(int count) {
    return '$count 集荷地点';
  }

  @override
  String get homeDelivering => '配送中';

  @override
  String get homeDeliveringSubtitle => 'ドライバーが配送先へ向かっています';

  @override
  String homeDeliveryPointName(String name) {
    return '配送先: $name';
  }

  @override
  String homePickupCountDest(int count, String destination) {
    return '$count 集荷地点 · $destination';
  }

  @override
  String get homeViewJourney => 'ルートを見る';

  @override
  String get homeNoPickupInfo => '集荷地点の情報がありません。';

  @override
  String homeProductCount(int count) {
    return '$count 商品';
  }

  @override
  String homeOtherProducts(int count) {
    return '+$count その他の商品';
  }

  @override
  String get homeDestination => '配送先';

  @override
  String homeRecipient(String name) {
    return '受取人: $name';
  }

  @override
  String get homeAddWarehouseOrStore => '倉庫/店舗を追加';

  @override
  String supplierImportHistory(String name) {
    return '仕入れ履歴（$name）';
  }
}
