import 'package:chondohealth/core/controllers/base_controller.dart';
import 'package:chondohealth/core/functions/loader.dart';
import 'package:chondohealth/core/functions/snackbar.dart';
import 'package:chondohealth/features/auth/api/auth_api.dart';
import 'package:chondohealth/features/auth/models/sign_info_model.dart';
import 'package:chondohealth/features/profile/controller/profile_controller.dart';
import 'package:chondohealth/features/root_screen.dart';
import 'package:chondohealth/util/constants/keys.dart';
import 'package:chondohealth/util/services/navigation_service.dart';
import 'package:chondohealth/util/services/shared_preference_service.dart';
import 'package:get/get.dart';

class CAuth extends CBase {
  final AuthApi _authApi = AuthApi();

  MSignIn signInInfo = MSignIn();
  signIn({required String email, required String password}) async {
    showLoader();
    try {
      signInInfo = await _authApi.signInApi(email, password);
      hideLoader();
      if (signInInfo.status == 200) {
        SharedPrefService.instance.setString(PKeys.usertoken, signInInfo.token ?? "");
        SharedPrefService.instance.setInt(PKeys.userId, signInInfo.user!.id!);
        final CProfile cProfile = Get.put(CProfile());
        cProfile.setUserId(signInInfo.user!.id!);
        const SRoot().pushAndRemoveUntil();
      } else {
        showSnackBar("Something went wrong!");
      }
    } catch (e, s) {
      hideLoader();
      setException(
        error: e,
        stackTrace: s,
        setExceptionOnly: true,
      );
    }
  }
}
