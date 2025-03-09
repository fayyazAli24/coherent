import 'package:coherent/src/services/auth_services/auth_service.dart';
import 'package:get/get.dart';
import '../../model/login_model.dart';

class AuthController extends GetxController {
  var loginResponse = Rxn<LoginModel>(null);
  var signupResponse = Rxn<String>(null);
  var mrno = Rxn<String>(null);
  RxBool isLoading = false.obs;

  Future<LoginModel?> loginService(String email, String password) async {
    try {
      isLoading.value = true;
      var response = await AuthService().loginService(email, password);
      if (response != null) {
        loginResponse.value = response;
        isLoading.value = false;
        return loginResponse.value;
      }
    } catch (e) {
      isLoading.value = false;
      print(e);
    }

    return null;
  }

  Future<String?> signupService(String fullname, String email, String password,
      String mrNo, String emiratesId, String phoneNumber, String dob) async {
    try {
      isLoading.value = true;

      var response = await AuthService().signupService(
          fullname, email, password, mrNo, emiratesId, phoneNumber, dob);
      if (response != null) {
        isLoading.value = false;
        signupResponse.value = response;
        return signupResponse.value;
      }
    } catch (e) {
      isLoading.value = false;
      print(e);
    }
    return null;
  }
}
