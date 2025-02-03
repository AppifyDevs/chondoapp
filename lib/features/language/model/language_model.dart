import 'package:get/get.dart';

class Languages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'languageSelection': 'Select Language',
          'hello': 'Hello',
        },
        'bn_BD': {
          'languageSelection': 'ভাষা নির্বাচন করুন',
          'hello': 'OHE',
        },
      };
}

class MTranslate {
  final String key;

  MTranslate(this.key);
  String get tr => key.tr; // `tr` will automatically fetch from GetX translations

  // Static instances for auto-completion
  static final languageSelection = MTranslate('languageSelection');
  static final hello = MTranslate('hello');
}
