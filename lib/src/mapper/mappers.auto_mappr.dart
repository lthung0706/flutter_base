// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// AutoMapprGenerator
// **************************************************************************

// ignore_for_file: type=lint, unnecessary_cast, unused_local_variable

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_mappr_annotation/auto_mappr_annotation.dart' as _i1;
import 'package:flutter_base/src/authentication/auth.dart' as _i3;
import 'package:flutter_base/src/data/models/apple_transaction_model.dart'
    as _i12;
import 'package:flutter_base/src/data/models/auth_model.dart' as _i2;
import 'package:flutter_base/src/data/models/auth_register_model.dart' as _i6;
import 'package:flutter_base/src/data/models/billing_store_model.dart' as _i10;
import 'package:flutter_base/src/data/models/upload_model.dart' as _i4;
import 'package:flutter_base/src/data/models/user_updated_model.dart' as _i8;
import 'package:flutter_base/src/domain/entities/apple_transaction.dart'
    as _i13;
import 'package:flutter_base/src/domain/entities/auth_register.dart' as _i7;
import 'package:flutter_base/src/domain/entities/billing_store.dart' as _i11;
import 'package:flutter_base/src/domain/entities/upload_entity.dart' as _i5;
import 'package:flutter_base/src/domain/entities/user_updated.dart' as _i9;

/// {@template package:flutter_base/src/mapper/mappers.dart}
/// Available mappings:
/// - `AuthDataModel` → `AuthData`.
/// - `AuthDataUserModel` → `AuthDataUser`.
/// - `AuthDataUserAppMetadataModel` → `AuthDataUserAppMetadata`.
/// - `AuthDataUserUserMetadataModel` → `AuthDataUserUserMetadata`.
/// - `AuthDataUserIdentitiesModel` → `AuthDataUserIdentities`.
/// - `AuthDataUserIdentitiesIdentityDataModel` → `AuthDataUserIdentitiesIdentityData`.
/// - `UploadModel` → `UploadEntity`.
/// - `AuthenRegisterModel` → `AuthenRegister`.
/// - `AuthenRegisterAppMetadataModel` → `AuthenRegisterAppMetadata`.
/// - `AuthenRegisterUserMetadataModel` → `AuthenRegisterUserMetadata`.
/// - `AuthenRegisterUserModel` → `AuthenRegisterUser`.
/// - `UserUpdatedModel` → `UserUpdated`.
/// - `BillingStoreModel` → `BillingStore`.
/// - `StoreItemModel` → `StoreItem`.
/// - `AppleTransactionModel` → `AppleTransactionEntity`.
/// {@endtemplate}
class $Mapper implements _i1.AutoMapprInterface {
  const $Mapper();

  Type _typeOf<T>() => T;

  List<_i1.AutoMapprInterface> get _delegates => const [];

