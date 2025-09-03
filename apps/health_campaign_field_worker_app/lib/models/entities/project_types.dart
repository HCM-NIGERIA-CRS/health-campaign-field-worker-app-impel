import 'package:dart_mappable/dart_mappable.dart';

part 'project_types.mapper.dart';

@MappableEnum(caseStyle: CaseStyle.upperCase)
enum ProjectTypes {
  @MappableValue("Polio-ng")
  polio,
  @MappableValue("Polio-smc-ng")
  oncho,
}
