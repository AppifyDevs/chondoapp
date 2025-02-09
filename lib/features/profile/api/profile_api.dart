import 'package:chondohealth/features/home/models/user_detail_model.dart';
import 'package:chondohealth/features/profile/controller/profile_controller.dart';
import 'package:chondohealth/util/services/dio_service.dart';
import 'package:dio/dio.dart' as asdio;
import 'package:get/get.dart';

class ProfileApi {
  String _userDetailsPath(String id) => 'api/v1/users/$id';

  Future<MUserDetails> userDetailApi() async {
    final CProfile cProfile = Get.find();
    asdio.Response res = await makeRequest(
      method: HTTPMethod.get,
      path: _userDetailsPath(cProfile.userId.toString()),
    );
    return MUserDetails.fromJson(res.data);
  }
}
