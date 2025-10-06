class GlobalSearchParametersSMC {
  final bool isProximityEnabled;
  final double? latitude;
  final String? projectId;
  final double? longitude;
  final double? maxRadius;
  final String? nameSearch;
  final String? beneficiaryId;
  final bool? isChildAbsentEnabled;
  final bool? isHouseNonCompliant;
  final int? offset;
  final int? limit;
  final List<String>? filter;
  final int? totalCount;

  GlobalSearchParametersSMC(
      {required this.isProximityEnabled,
      required this.latitude,
      required this.longitude,
      required this.maxRadius,
      required this.nameSearch,
      required this.beneficiaryId,
      required this.isChildAbsentEnabled,
      required this.isHouseNonCompliant,
      required this.offset,
      required this.limit,
      required this.filter,
      this.totalCount,
      this.projectId});
}
