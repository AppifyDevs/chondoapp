import 'package:chondohealth/gen/assets.gen.dart';

class MAvatarSelection {
  String? iconPath;
  MAvatarSelection({this.iconPath});
}

List<MAvatarSelection> avatarList = [
  MAvatarSelection(iconPath: Assets.avatar.avatar1.path),
  MAvatarSelection(iconPath: Assets.avatar.avatar2.path),
  MAvatarSelection(iconPath: Assets.avatar.avatar3.path),
  MAvatarSelection(iconPath: Assets.avatar.avatar4.path),
  MAvatarSelection(iconPath: Assets.avatar.avatar5.path),
];
