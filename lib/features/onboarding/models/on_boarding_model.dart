import 'package:chondohealth/features/onboarding/models/language_model.dart';
import 'package:chondohealth/gen/assets.gen.dart';

class MOnBoarding {
  int? id;
  String imagePath;
  String? titleText;
  String? subTitleText;
  MOnBoarding({this.id, required this.imagePath, this.subTitleText, this.titleText});
}

List<MOnBoarding> onBoardingList = [
  MOnBoarding(
    id: 1,
    imagePath: Assets.images.onBoarding1.path,
    titleText: MTranslate.onBoarding1Title.tr,
    subTitleText: MTranslate.onBoarding1Description.tr,
  ),
  MOnBoarding(
    id: 2,
    imagePath: Assets.images.onBoarding2.path,
    titleText: MTranslate.onBoarding2Title.tr,
    subTitleText: MTranslate.onBoarding2Description.tr,
  ),
  MOnBoarding(
    id: 3,
    imagePath: Assets.images.onBoarding3.path,
    titleText: MTranslate.onBoarding3Title.tr,
    subTitleText: MTranslate.onBoarding3Description.tr,
  ),
];
