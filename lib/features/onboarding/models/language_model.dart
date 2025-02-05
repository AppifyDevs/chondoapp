import 'package:get/get.dart';

class Languages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'languageSelection': 'Select Language',
          'languageSelectionDescription': 'You can change selected language later from your menu tab.',
          'onBoarding1Title': 'Track Your mood and reflect on your day',
          'onBoarding1Description':
              'Get an overview of how you are performing and motivate yourself to achieve even Period.',
          'onBoarding2Title': 'Share Report With Your Partner & Doctor',
          'onBoarding2Description': "Celebrate the beauty of your body's natural rhythm as your trusted companion.",
          'onBoarding3Title': 'Know Your Body Better Than Ever!',
          'onBoarding3Description':
              'Embrace the ebb and flow of your cycle, and let every period inspire your greatness.',
          "log_in_to_your_account": "Log in to your account",
          "enterYourValidEmail": "Enter your valid email and password for login on CHONDO.",
          "email": "Email Address",
          "password": "Password",
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
  static final onBoarding1Title = MTranslate('onBoarding1Title');
  static final onBoarding2Title = MTranslate('onBoarding2Title');
  static final onBoarding3Title = MTranslate('onBoarding3Title');
  static final onBoarding1Description = MTranslate('onBoarding1Description');
  static final onBoarding2Description = MTranslate('onBoarding2Description');
  static final onBoarding3Description = MTranslate('onBoarding3Description');
  static final logInToYourAccount = MTranslate('log_in_to_your_account');
  static final enterYourValidEmail = MTranslate('enterYourValidEmail');
  static final email = MTranslate('email');
  static final password = MTranslate('password');
}
