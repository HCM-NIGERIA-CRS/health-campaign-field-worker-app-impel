import 'package:dart_mappable/dart_mappable.dart';

@MappableEnum(caseStyle: CaseStyle.upperCase)
enum ProjectTypes {
  @MappableValue("polio")
  polio,
  @MappableValue("oncho")
  oncho,
}
