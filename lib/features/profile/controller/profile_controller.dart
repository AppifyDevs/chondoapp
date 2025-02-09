import 'package:chondohealth/core/controllers/base_controller.dart';
import 'package:chondohealth/features/auth/views/sign_in_screen.dart';
import 'package:chondohealth/features/home/models/user_detail_model.dart';
import 'package:chondohealth/features/profile/api/profile_api.dart';
import 'package:chondohealth/util/services/navigation_service.dart';
import 'package:chondohealth/util/services/shared_preference_service.dart';
import 'package:get/get.dart';

class CProfile extends CBase {
  final ProfileApi _profileApi = ProfileApi();
  int? userId;
  setUserId(int value) {
    userId = value;
  }

  MUserDetails userDetails = MUserDetails();
  getUserDetails() async {
    try {
      userDetails = await _profileApi.userDetailApi();
    } catch (e, s) {
      setException(
        error: e,
        stackTrace: s,
        setExceptionOnly: true,
      );
    }
    update();
  }

  logOut() {
    SharedPrefService.instance.clear();
    Get.deleteAll();
    const SSignIn().pushAndRemoveUntil();
  }
}
