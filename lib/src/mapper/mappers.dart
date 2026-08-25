import 'package:auto_mappr_annotation/auto_mappr_annotation.dart';
import 'package:flutter_base/src/authentication/auth.dart';
import 'package:flutter_base/src/data/models/apple_transaction_model.dart';
import 'package:flutter_base/src/data/models/auth_model.dart';
import 'package:flutter_base/src/domain/entities/apple_transaction.dart';

import '../data/models/auth_register_model.dart';
import '../data/models/billing_store_model.dart';
import '../data/models/upload_model.dart';
import '../data/models/user_updated_model.dart';
import '../domain/entities/auth_register.dart';
import '../domain/entities/billing_store.dart';
import '../domain/entities/upload_entity.dart';
import '../domain/entities/user_updated.dart';
import 'mappers.auto_mappr.dart';

@AutoMappr([
  MapType<AuthDataModel, AuthData>(),
  MapType<AuthDataUserModel, AuthDataUser>(),
  MapType<AuthDataUserAppMetadataModel, AuthDataUserAppMetadata>(),
  MapType<AuthDataUserUserMetadataModel, AuthDataUserUserMetadata>(),
  MapType<AuthDataUserIdentitiesModel, AuthDataUserIdentities>(),
  MapType<
    AuthDataUserIdentitiesIdentityDataModel,
    AuthDataUserIdentitiesIdentityData
  >(),
  MapType<UploadModel, UploadEntity>(),
  MapType<AuthenRegisterModel, AuthenRegister>(),
  MapType<AuthenRegisterAppMetadataModel, AuthenRegisterAppMetadata>(),
  MapType<AuthenRegisterUserMetadataModel, AuthenRegisterUserMetadata>(),
  MapType<AuthenRegisterUserModel, AuthenRegisterUser>(),
  MapType<UserUpdatedModel, UserUpdated>(),
  MapType<BillingStoreModel, BillingStore>(),
  MapType<StoreItemModel, StoreItem>(),
  MapType<AppleTransactionModel, AppleTransactionEntity>(),
])
class Mapper extends $Mapper {
  @override
  bool useSafeMapping<SOURCE, TARGET>() {
    return true;
  }
}
