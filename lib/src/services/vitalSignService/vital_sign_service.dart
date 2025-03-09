import 'package:coherent/src/core/utils/urls.dart';
import 'package:coherent/src/services/common_services/api_service.dart';

import '../../model/vitalSignsModel.dart';

class VitalSignService {
  Future<VitalSignsModel?> getVitalSign(String mrno) async {
    try {
      var response = await APIService.get(api: URL.vitalSignsUrl+mrno);
      if (response != null) {
        return vitalSignsModelFromJson(response);
      }
    } catch (e) {
      print(e);
    }
    return null;
  }
}
