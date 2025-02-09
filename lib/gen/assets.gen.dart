/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsAvatarGen {
  const $AssetsAvatarGen();

  /// File path: assets/avatar/avatar1.png
  AssetGenImage get avatar1 => const AssetGenImage('assets/avatar/avatar1.png');

  /// File path: assets/avatar/avatar2.png
  AssetGenImage get avatar2 => const AssetGenImage('assets/avatar/avatar2.png');

  /// File path: assets/avatar/avatar3.png
  AssetGenImage get avatar3 => const AssetGenImage('assets/avatar/avatar3.png');

  /// File path: assets/avatar/avatar4.png
  AssetGenImage get avatar4 => const AssetGenImage('assets/avatar/avatar4.png');

  /// File path: assets/avatar/avatar5.png
  AssetGenImage get avatar5 => const AssetGenImage('assets/avatar/avatar5.png');

  /// List of all assets
  List<AssetGenImage> get values =>
      [avatar1, avatar2, avatar3, avatar4, avatar5];
}

class $AssetsBottomGen {
  const $AssetsBottomGen();

  /// File path: assets/bottom/calendar.svg
  String get calendar => 'assets/bottom/calendar.svg';

  /// File path: assets/bottom/contact.svg
  String get contact => 'assets/bottom/contact.svg';

  /// File path: assets/bottom/home.svg
  String get home => 'assets/bottom/home.svg';

  /// File path: assets/bottom/menu.svg
  String get menu => 'assets/bottom/menu.svg';

  /// File path: assets/bottom/videos.svg
  String get videos => 'assets/bottom/videos.svg';

  /// List of all assets
  List<String> get values => [calendar, contact, home, menu, videos];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/card_home.png
  AssetGenImage get cardHome =>
      const AssetGenImage('assets/images/card_home.png');

  /// File path: assets/images/language_selection.png
  AssetGenImage get languageSelection =>
      const AssetGenImage('assets/images/language_selection.png');

  /// File path: assets/images/loading.gif
  AssetGenImage get loading => const AssetGenImage('assets/images/loading.gif');

  /// File path: assets/images/on_boarding_1.png
  AssetGenImage get onBoarding1 =>
      const AssetGenImage('assets/images/on_boarding_1.png');

  /// File path: assets/images/on_boarding_2.png
  AssetGenImage get onBoarding2 =>
      const AssetGenImage('assets/images/on_boarding_2.png');

  /// File path: assets/images/on_boarding_3.png
  AssetGenImage get onBoarding3 =>
      const AssetGenImage('assets/images/on_boarding_3.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        cardHome,
        languageSelection,
        loading,
        onBoarding1,
        onBoarding2,
        onBoarding3
      ];
}

class $AssetsLogoGen {
  const $AssetsLogoGen();

  /// File path: assets/logo/404_error.svg
  String get a404Error => 'assets/logo/404_error.svg';

  /// File path: assets/logo/apple.svg
  String get apple => 'assets/logo/apple.svg';

  /// File path: assets/logo/arrow_right.svg
  String get arrowRight => 'assets/logo/arrow_right.svg';

  /// File path: assets/logo/bangla.svg
  String get bangla => 'assets/logo/bangla.svg';

  /// File path: assets/logo/bangladesh.svg
  String get bangladesh => 'assets/logo/bangladesh.svg';

  /// File path: assets/logo/calendar.svg
  String get calendar => 'assets/logo/calendar.svg';

  /// File path: assets/logo/edit.svg
  String get edit => 'assets/logo/edit.svg';

  /// File path: assets/logo/empty_data.svg
  String get emptyData => 'assets/logo/empty_data.svg';

  /// File path: assets/logo/en.svg
  String get en => 'assets/logo/en.svg';

  /// File path: assets/logo/eye-close.svg
  String get eyeClose => 'assets/logo/eye-close.svg';

  /// File path: assets/logo/eye-open.svg
  String get eyeOpen => 'assets/logo/eye-open.svg';

  /// File path: assets/logo/facebook.svg
  String get facebook => 'assets/logo/facebook.svg';

  /// File path: assets/logo/google.svg
  String get google => 'assets/logo/google.svg';

  /// File path: assets/logo/lock.svg
  String get lock => 'assets/logo/lock.svg';

  /// File path: assets/logo/logout.svg
  String get logout => 'assets/logo/logout.svg';

  /// File path: assets/logo/menu.svg
  String get menu => 'assets/logo/menu.svg';

  /// File path: assets/logo/message.svg
  String get message => 'assets/logo/message.svg';

  /// File path: assets/logo/notification.svg
  String get notification => 'assets/logo/notification.svg';

  /// File path: assets/logo/splash.svg
  String get splash => 'assets/logo/splash.svg';

  /// File path: assets/logo/user_profile.svg
  String get userProfile => 'assets/logo/user_profile.svg';

  /// List of all assets
  List<String> get values => [
        a404Error,
        apple,
        arrowRight,
        bangla,
        bangladesh,
        calendar,
        edit,
        emptyData,
        en,
        eyeClose,
        eyeOpen,
        facebook,
        google,
        lock,
        logout,
        menu,
        message,
        notification,
        splash,
        userProfile
      ];
}

class Assets {
  Assets._();

  static const $AssetsAvatarGen avatar = $AssetsAvatarGen();
  static const $AssetsBottomGen bottom = $AssetsBottomGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsLogoGen logo = $AssetsLogoGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
