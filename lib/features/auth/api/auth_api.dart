import 'package:chondohealth/features/auth/models/sign_info_model.dart';
import 'package:chondohealth/util/services/dio_service.dart';
import 'package:dio/dio.dart';

class AuthApi {
  late final String _signInPath = 'api/auth/login';

  Future<MSignIn> signInApi(String email, String password) async {
    Response res = await makeRequest(
      method: HTTPMethod.post,
      path: _signInPath,
      data: {
        "email": email,
        "password": password,
      },
    );
    return MSignIn.fromJson(res.data);
  }
}
