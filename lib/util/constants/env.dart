import 'package:flutter/foundation.dart';

class ENV {
  final bool isLive = !kDebugMode;
  late String baseUrl = isLive ? "baseUrl of the Project DEV" : "baseUrl of the Project Prod";
}
