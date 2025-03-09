import 'dart:convert';

VitalSignsModel vitalSignsModelFromJson(String str) => VitalSignsModel.fromJson(json.decode(str));

String vitalSignsModelToJson(VitalSignsModel data) => json.encode(data.toJson());

class VitalSignsModel {
  List<VitalSign>? vitalSigns;
  List<BmI>? bmIs;

  VitalSignsModel({
    this.vitalSigns,
    this.bmIs,
  });

  factory VitalSignsModel.fromJson(Map<String, dynamic> json) => VitalSignsModel(
    vitalSigns: json["vitalSigns"] != null
        ? List<VitalSign>.from(json["vitalSigns"].map((x) => VitalSign.fromJson(x)))
        : [],
    bmIs: json["bmIs"] != null
        ? List<BmI>.from(json["bmIs"].map((x) => BmI.fromJson(x)))
        : [],
  );

  Map<String, dynamic> toJson() => {
    "vitalSigns": vitalSigns != null ? List<dynamic>.from(vitalSigns!.map((x) => x.toJson())) : [],
    "bmIs": bmIs != null ? List<dynamic>.from(bmIs!.map((x) => x.toJson())) : [],
  };
}

class BmI {
  double? weight;
  double? height;
  double? bmi;
  DateTime? entryDate;

  BmI({
    this.weight,
    this.height,
    this.bmi,
    this.entryDate,
  });

  factory BmI.fromJson(Map<String, dynamic> json) => BmI(
    weight: json["weight"]?.toDouble(),
    height: json["height"]?.toDouble(),
    bmi: json["bmi"]?.toDouble(),
    entryDate: json["entryDate"] != null ? DateTime.parse(json["entryDate"]) : null,
  );

  Map<String, dynamic> toJson() => {
    "weight": weight,
    "height": height,
    "bmi": bmi,
    "entryDate": entryDate?.toIso8601String(),
  };
}

class VitalSign {
  int? bpSystolic;
  DateTime? bpSystolicEntryDate;
  int? bpDiastolic;
  DateTime? bpDiastolicEntryDate;
  int? pulseRate;
  DateTime? pulseEntryDate;
  double? temperature;
  DateTime? temperatureEntryDate;
  int? respirationRate;
  DateTime? respirationRateEntryDate;
  int? weight;
  DateTime? weightEntryDate;
  int? height;
  DateTime? heightEntryDate;
  dynamic pain;
  DateTime? painEntryDate;

  VitalSign({
    this.bpSystolic,
    this.bpSystolicEntryDate,
    this.bpDiastolic,
    this.bpDiastolicEntryDate,
    this.pulseRate,
    this.pulseEntryDate,
    this.temperature,
    this.temperatureEntryDate,
    this.respirationRate,
    this.respirationRateEntryDate,
    this.weight,
    this.weightEntryDate,
    this.height,
    this.heightEntryDate,
    this.pain,
    this.painEntryDate,
  });

  factory VitalSign.fromJson(Map<String, dynamic> json) => VitalSign(
    bpSystolic: json["bpSystolic"],
    bpSystolicEntryDate:
    json["bpSystolicEntryDate"] != null ? DateTime.parse(json["bpSystolicEntryDate"]) : null,
    bpDiastolic: json["bpDiastolic"],
    bpDiastolicEntryDate:
    json["bpDiastolicEntryDate"] != null ? DateTime.parse(json["bpDiastolicEntryDate"]) : null,
    pulseRate: json["pulseRate"],
    pulseEntryDate: json["pulseEntryDate"] != null ? DateTime.parse(json["pulseEntryDate"]) : null,
    temperature: json["temperature"]?.toDouble(),
    temperatureEntryDate:
    json["temperatureEntryDate"] != null ? DateTime.parse(json["temperatureEntryDate"]) : null,
    respirationRate: json["respirationRate"],
    respirationRateEntryDate:
    json["respirationRateEntryDate"] != null ? DateTime.parse(json["respirationRateEntryDate"]) : null,
    weight: json["weight"],
    weightEntryDate: json["weightEntryDate"] != null ? DateTime.parse(json["weightEntryDate"]) : null,
    height: json["height"],
    heightEntryDate: json["heightEntryDate"] != null ? DateTime.parse(json["heightEntryDate"]) : null,
    pain: json["pain"],
    painEntryDate: json["painEntryDate"] != null ? DateTime.parse(json["painEntryDate"]) : null,
  );

  Map<String, dynamic> toJson() => {
    "bpSystolic": bpSystolic,
    "bpSystolicEntryDate": bpSystolicEntryDate?.toIso8601String(),
    "bpDiastolic": bpDiastolic,
    "bpDiastolicEntryDate": bpDiastolicEntryDate?.toIso8601String(),
    "pulseRate": pulseRate,
    "pulseEntryDate": pulseEntryDate?.toIso8601String(),
    "temperature": temperature,
    "temperatureEntryDate": temperatureEntryDate?.toIso8601String(),
    "respirationRate": respirationRate,
    "respirationRateEntryDate": respirationRateEntryDate?.toIso8601String(),
    "weight": weight,
    "weightEntryDate": weightEntryDate?.toIso8601String(),
    "height": height,
    "heightEntryDate": heightEntryDate?.toIso8601String(),
    "pain": pain,
    "painEntryDate": painEntryDate?.toIso8601String(),
  };
}
