import 'package:flutter/foundation.dart';

printer(value) {
  if (kDebugMode) {
    print(value);
  }
}

errorPrint(value) {
  printer("🐞 $value 🐛");
}

infoPrint(value) {
  printer("📌 $value 📌");
}
