/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsAudioGen {
  const $AssetsAudioGen();

  /// File path: assets/audio/background.mp3
  String get background => 'assets/audio/background.mp3';

  /// List of all assets
  List<String> get values => [background];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/bg.png
  AssetGenImage get bg => const AssetGenImage('assets/images/bg.png');

  $AssetsImagesCollectionGen get collection =>
      const $AssetsImagesCollectionGen();
  $AssetsImagesGameGen get game => const $AssetsImagesGameGen();
  $AssetsImagesGameOverGen get gameOver => const $AssetsImagesGameOverGen();
  $AssetsImagesIntroGen get intro => const $AssetsImagesIntroGen();

  /// List of all assets
  List<AssetGenImage> get values => [bg];
}

class $AssetsJsonGen {
  const $AssetsJsonGen();

  /// File path: assets/json/country.json
  String get country => 'assets/json/country.json';

  /// List of all assets
  List<String> get values => [country];
}

class $AssetsImagesCollectionGen {
  const $AssetsImagesCollectionGen();

  /// File path: assets/images/collection/vietnam.png
  AssetGenImage get vietnam =>
      const AssetGenImage('assets/images/collection/vietnam.png');

  /// List of all assets
  List<AssetGenImage> get values => [vietnam];
}

class $AssetsImagesGameGen {
  const $AssetsImagesGameGen();

  /// File path: assets/images/game/left.png
  AssetGenImage get left => const AssetGenImage('assets/images/game/left.png');

  /// File path: assets/images/game/right.png
  AssetGenImage get right =>
      const AssetGenImage('assets/images/game/right.png');

  /// List of all assets
  List<AssetGenImage> get values => [left, right];
}

class $AssetsImagesGameOverGen {
  const $AssetsImagesGameOverGen();

  /// File path: assets/images/game_over/home.png
  AssetGenImage get home =>
      const AssetGenImage('assets/images/game_over/home.png');

  /// File path: assets/images/game_over/update.png
  AssetGenImage get update =>
      const AssetGenImage('assets/images/game_over/update.png');

  /// List of all assets
  List<AssetGenImage> get values => [home, update];
}

class $AssetsImagesIntroGen {
  const $AssetsImagesIntroGen();

  /// File path: assets/images/intro/chat.png
  AssetGenImage get chat => const AssetGenImage('assets/images/intro/chat.png');

  /// File path: assets/images/intro/collection.png
  AssetGenImage get collection =>
      const AssetGenImage('assets/images/intro/collection.png');

  /// File path: assets/images/intro/mute.png
  AssetGenImage get mute => const AssetGenImage('assets/images/intro/mute.png');

  /// File path: assets/images/intro/overlay.png
  AssetGenImage get overlay =>
      const AssetGenImage('assets/images/intro/overlay.png');

  /// File path: assets/images/intro/play-button.png
  AssetGenImage get playButton =>
      const AssetGenImage('assets/images/intro/play-button.png');

  /// File path: assets/images/intro/volume.png
  AssetGenImage get volume =>
      const AssetGenImage('assets/images/intro/volume.png');

  /// List of all assets
  List<AssetGenImage> get values =>
      [chat, collection, mute, overlay, playButton, volume];
}

class Assets {
  Assets._();

  static const $AssetsAudioGen audio = $AssetsAudioGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsJsonGen json = $AssetsJsonGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

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
    bool gaplessPlayback = false,
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

  ImageProvider provider() => AssetImage(_assetName);

  String get path => _assetName;

  String get keyName => _assetName;
}
