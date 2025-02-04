/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/language_selection.png
  AssetGenImage get languageSelection =>
      const AssetGenImage('assets/images/language_selection.png');

  /// List of all assets
  List<AssetGenImage> get values => [languageSelection];
}

class $AssetsLogoGen {
  const $AssetsLogoGen();

  /// File path: assets/logo/404_error.svg
  String get a404Error => 'assets/logo/404_error.svg';

  /// File path: assets/logo/arrow_right.svg
  String get arrowRight => 'assets/logo/arrow_right.svg';

  /// File path: assets/logo/bangla.svg
  String get bangla => 'assets/logo/bangla.svg';

  /// File path: assets/logo/empty_data.svg
  String get emptyData => 'assets/logo/empty_data.svg';

  /// File path: assets/logo/en.svg
  String get en => 'assets/logo/en.svg';

  /// File path: assets/logo/eye-close.svg
  String get eyeClose => 'assets/logo/eye-close.svg';

  /// File path: assets/logo/eye-open.svg
  String get eyeOpen => 'assets/logo/eye-open.svg';

  /// File path: assets/logo/lock.svg
  String get lock => 'assets/logo/lock.svg';

  /// File path: assets/logo/logout.svg
  String get logout => 'assets/logo/logout.svg';

  /// File path: assets/logo/message.svg
  String get message => 'assets/logo/message.svg';

  /// File path: assets/logo/splash.svg
  String get splash => 'assets/logo/splash.svg';

  /// File path: assets/logo/user_profile.svg
  String get userProfile => 'assets/logo/user_profile.svg';

  /// List of all assets
  List<String> get values => [
        a404Error,
        arrowRight,
        bangla,
        emptyData,
        en,
        eyeClose,
        eyeOpen,
        lock,
        logout,
        message,
        splash,
        userProfile
      ];
}

class Assets {
  Assets._();

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
