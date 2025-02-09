import 'package:chondohealth/features/auth/views/sign_in_screen.dart';
import 'package:chondohealth/features/onboarding/views/language_selection_screen.dart';
import 'package:chondohealth/features/profile/controller/profile_controller.dart';
import 'package:chondohealth/features/root_screen.dart';
import 'package:chondohealth/util/constants/keys.dart';
import 'package:chondohealth/util/services/navigation_service.dart';
import 'package:chondohealth/util/services/shared_preference_service.dart';
import 'package:get/get.dart';

class CCheckPoint {
  initilization() async {
    Future.delayed(
      const Duration(milliseconds: 500),
      () async {
        //
        await SharedPrefService.instance.getString(PKeys.usertoken).then(
          (String token) async {
            if (token.isNotEmpty) {
              int userId = await SharedPrefService.instance.getInt(PKeys.userId);
              final CProfile cProfile = Get.put(CProfile());
              await cProfile.setUserId(userId);
              await const SRoot().pushAndRemoveUntil();
            } else {
              await SharedPrefService.instance.getBool(PKeys.isBoardingShown).then(
                (bool isOnboardshown) {
                  if (isOnboardshown == true) {
                    const SSignIn().pushAndRemoveUntil();
                  } else {
                    const SLanguageSelection().pushAndRemoveUntil();
                  }
                },
              );
            }
          },
        );
      },
    );
  }
}
