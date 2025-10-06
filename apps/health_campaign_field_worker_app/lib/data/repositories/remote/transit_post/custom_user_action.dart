import 'package:digit_data_model/data_model.dart';
import 'package:digit_data_model/models/entities/user_action.dart';

// This will create , update and search data from remote Repository
class CustomUserActionRemoteRepository
    extends RemoteRepository<UserActionModel, UserActionSearchModel> {
  CustomUserActionRemoteRepository(
    super.dio, {
    required super.actionMap,
    super.entityName = 'UserAction',
    super.isSearchResponsePlural = true,
  });

  @override
  DataModelType get type => DataModelType.userAction;
}
