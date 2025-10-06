import 'package:dart_mappable/dart_mappable.dart';

part 'user_action_enums.mapper.dart';

@MappableEnum(caseStyle: CaseStyle.upperCase)
enum UserActionEnums {
  @MappableValue("TRANSIT")
  transit,
  @MappableValue("FIXED")
  fixed,
  @MappableValue("DAILY_PLAN")
  dailyPlan,
  @MappableValue("NON_COMPLIANCE")
  nonCompliance;
}