  /// {@macro AutoMapprInterface:canConvert}
  /// {@macro package:flutter_base/src/mapper/mappers.dart}
  @override
  bool canConvert<SOURCE, TARGET>({bool recursive = true}) {
    final sourceTypeOf = _typeOf<SOURCE>();
    final targetTypeOf = _typeOf<TARGET>();
    if ((sourceTypeOf == _typeOf<_i2.AuthDataModel>() ||
            sourceTypeOf == _typeOf<_i2.AuthDataModel?>()) &&
        (targetTypeOf == _typeOf<_i3.AuthData>() ||
            targetTypeOf == _typeOf<_i3.AuthData?>())) {
      return true;
    }
    if ((sourceTypeOf == _typeOf<_i2.AuthDataUserModel>() ||
            sourceTypeOf == _typeOf<_i2.AuthDataUserModel?>()) &&
        (targetTypeOf == _typeOf<_i3.AuthDataUser>() ||
            targetTypeOf == _typeOf<_i3.AuthDataUser?>())) {
      return true;
    }
    if ((sourceTypeOf == _typeOf<_i2.AuthDataUserAppMetadataModel>() ||
            sourceTypeOf == _typeOf<_i2.AuthDataUserAppMetadataModel?>()) &&
        (targetTypeOf == _typeOf<_i3.AuthDataUserAppMetadata>() ||
            targetTypeOf == _typeOf<_i3.AuthDataUserAppMetadata?>())) {
      return true;
    }
    if ((sourceTypeOf == _typeOf<_i2.AuthDataUserUserMetadataModel>() ||
            sourceTypeOf == _typeOf<_i2.AuthDataUserUserMetadataModel?>()) &&
        (targetTypeOf == _typeOf<_i3.AuthDataUserUserMetadata>() ||
            targetTypeOf == _typeOf<_i3.AuthDataUserUserMetadata?>())) {
      return true;
    }
    if ((sourceTypeOf == _typeOf<_i2.AuthDataUserIdentitiesModel>() ||
            sourceTypeOf == _typeOf<_i2.AuthDataUserIdentitiesModel?>()) &&
        (targetTypeOf == _typeOf<_i3.AuthDataUserIdentities>() ||
            targetTypeOf == _typeOf<_i3.AuthDataUserIdentities?>())) {
      return true;
    }
    if ((sourceTypeOf ==
                _typeOf<_i2.AuthDataUserIdentitiesIdentityDataModel>() ||
            sourceTypeOf ==
                _typeOf<_i2.AuthDataUserIdentitiesIdentityDataModel?>()) &&
        (targetTypeOf == _typeOf<_i3.AuthDataUserIdentitiesIdentityData>() ||
            targetTypeOf ==
                _typeOf<_i3.AuthDataUserIdentitiesIdentityData?>())) {
      return true;
    }
    if ((sourceTypeOf == _typeOf<_i4.UploadModel>() ||
            sourceTypeOf == _typeOf<_i4.UploadModel?>()) &&
        (targetTypeOf == _typeOf<_i5.UploadEntity>() ||
            targetTypeOf == _typeOf<_i5.UploadEntity?>())) {
      return true;
    }
    if ((sourceTypeOf == _typeOf<_i6.AuthenRegisterModel>() ||
            sourceTypeOf == _typeOf<_i6.AuthenRegisterModel?>()) &&
        (targetTypeOf == _typeOf<_i7.AuthenRegister>() ||
            targetTypeOf == _typeOf<_i7.AuthenRegister?>())) {
      return true;
    }
    if ((sourceTypeOf == _typeOf<_i6.AuthenRegisterAppMetadataModel>() ||
            sourceTypeOf == _typeOf<_i6.AuthenRegisterAppMetadataModel?>()) &&
        (targetTypeOf == _typeOf<_i7.AuthenRegisterAppMetadata>() ||
            targetTypeOf == _typeOf<_i7.AuthenRegisterAppMetadata?>())) {
      return true;
    }
    if ((sourceTypeOf == _typeOf<_i6.AuthenRegisterUserMetadataModel>() ||
            sourceTypeOf == _typeOf<_i6.AuthenRegisterUserMetadataModel?>()) &&
        (targetTypeOf == _typeOf<_i7.AuthenRegisterUserMetadata>() ||
            targetTypeOf == _typeOf<_i7.AuthenRegisterUserMetadata?>())) {
      return true;
    }
    if ((sourceTypeOf == _typeOf<_i6.AuthenRegisterUserModel>() ||
            sourceTypeOf == _typeOf<_i6.AuthenRegisterUserModel?>()) &&
        (targetTypeOf == _typeOf<_i7.AuthenRegisterUser>() ||
            targetTypeOf == _typeOf<_i7.AuthenRegisterUser?>())) {
      return true;
    }
    if ((sourceTypeOf == _typeOf<_i8.UserUpdatedModel>() ||
            sourceTypeOf == _typeOf<_i8.UserUpdatedModel?>()) &&
        (targetTypeOf == _typeOf<_i9.UserUpdated>() ||
            targetTypeOf == _typeOf<_i9.UserUpdated?>())) {
      return true;
    }
    if ((sourceTypeOf == _typeOf<_i10.BillingStoreModel>() ||
            sourceTypeOf == _typeOf<_i10.BillingStoreModel?>()) &&
        (targetTypeOf == _typeOf<_i11.BillingStore>() ||
            targetTypeOf == _typeOf<_i11.BillingStore?>())) {
      return true;
    }
    if ((sourceTypeOf == _typeOf<_i10.StoreItemModel>() ||
            sourceTypeOf == _typeOf<_i10.StoreItemModel?>()) &&
        (targetTypeOf == _typeOf<_i11.StoreItem>() ||
            targetTypeOf == _typeOf<_i11.StoreItem?>())) {
      return true;
    }
    if ((sourceTypeOf == _typeOf<_i12.AppleTransactionModel>() ||
            sourceTypeOf == _typeOf<_i12.AppleTransactionModel?>()) &&
        (targetTypeOf == _typeOf<_i13.AppleTransactionEntity>() ||
            targetTypeOf == _typeOf<_i13.AppleTransactionEntity?>())) {
      return true;
    }
    if (recursive) {
      for (final mappr in _delegates) {
        if (mappr.canConvert<SOURCE, TARGET>()) {
          return true;
        }
      }
    }
    return false;
  }

  /// {@macro AutoMapprInterface:convert}
  /// {@macro package:flutter_base/src/mapper/mappers.dart}
  @override
  TARGET convert<SOURCE, TARGET>(SOURCE? model) {
    if (canConvert<SOURCE, TARGET>(recursive: false)) {
      return _convert(model)!;
    }
    for (final mappr in _delegates) {
      if (mappr.canConvert<SOURCE, TARGET>()) {
        return mappr.convert(model)!;
      }
    }

    throw Exception('No ${_typeOf<SOURCE>()} -> ${_typeOf<TARGET>()} mapping.');
  }

  /// {@macro AutoMapprInterface:tryConvert}
  /// {@macro package:flutter_base/src/mapper/mappers.dart}
  @override
  TARGET? tryConvert<SOURCE, TARGET>(
    SOURCE? model, {
    void Function(Object error, StackTrace stackTrace, SOURCE? source)?
    onMappingError,
  }) {
    if (canConvert<SOURCE, TARGET>(recursive: false)) {
      return _safeConvert(model, onMappingError: onMappingError);
    }
    for (final mappr in _delegates) {
      if (mappr.canConvert<SOURCE, TARGET>()) {
        return mappr.tryConvert(model, onMappingError: onMappingError);
      }
    }

    return null;
  }

  /// {@macro AutoMapprInterface:convertIterable}
  /// {@macro package:flutter_base/src/mapper/mappers.dart}
  @override
  Iterable<TARGET> convertIterable<SOURCE, TARGET>(Iterable<SOURCE?> model) {
    if (canConvert<SOURCE, TARGET>(recursive: false)) {
      return model.map<TARGET>((item) => _convert(item)!);
    }
    for (final mappr in _delegates) {
      if (mappr.canConvert<SOURCE, TARGET>()) {
        return mappr.convertIterable(model);
      }
    }

    throw Exception('No ${_typeOf<SOURCE>()} -> ${_typeOf<TARGET>()} mapping.');
  }

