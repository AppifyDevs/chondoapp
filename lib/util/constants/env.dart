import 'package:flutter/foundation.dart';

class ENV {
  final bool isLive = !kDebugMode;
  late String baseUrl = isLive ? "https://api.chondo.app/" : "https://api.chondo.app/";
}
