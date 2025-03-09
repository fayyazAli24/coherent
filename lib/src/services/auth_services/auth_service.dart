import 'package:coherent/src/core/utils/urls.dart';

import '../../model/login_model.dart';
import '../common_services/api_service.dart';

class AuthService {
  Future<LoginModel?> loginService(String email, String password) async {
    try {
      var body = {"email": email, "password": password};
      var response = await APIService.signup(api: URL.signupUrl, body: body);
      if (response != null) {
        return loginModelFromJson(response);
      }
    } catch (e) {
      print(e);
    }
    return null;
  }

  Future<String?> signupService(String fullname, String email, String password,
      String mrNo, String emiratesId, String phoneNumber, String dob) async {
    try {
      var body = {
        'fullname': fullname,
        'email': email,
        'password': password,
        'mrNo': mrNo,
        'emiratesId': emiratesId,
        'phoneNumber': phoneNumber,
        'dob': dob
      };
      var response = await APIService.login(api: URL.loginUrl, body: body);
      if (response != null) {
        return response;
      }
    } catch (e) {
      print(e);
    }
    return null;
  }
}