  /// For iterable items, converts from SOURCE to TARGET if such mapping is configured, into Iterable.
  ///
  /// When an item in the source iterable is null, uses `whenSourceIsNull` if defined or null
  ///
  /// {@macro package:flutter_base/src/mapper/mappers.dart}
  @override
  Iterable<TARGET?> tryConvertIterable<SOURCE, TARGET>(
    Iterable<SOURCE?> model, {
    void Function(Object error, StackTrace stackTrace, SOURCE? source)?
    onMappingError,
  }) {
    if (canConvert<SOURCE, TARGET>(recursive: false)) {
      return model.map<TARGET?>(
        (item) => _safeConvert(item, onMappingError: onMappingError),
      );
    }
    for (final mappr in _delegates) {
      if (mappr.canConvert<SOURCE, TARGET>()) {
        return mappr.tryConvertIterable(model, onMappingError: onMappingError);
      }
    }

    throw Exception('No ${_typeOf<SOURCE>()} -> ${_typeOf<TARGET>()} mapping.');
  }

  /// {@macro AutoMapprInterface:convertList}
  /// {@macro package:flutter_base/src/mapper/mappers.dart}
  @override
  List<TARGET> convertList<SOURCE, TARGET>(Iterable<SOURCE?> model) {
    if (canConvert<SOURCE, TARGET>(recursive: false)) {
      return convertIterable<SOURCE, TARGET>(model).toList();
    }
    for (final mappr in _delegates) {
      if (mappr.canConvert<SOURCE, TARGET>()) {
        return mappr.convertList(model);
      }
    }

    throw Exception('No ${_typeOf<SOURCE>()} -> ${_typeOf<TARGET>()} mapping.');
  }

  /// For iterable items, converts from SOURCE to TARGET if such mapping is configured, into List.
  ///
  /// When an item in the source iterable is null, uses `whenSourceIsNull` if defined or null
  ///
  /// {@macro package:flutter_base/src/mapper/mappers.dart}
  @override
  List<TARGET?> tryConvertList<SOURCE, TARGET>(
    Iterable<SOURCE?> model, {
    void Function(Object error, StackTrace stackTrace, SOURCE? source)?
    onMappingError,
  }) {
    if (canConvert<SOURCE, TARGET>(recursive: false)) {
      return tryConvertIterable<SOURCE, TARGET>(
        model,
        onMappingError: onMappingError,
      ).toList();
    }
    for (final mappr in _delegates) {
      if (mappr.canConvert<SOURCE, TARGET>()) {
        return mappr.tryConvertList(model, onMappingError: onMappingError);
      }
    }

    throw Exception('No ${_typeOf<SOURCE>()} -> ${_typeOf<TARGET>()} mapping.');
  }

  /// {@macro AutoMapprInterface:convertSet}
  /// {@macro package:flutter_base/src/mapper/mappers.dart}
  @override
  Set<TARGET> convertSet<SOURCE, TARGET>(Iterable<SOURCE?> model) {
    if (canConvert<SOURCE, TARGET>(recursive: false)) {
      return convertIterable<SOURCE, TARGET>(model).toSet();
    }
    for (final mappr in _delegates) {
      if (mappr.canConvert<SOURCE, TARGET>()) {
        return mappr.convertSet(model);
      }
    }

    throw Exception('No ${_typeOf<SOURCE>()} -> ${_typeOf<TARGET>()} mapping.');
  }

  /// For iterable items, converts from SOURCE to TARGET if such mapping is configured, into Set.
  ///
  /// When an item in the source iterable is null, uses `whenSourceIsNull` if defined or null
  ///
  /// {@macro package:flutter_base/src/mapper/mappers.dart}
  @override
  Set<TARGET?> tryConvertSet<SOURCE, TARGET>(
    Iterable<SOURCE?> model, {
    void Function(Object error, StackTrace stackTrace, SOURCE? source)?
    onMappingError,
  }) {
    if (canConvert<SOURCE, TARGET>(recursive: false)) {
      return tryConvertIterable<SOURCE, TARGET>(
        model,
        onMappingError: onMappingError,
      ).toSet();
    }
    for (final mappr in _delegates) {
      if (mappr.canConvert<SOURCE, TARGET>()) {
        return mappr.tryConvertSet(model, onMappingError: onMappingError);
      }
    }

    throw Exception('No ${_typeOf<SOURCE>()} -> ${_typeOf<TARGET>()} mapping.');
  }

