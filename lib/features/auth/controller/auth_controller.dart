import 'package:chondohealth/core/functions/loader.dart';

class CAuth {
  signUP() {
    showLoader();
    Future.delayed(Duration(seconds: 10)).then((v) {
      hideLoader();
    });
  }
}
