// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'user_action_enums.dart';

class UserActionEnumsMapper extends EnumMapper<UserActionEnums> {
  UserActionEnumsMapper._();

  static UserActionEnumsMapper? _instance;
  static UserActionEnumsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = UserActionEnumsMapper._());
    }
    return _instance!;
  }

  static UserActionEnums fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  UserActionEnums decode(dynamic value) {
    switch (value) {
      case "TRANSIT":
        return UserActionEnums.transit;
      case "FIXED":
        return UserActionEnums.fixed;
      case "DAILY_PLAN":
        return UserActionEnums.dailyPlan;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(UserActionEnums self) {
    switch (self) {
      case UserActionEnums.transit:
        return "TRANSIT";
      case UserActionEnums.fixed:
        return "FIXED";
      case UserActionEnums.dailyPlan:
        return "DAILY_PLAN";
    }
  }
}

extension UserActionEnumsMapperExtension on UserActionEnums {
  dynamic toValue() {
    UserActionEnumsMapper.ensureInitialized();
    return MapperContainer.globals.toValue<UserActionEnums>(this);
  }
}