  TARGET? _convert<SOURCE, TARGET>(
    SOURCE? model, {
    bool canReturnNull = false,
  }) {
    final sourceTypeOf = _typeOf<SOURCE>();
    final targetTypeOf = _typeOf<TARGET>();
    if ((sourceTypeOf == _typeOf<_i2.AuthDataModel>() ||
            sourceTypeOf == _typeOf<_i2.AuthDataModel?>()) &&
        (targetTypeOf == _typeOf<_i3.AuthData>() ||
            targetTypeOf == _typeOf<_i3.AuthData?>())) {
      if (canReturnNull && model == null) {
        return null;
      }
      return (_map__i2$AuthDataModel_To__i3$AuthData(
            (model as _i2.AuthDataModel?),
          )
          as TARGET);
    }
    if ((sourceTypeOf == _typeOf<_i2.AuthDataUserModel>() ||
            sourceTypeOf == _typeOf<_i2.AuthDataUserModel?>()) &&
        (targetTypeOf == _typeOf<_i3.AuthDataUser>() ||
            targetTypeOf == _typeOf<_i3.AuthDataUser?>())) {
      if (canReturnNull && model == null) {
        return null;
      }
      return (_map__i2$AuthDataUserModel_To__i3$AuthDataUser(
            (model as _i2.AuthDataUserModel?),
          )
          as TARGET);
    }
    if ((sourceTypeOf == _typeOf<_i2.AuthDataUserAppMetadataModel>() ||
            sourceTypeOf == _typeOf<_i2.AuthDataUserAppMetadataModel?>()) &&
        (targetTypeOf == _typeOf<_i3.AuthDataUserAppMetadata>() ||
            targetTypeOf == _typeOf<_i3.AuthDataUserAppMetadata?>())) {
      if (canReturnNull && model == null) {
        return null;
      }
      return (_map__i2$AuthDataUserAppMetadataModel_To__i3$AuthDataUserAppMetadata(
            (model as _i2.AuthDataUserAppMetadataModel?),
          )
          as TARGET);
    }
    if ((sourceTypeOf == _typeOf<_i2.AuthDataUserUserMetadataModel>() ||
            sourceTypeOf == _typeOf<_i2.AuthDataUserUserMetadataModel?>()) &&
        (targetTypeOf == _typeOf<_i3.AuthDataUserUserMetadata>() ||
            targetTypeOf == _typeOf<_i3.AuthDataUserUserMetadata?>())) {
      if (canReturnNull && model == null) {
        return null;
      }
      return (_map__i2$AuthDataUserUserMetadataModel_To__i3$AuthDataUserUserMetadata(
            (model as _i2.AuthDataUserUserMetadataModel?),
          )
          as TARGET);
    }
    if ((sourceTypeOf == _typeOf<_i2.AuthDataUserIdentitiesModel>() ||
            sourceTypeOf == _typeOf<_i2.AuthDataUserIdentitiesModel?>()) &&
        (targetTypeOf == _typeOf<_i3.AuthDataUserIdentities>() ||
            targetTypeOf == _typeOf<_i3.AuthDataUserIdentities?>())) {
      if (canReturnNull && model == null) {
        return null;
      }
      return (_map__i2$AuthDataUserIdentitiesModel_To__i3$AuthDataUserIdentities(
            (model as _i2.AuthDataUserIdentitiesModel?),
          )
          as TARGET);
    }
    if ((sourceTypeOf ==
                _typeOf<_i2.AuthDataUserIdentitiesIdentityDataModel>() ||
            sourceTypeOf ==
                _typeOf<_i2.AuthDataUserIdentitiesIdentityDataModel?>()) &&
        (targetTypeOf == _typeOf<_i3.AuthDataUserIdentitiesIdentityData>() ||
            targetTypeOf ==
                _typeOf<_i3.AuthDataUserIdentitiesIdentityData?>())) {
      if (canReturnNull && model == null) {
        return null;
      }
      return (_map__i2$AuthDataUserIdentitiesIdentityDataModel_To__i3$AuthDataUserIdentitiesIdentityData(
            (model as _i2.AuthDataUserIdentitiesIdentityDataModel?),
          )
          as TARGET);
    }
    if ((sourceTypeOf == _typeOf<_i4.UploadModel>() ||
            sourceTypeOf == _typeOf<_i4.UploadModel?>()) &&
        (targetTypeOf == _typeOf<_i5.UploadEntity>() ||
            targetTypeOf == _typeOf<_i5.UploadEntity?>())) {
      if (canReturnNull && model == null) {
        return null;
      }
      return (_map__i4$UploadModel_To__i5$UploadEntity(
            (model as _i4.UploadModel?),
          )
          as TARGET);
    }
    if ((sourceTypeOf == _typeOf<_i6.AuthenRegisterModel>() ||
            sourceTypeOf == _typeOf<_i6.AuthenRegisterModel?>()) &&
        (targetTypeOf == _typeOf<_i7.AuthenRegister>() ||
            targetTypeOf == _typeOf<_i7.AuthenRegister?>())) {
      if (canReturnNull && model == null) {
        return null;
      }
      return (_map__i6$AuthenRegisterModel_To__i7$AuthenRegister(
            (model as _i6.AuthenRegisterModel?),
          )
          as TARGET);
    }
    if ((sourceTypeOf == _typeOf<_i6.AuthenRegisterAppMetadataModel>() ||
            sourceTypeOf == _typeOf<_i6.AuthenRegisterAppMetadataModel?>()) &&
        (targetTypeOf == _typeOf<_i7.AuthenRegisterAppMetadata>() ||
            targetTypeOf == _typeOf<_i7.AuthenRegisterAppMetadata?>())) {
      if (canReturnNull && model == null) {
        return null;
      }
      return (_map__i6$AuthenRegisterAppMetadataModel_To__i7$AuthenRegisterAppMetadata(
            (model as _i6.AuthenRegisterAppMetadataModel?),
          )
          as TARGET);
    }
    if ((sourceTypeOf == _typeOf<_i6.AuthenRegisterUserMetadataModel>() ||
            sourceTypeOf == _typeOf<_i6.AuthenRegisterUserMetadataModel?>()) &&
        (targetTypeOf == _typeOf<_i7.AuthenRegisterUserMetadata>() ||
            targetTypeOf == _typeOf<_i7.AuthenRegisterUserMetadata?>())) {
      if (canReturnNull && model == null) {
        return null;
      }
      return (_map__i6$AuthenRegisterUserMetadataModel_To__i7$AuthenRegisterUserMetadata(
            (model as _i6.AuthenRegisterUserMetadataModel?),
          )
          as TARGET);
    }
    if ((sourceTypeOf == _typeOf<_i6.AuthenRegisterUserModel>() ||
            sourceTypeOf == _typeOf<_i6.AuthenRegisterUserModel?>()) &&
        (targetTypeOf == _typeOf<_i7.AuthenRegisterUser>() ||
            targetTypeOf == _typeOf<_i7.AuthenRegisterUser?>())) {
      if (canReturnNull && model == null) {
        return null;
      }
      return (_map__i6$AuthenRegisterUserModel_To__i7$AuthenRegisterUser(
            (model as _i6.AuthenRegisterUserModel?),
          )
          as TARGET);
    }
    if ((sourceTypeOf == _typeOf<_i8.UserUpdatedModel>() ||
            sourceTypeOf == _typeOf<_i8.UserUpdatedModel?>()) &&
        (targetTypeOf == _typeOf<_i9.UserUpdated>() ||
            targetTypeOf == _typeOf<_i9.UserUpdated?>())) {
      if (canReturnNull && model == null) {
        return null;
      }
      return (_map__i8$UserUpdatedModel_To__i9$UserUpdated(
            (model as _i8.UserUpdatedModel?),
          )
          as TARGET);
    }
    if ((sourceTypeOf == _typeOf<_i10.BillingStoreModel>() ||
            sourceTypeOf == _typeOf<_i10.BillingStoreModel?>()) &&
        (targetTypeOf == _typeOf<_i11.BillingStore>() ||
            targetTypeOf == _typeOf<_i11.BillingStore?>())) {
      if (canReturnNull && model == null) {
        return null;
      }
      return (_map__i10$BillingStoreModel_To__i11$BillingStore(
            (model as _i10.BillingStoreModel?),
          )
          as TARGET);
    }
    if ((sourceTypeOf == _typeOf<_i10.StoreItemModel>() ||
            sourceTypeOf == _typeOf<_i10.StoreItemModel?>()) &&
        (targetTypeOf == _typeOf<_i11.StoreItem>() ||
            targetTypeOf == _typeOf<_i11.StoreItem?>())) {
      if (canReturnNull && model == null) {
        return null;
      }
      return (_map__i10$StoreItemModel_To__i11$StoreItem(
            (model as _i10.StoreItemModel?),
          )
          as TARGET);
    }
    if ((sourceTypeOf == _typeOf<_i12.AppleTransactionModel>() ||
            sourceTypeOf == _typeOf<_i12.AppleTransactionModel?>()) &&
        (targetTypeOf == _typeOf<_i13.AppleTransactionEntity>() ||
            targetTypeOf == _typeOf<_i13.AppleTransactionEntity?>())) {
      if (canReturnNull && model == null) {
        return null;
      }
      return (_map__i12$AppleTransactionModel_To__i13$AppleTransactionEntity(
            (model as _i12.AppleTransactionModel?),
          )
          as TARGET);
    }
    throw Exception('No ${model.runtimeType} -> $targetTypeOf mapping.');
  }

