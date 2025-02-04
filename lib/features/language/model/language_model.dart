import 'package:get/get.dart';

class Languages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'languageSelection': 'Select Language',
          'languageSelectionDescription': 'You can change selected language later from your menu tab.',
        },
        'bn_BD': {
          'languageSelection': 'ভাষা নির্বাচন করুন',
          'languageSelectionDescription': 'আপনি আপনার মেনু থেকে নির্বাচিত ভাষা পরে পরিবর্তন করতে পারেন',
        },
      };
}

class MTranslate {
  final String key;

  MTranslate(this.key);
  String get tr => key.tr; // `tr` will automatically fetch from GetX translations

  // Static instances for auto-completion
  static final languageSelection = MTranslate('languageSelection');
  static final languageSelectionDescription = MTranslate('languageSelectionDescription');
}
