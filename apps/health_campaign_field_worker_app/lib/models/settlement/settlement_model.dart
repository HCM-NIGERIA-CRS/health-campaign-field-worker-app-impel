import 'dart:convert';

SettlementModel settlementModelFromJson(String str) =>
    SettlementModel.fromJson(json.decode(str));

String settlementModelToJson(SettlementModel data) =>
    json.encode(data.toJson());

class SettlementModel {
  String boundaryCode;
  String dayOfVisit;

  SettlementModel({
    required this.boundaryCode,
    required this.dayOfVisit,
  });

  factory SettlementModel.fromJson(Map<String, dynamic> json) =>
      SettlementModel(
        boundaryCode: json["boundaryCode"],
        dayOfVisit: json["dayOfVisit"],
      );

  Map<String, dynamic> toJson() => {
        "boundaryCode": boundaryCode,
        "dayOfVisit": dayOfVisit,
      };
}