  TARGET? _safeConvert<SOURCE, TARGET>(
    SOURCE? model, {
    void Function(Object error, StackTrace stackTrace, SOURCE? source)?
    onMappingError,
  }) {
    if (!useSafeMapping<SOURCE, TARGET>()) {
      return _convert(model, canReturnNull: true);
    }
    try {
      return _convert(model, canReturnNull: true);
    } catch (e, s) {
      onMappingError?.call(e, s, model);
      return null;
    }
  }

  /// {@macro AutoMapprInterface:useSafeMapping}
  /// {@macro package:flutter_base/src/mapper/mappers.dart}
  @override
  bool useSafeMapping<SOURCE, TARGET>() {
    return true;
  }

  _i3.AuthData _map__i2$AuthDataModel_To__i3$AuthData(
    _i2.AuthDataModel? input,
  ) {
    final model = input;
    if (model == null) {
      throw Exception(
        r'Mapping AuthDataModel → AuthData failed because AuthDataModel was null, and no default value was provided. '
        r'Consider setting the whenSourceIsNull parameter on the MapType<AuthDataModel, AuthData> to handle null values during mapping.',
      );
    }
    return _i3.AuthData(
      accessToken: model.accessToken,
      refreshToken: model.refreshToken,
      tokenType: model.tokenType,
      expiresIn: model.expiresIn,
      expiresAt: model.expiresAt,
      user: _map__i2$AuthDataUserModel_To__i3$AuthDataUser_Nullable(model.user),
    );
  }

  _i3.AuthDataUser _map__i2$AuthDataUserModel_To__i3$AuthDataUser(
    _i2.AuthDataUserModel? input,
  ) {
    final model = input;
    if (model == null) {
      throw Exception(
        r'Mapping AuthDataUserModel → AuthDataUser failed because AuthDataUserModel was null, and no default value was provided. '
        r'Consider setting the whenSourceIsNull parameter on the MapType<AuthDataUserModel, AuthDataUser> to handle null values during mapping.',
      );
    }
    return _i3.AuthDataUser(
      id: model.id,
      aud: model.aud,
      role: model.role,
      email: model.email,
      emailConfirmedAt: model.emailConfirmedAt,
      phone: model.phone,
      lastSignInAt: model.lastSignInAt,
      appMetadata:
          _map__i2$AuthDataUserAppMetadataModel_To__i3$AuthDataUserAppMetadata_Nullable(
            model.appMetadata,
          ),
      userMetadata:
          _map__i2$AuthDataUserUserMetadataModel_To__i3$AuthDataUserUserMetadata_Nullable(
            model.userMetadata,
          ),
      identities: model.identities
          ?.map<_i3.AuthDataUserIdentities?>(
            (value) =>
                _map__i2$AuthDataUserIdentitiesModel_To__i3$AuthDataUserIdentities_Nullable(
                  value,
                ),
          )
          .toList(),
      createdAt: model.createdAt,
      updatedAt: model.updatedAt,
      confirmedAt: model.confirmedAt,
    );
  }

