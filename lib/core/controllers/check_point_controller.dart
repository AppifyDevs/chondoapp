import 'package:chondohealth/features/onboarding/views/language_selection_screen.dart';
import 'package:chondohealth/util/services/navigation_service.dart';

class CCheckPoint {
  initilization() async {
    Future.delayed(const Duration(milliseconds: 500), () async {
      await const SLanguageSelection().pushAndRemoveUntil();
    });
  }
}
