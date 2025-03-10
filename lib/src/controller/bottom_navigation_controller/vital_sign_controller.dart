import 'package:coherent/src/model/vitalSignsModel.dart';
import 'package:coherent/src/services/vitalSignService/vital_sign_service.dart';
import 'package:coherent/src/view/components/vital_signs_components/line_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class VitalSignController extends GetxController {
  RxBool isLoading = false.obs;
  var vitalSignResponse = Rx<VitalSignsModel?>(null);

  Future<void> getVitalSign(String mrno) async {
    try {
      isLoading.value = true;
      var response = await VitalSignService().getVitalSign(mrno);
      vitalSignResponse.value = response;
    } catch (e) {
      print(e);
    } finally {
      isLoading.value = false;
    }
  }

  List<Map<String, dynamic>> getVitalSignsList() {
    var latestVital = vitalSignResponse.value?.vitalSigns?.lastOrNull;

    return [
      {
        "icon": Icons.monitor_weight,
        "title": "Weight",
        "value": "${latestVital?.weight ?? '--'} KG",
        "iconColor": Colors.blue,
        "textColor": Colors.green,
        "trailingIcon": Icons.monitor_weight,
        "trailColor": Colors.blue,
        "Date": latestVital?.weightEntryDate
      },
      {
        "icon": Icons.height,
        "title": "Height",
        "value": "${latestVital?.height ?? '--'} cm",
        "iconColor": Colors.orange,
        "textColor": Colors.green,
        "trailingIcon": Icons.height,
        "trailColor": Colors.blue,
        "Date": latestVital?.heightEntryDate
      },
      {
        "icon": Icons.bloodtype_outlined,
        "title": "Blood Pressure",
        "value": latestVital != null
            ? "${latestVital.bpSystolic ?? '--'}/${latestVital.bpDiastolic ?? '--'} mmHg"
            : "--/-- mmHg",
        "iconColor": Colors.redAccent,
        "textColor": Colors.green,
        "trailingIcon": Icons.bloodtype_sharp,
        "trailColor": Colors.redAccent,
        "Date": latestVital?.bpDiastolicEntryDate
      },
      {
        "icon": Icons.thermostat,
        "title": "Temperature",
        "value": latestVital?.temperature != null ? "${latestVital!.temperature}°C" : "-- °C",
        "iconColor": Colors.orangeAccent,
        "textColor": Colors.green,
        "trailingIcon": Icons.thermostat,
        "trailColor": Colors.orangeAccent,
        "Date": latestVital?.temperatureEntryDate
      },
      {
        "icon": Icons.monitor_heart,
        "title": "Pulse Rate",
        "value": latestVital?.pulseRate != null ? "${latestVital!.pulseRate} bpm" : "-- bpm",
        "iconColor": Colors.blue,
        "textColor": Colors.green,
        "trailingIcon": Icons.favorite,
        "trailColor": Colors.blue,
        "Date": latestVital?.pulseEntryDate
      },
    ];
  }

  List<ChartData>? getBmi() {
    var bmiList = vitalSignResponse.value?.bmIs;
    List<ChartData>? data = [];
    if (bmiList != null) {
      print(' inside not null');
      for (int i = 0; i < bmiList.length; i++) {
        data.add(ChartData(DateFormat('E').format(bmiList[i].entryDate!), bmiList[i].bmi!));
        print('the data is ${data}');
      }
      return data;
    }
    return null;
  }
}