  _i3.AuthDataUserAppMetadata
  _map__i2$AuthDataUserAppMetadataModel_To__i3$AuthDataUserAppMetadata(
    _i2.AuthDataUserAppMetadataModel? input,
  ) {
    final model = input;
    if (model == null) {
      throw Exception(
        r'Mapping AuthDataUserAppMetadataModel → AuthDataUserAppMetadata failed because AuthDataUserAppMetadataModel was null, and no default value was provided. '
        r'Consider setting the whenSourceIsNull parameter on the MapType<AuthDataUserAppMetadataModel, AuthDataUserAppMetadata> to handle null values during mapping.',
      );
    }
    return _i3.AuthDataUserAppMetadata(
      provider: model.provider,
      providers: model.providers,
    );
  }

  _i3.AuthDataUserUserMetadata
  _map__i2$AuthDataUserUserMetadataModel_To__i3$AuthDataUserUserMetadata(
    _i2.AuthDataUserUserMetadataModel? input,
  ) {
    final model = input;
    if (model == null) {
      throw Exception(
        r'Mapping AuthDataUserUserMetadataModel → AuthDataUserUserMetadata failed because AuthDataUserUserMetadataModel was null, and no default value was provided. '
        r'Consider setting the whenSourceIsNull parameter on the MapType<AuthDataUserUserMetadataModel, AuthDataUserUserMetadata> to handle null values during mapping.',
      );
    }
    return _i3.AuthDataUserUserMetadata(
      email: model.email,
      emailVerified: model.emailVerified,
      name: model.name,
      phoneVerified: model.phoneVerified,
      sub: model.sub,
    );
  }

  _i3.AuthDataUserIdentities
  _map__i2$AuthDataUserIdentitiesModel_To__i3$AuthDataUserIdentities(
    _i2.AuthDataUserIdentitiesModel? input,
  ) {
    final model = input;
    if (model == null) {
      throw Exception(
        r'Mapping AuthDataUserIdentitiesModel → AuthDataUserIdentities failed because AuthDataUserIdentitiesModel was null, and no default value was provided. '
        r'Consider setting the whenSourceIsNull parameter on the MapType<AuthDataUserIdentitiesModel, AuthDataUserIdentities> to handle null values during mapping.',
      );
    }
    return _i3.AuthDataUserIdentities(
      id: model.id,
      userId: model.userId,
      identityData:
          _map__i2$AuthDataUserIdentitiesIdentityDataModel_To__i3$AuthDataUserIdentitiesIdentityData_Nullable(
            model.identityData,
          ),
      provider: model.provider,
      lastSignInAt: model.lastSignInAt,
      createdAt: model.createdAt,
      updatedAt: model.updatedAt,
    );
  }

  _i3.AuthDataUserIdentitiesIdentityData
  _map__i2$AuthDataUserIdentitiesIdentityDataModel_To__i3$AuthDataUserIdentitiesIdentityData(
    _i2.AuthDataUserIdentitiesIdentityDataModel? input,
  ) {
    final model = input;
    if (model == null) {
      throw Exception(
        r'Mapping AuthDataUserIdentitiesIdentityDataModel → AuthDataUserIdentitiesIdentityData failed because AuthDataUserIdentitiesIdentityDataModel was null, and no default value was provided. '
        r'Consider setting the whenSourceIsNull parameter on the MapType<AuthDataUserIdentitiesIdentityDataModel, AuthDataUserIdentitiesIdentityData> to handle null values during mapping.',
      );
    }
    return _i3.AuthDataUserIdentitiesIdentityData(
      email: model.email,
      emailVerified: model.emailVerified,
      name: model.name,
      phoneVerified: model.phoneVerified,
      sub: model.sub,
    );
  }

  _i5.UploadEntity _map__i4$UploadModel_To__i5$UploadEntity(
    _i4.UploadModel? input,
  ) {
    final model = input;
    if (model == null) {
      throw Exception(
        r'Mapping UploadModel → UploadEntity failed because UploadModel was null, and no default value was provided. '
        r'Consider setting the whenSourceIsNull parameter on the MapType<UploadModel, UploadEntity> to handle null values during mapping.',
      );
    }
    return _i5.UploadEntity(url: model.url);
  }

  _i7.AuthenRegister _map__i6$AuthenRegisterModel_To__i7$AuthenRegister(
    _i6.AuthenRegisterModel? input,
  ) {
    final model = input;
    if (model == null) {
      throw Exception(
        r'Mapping AuthenRegisterModel → AuthenRegister failed because AuthenRegisterModel was null, and no default value was provided. '
        r'Consider setting the whenSourceIsNull parameter on the MapType<AuthenRegisterModel, AuthenRegister> to handle null values during mapping.',
      );
    }
    return _i7.AuthenRegister(
      accessToken: model.accessToken,
      refreshToken: model.refreshToken,
      tokenType: model.tokenType,
      expiresIn: model.expiresIn,
      expiresAt: model.expiresAt,
      user: _map__i6$AuthenRegisterUserModel_To__i7$AuthenRegisterUser_Nullable(
        model.user,
      ),
    );
  }

  _i7.AuthenRegisterAppMetadata
  _map__i6$AuthenRegisterAppMetadataModel_To__i7$AuthenRegisterAppMetadata(
    _i6.AuthenRegisterAppMetadataModel? input,
  ) {
    final model = input;
    if (model == null) {
      throw Exception(
        r'Mapping AuthenRegisterAppMetadataModel → AuthenRegisterAppMetadata failed because AuthenRegisterAppMetadataModel was null, and no default value was provided. '
        r'Consider setting the whenSourceIsNull parameter on the MapType<AuthenRegisterAppMetadataModel, AuthenRegisterAppMetadata> to handle null values during mapping.',
      );
    }
    return _i7.AuthenRegisterAppMetadata(
      provider: model.provider,
      providers: model.providers,
    );
  }

