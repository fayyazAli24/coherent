import 'dart:convert';

List<LabResultModel> labResultModelFromJson(String str) =>
    List<LabResultModel>.from(json.decode(str).map((x) => LabResultModel.fromJson(x)));

String labResultModelToJson(List<LabResultModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class LabResultModel {
  String testName;
  DateTime performDate;
  String observationValue;
  String? units;
  double? referenceRangeMin;
  int? referenceRangeMax;
  String? abnormalFlag;

  LabResultModel({
    required this.testName,
    required this.performDate,
    required this.observationValue,
    required this.units,
    required this.referenceRangeMin,
    required this.referenceRangeMax,
    required this.abnormalFlag,
  });

  factory LabResultModel.fromJson(Map<String, dynamic> json) => LabResultModel(
        testName: json["testName"],
        performDate: DateTime.parse(json["performDate"]),
        observationValue: json["observationValue"],
        units: json["units"],
        referenceRangeMin: json["referenceRangeMin"]?.toDouble(),
        referenceRangeMax: json["referenceRangeMax"],
        abnormalFlag: json["abnormalFlag"],
      );

  Map<String, dynamic> toJson() => {
        "testName": testName,
        "performDate": performDate.toIso8601String(),
        "observationValue": observationValue,
        "units": units,
        "referenceRangeMin": referenceRangeMin,
        "referenceRangeMax": referenceRangeMax,
        "abnormalFlag": abnormalFlag,
      };
}