  _i7.AuthenRegisterUserMetadata
  _map__i6$AuthenRegisterUserMetadataModel_To__i7$AuthenRegisterUserMetadata(
    _i6.AuthenRegisterUserMetadataModel? input,
  ) {
    final model = input;
    if (model == null) {
      throw Exception(
        r'Mapping AuthenRegisterUserMetadataModel → AuthenRegisterUserMetadata failed because AuthenRegisterUserMetadataModel was null, and no default value was provided. '
        r'Consider setting the whenSourceIsNull parameter on the MapType<AuthenRegisterUserMetadataModel, AuthenRegisterUserMetadata> to handle null values during mapping.',
      );
    }
    return _i7.AuthenRegisterUserMetadata(
      email: model.email,
      emailVerified: model.emailVerified,
      name: model.name,
      phoneVerified: model.phoneVerified,
      sub: model.sub,
    );
  }

  _i7.AuthenRegisterUser
  _map__i6$AuthenRegisterUserModel_To__i7$AuthenRegisterUser(
    _i6.AuthenRegisterUserModel? input,
  ) {
    final model = input;
    if (model == null) {
      throw Exception(
        r'Mapping AuthenRegisterUserModel → AuthenRegisterUser failed because AuthenRegisterUserModel was null, and no default value was provided. '
        r'Consider setting the whenSourceIsNull parameter on the MapType<AuthenRegisterUserModel, AuthenRegisterUser> to handle null values during mapping.',
      );
    }
    return _i7.AuthenRegisterUser(
      id: model.id,
      aud: model.aud,
      email: model.email,
      name: model.name,
      phone: model.phone,
      emailConfirmedAt: model.emailConfirmedAt,
      role: model.role,
      createdAt: model.createdAt,
      updatedAt: model.updatedAt,
      userMetadata:
          _map__i6$AuthenRegisterUserMetadataModel_To__i7$AuthenRegisterUserMetadata_Nullable(
            model.userMetadata,
          ),
      appMetadata:
          _map__i6$AuthenRegisterAppMetadataModel_To__i7$AuthenRegisterAppMetadata_Nullable(
            model.appMetadata,
          ),
    );
  }

  _i9.UserUpdated _map__i8$UserUpdatedModel_To__i9$UserUpdated(
    _i8.UserUpdatedModel? input,
  ) {
    final model = input;
    if (model == null) {
      throw Exception(
        r'Mapping UserUpdatedModel → UserUpdated failed because UserUpdatedModel was null, and no default value was provided. '
        r'Consider setting the whenSourceIsNull parameter on the MapType<UserUpdatedModel, UserUpdated> to handle null values during mapping.',
      );
    }
    return _i9.UserUpdated(
      createdAt: model.createdAt,
      deviceId: model.deviceId,
      id: model.id,
      isManager: model.isManager,
      isShipper: model.isShipper,
    );
  }

  _i11.BillingStore _map__i10$BillingStoreModel_To__i11$BillingStore(
    _i10.BillingStoreModel? input,
  ) {
    final model = input;
    if (model == null) {
      throw Exception(
        r'Mapping BillingStoreModel → BillingStore failed because BillingStoreModel was null, and no default value was provided. '
        r'Consider setting the whenSourceIsNull parameter on the MapType<BillingStoreModel, BillingStore> to handle null values during mapping.',
      );
    }
    return _i11.BillingStore(
      id: model.id,
      createdBy: model.createdBy,
      purchaseAt: model.purchaseAt,
      purchaseToken: model.purchaseToken,
      status: model.status,
      status2: model.status2,
      purchaseId: model.purchaseId,
      createdAt: model.createdAt,
      isRestore: model.isRestore,
      productId: model.productId,
      source: model.source,
    );
  }

  _i11.StoreItem _map__i10$StoreItemModel_To__i11$StoreItem(
    _i10.StoreItemModel? input,
  ) {
    final model = input;
    if (model == null) {
      throw Exception(
        r'Mapping StoreItemModel → StoreItem failed because StoreItemModel was null, and no default value was provided. '
        r'Consider setting the whenSourceIsNull parameter on the MapType<StoreItemModel, StoreItem> to handle null values during mapping.',
      );
    }
    return _i11.StoreItem(id: model.id);
  }

  _i13.AppleTransactionEntity
  _map__i12$AppleTransactionModel_To__i13$AppleTransactionEntity(
    _i12.AppleTransactionModel? input,
  ) {
    final model = input;
    if (model == null) {
      throw Exception(
        r'Mapping AppleTransactionModel → AppleTransactionEntity failed because AppleTransactionModel was null, and no default value was provided. '
        r'Consider setting the whenSourceIsNull parameter on the MapType<AppleTransactionModel, AppleTransactionEntity> to handle null values during mapping.',
      );
    }
    return _i13.AppleTransactionEntity(
      transactionId: model.transactionId,
      originalTransactionId: model.originalTransactionId,
      webOrderLineItemId: model.webOrderLineItemId,
      bundleId: model.bundleId,
      productId: model.productId,
      subscriptionGroupIdentifier: model.subscriptionGroupIdentifier,
      purchaseDate: model.purchaseDate,
      originalPurchaseDate: model.originalPurchaseDate,
      expiresDate: model.expiresDate,
      quantity: model.quantity,
      type: model.type,
      inAppOwnershipType: model.inAppOwnershipType,
      signedDate: model.signedDate,
      environment: model.environment,
      storefront: model.storefront,
      storefrontId: model.storefrontId,
      transactionReason: model.transactionReason,
    );
  }

  _i3.AuthDataUser? _map__i2$AuthDataUserModel_To__i3$AuthDataUser_Nullable(
    _i2.AuthDataUserModel? input,
  ) {
    final model = input;
    if (model == null) {
      return null;
    }
    return _i3.AuthDataUser(
      id: model.id,
      aud: model.aud,
      role: model.role,
      email: model.email,
      emailConfirmedAt: model.emailConfirmedAt,
      phone: model.phone,
      lastSignInAt: model.lastSignInAt,
      appMetadata:
          _map__i2$AuthDataUserAppMetadataModel_To__i3$AuthDataUserAppMetadata_Nullable(
            model.appMetadata,
          ),
      userMetadata:
          _map__i2$AuthDataUserUserMetadataModel_To__i3$AuthDataUserUserMetadata_Nullable(
            model.userMetadata,
          ),
      identities: model.identities
          ?.map<_i3.AuthDataUserIdentities?>(
            (value) =>
                _map__i2$AuthDataUserIdentitiesModel_To__i3$AuthDataUserIdentities_Nullable(
                  value,
                ),
          )
          .toList(),
      createdAt: model.createdAt,
      updatedAt: model.updatedAt,
      confirmedAt: model.confirmedAt,
    );
  }

  _i3.AuthDataUserAppMetadata?
  _map__i2$AuthDataUserAppMetadataModel_To__i3$AuthDataUserAppMetadata_Nullable(
    _i2.AuthDataUserAppMetadataModel? input,
  ) {
    final model = input;
    if (model == null) {
      return null;
    }
    return _i3.AuthDataUserAppMetadata(
      provider: model.provider,
      providers: model.providers,
    );
  }

  _i3.AuthDataUserUserMetadata?
  _map__i2$AuthDataUserUserMetadataModel_To__i3$AuthDataUserUserMetadata_Nullable(
    _i2.AuthDataUserUserMetadataModel? input,
  ) {
    final model = input;
    if (model == null) {
      return null;
    }
    return _i3.AuthDataUserUserMetadata(
      email: model.email,
      emailVerified: model.emailVerified,
      name: model.name,
      phoneVerified: model.phoneVerified,
      sub: model.sub,
    );
  }

  _i3.AuthDataUserIdentities?
  _map__i2$AuthDataUserIdentitiesModel_To__i3$AuthDataUserIdentities_Nullable(
    _i2.AuthDataUserIdentitiesModel? input,
  ) {
    final model = input;
    if (model == null) {
      return null;
    }
    return _i3.AuthDataUserIdentities(
      id: model.id,
      userId: model.userId,
      identityData:
          _map__i2$AuthDataUserIdentitiesIdentityDataModel_To__i3$AuthDataUserIdentitiesIdentityData_Nullable(
            model.identityData,
          ),
      provider: model.provider,
      lastSignInAt: model.lastSignInAt,
      createdAt: model.createdAt,
      updatedAt: model.updatedAt,
    );
  }

  _i3.AuthDataUserIdentitiesIdentityData?
  _map__i2$AuthDataUserIdentitiesIdentityDataModel_To__i3$AuthDataUserIdentitiesIdentityData_Nullable(
    _i2.AuthDataUserIdentitiesIdentityDataModel? input,
  ) {
    final model = input;
    if (model == null) {
      return null;
    }
    return _i3.AuthDataUserIdentitiesIdentityData(
      email: model.email,
      emailVerified: model.emailVerified,
      name: model.name,
      phoneVerified: model.phoneVerified,
      sub: model.sub,
    );
  }

  _i7.AuthenRegisterAppMetadata?
  _map__i6$AuthenRegisterAppMetadataModel_To__i7$AuthenRegisterAppMetadata_Nullable(
    _i6.AuthenRegisterAppMetadataModel? input,
  ) {
    final model = input;
    if (model == null) {
      return null;
    }
    return _i7.AuthenRegisterAppMetadata(
      provider: model.provider,
      providers: model.providers,
    );
  }

  _i7.AuthenRegisterUserMetadata?
  _map__i6$AuthenRegisterUserMetadataModel_To__i7$AuthenRegisterUserMetadata_Nullable(
    _i6.AuthenRegisterUserMetadataModel? input,
  ) {
    final model = input;
    if (model == null) {
      return null;
    }
    return _i7.AuthenRegisterUserMetadata(
      email: model.email,
      emailVerified: model.emailVerified,
      name: model.name,
      phoneVerified: model.phoneVerified,
      sub: model.sub,
    );
  }

  _i7.AuthenRegisterUser?
  _map__i6$AuthenRegisterUserModel_To__i7$AuthenRegisterUser_Nullable(
    _i6.AuthenRegisterUserModel? input,
  ) {
    final model = input;
    if (model == null) {
      return null;
    }
    return _i7.AuthenRegisterUser(
      id: model.id,
      aud: model.aud,
      email: model.email,
      name: model.name,
      phone: model.phone,
      emailConfirmedAt: model.emailConfirmedAt,
      role: model.role,
      createdAt: model.createdAt,
      updatedAt: model.updatedAt,
      userMetadata:
          _map__i6$AuthenRegisterUserMetadataModel_To__i7$AuthenRegisterUserMetadata_Nullable(
            model.userMetadata,
          ),
      appMetadata:
          _map__i6$AuthenRegisterAppMetadataModel_To__i7$AuthenRegisterAppMetadata_Nullable(
            model.appMetadata,
          ),
    );
  }
}
