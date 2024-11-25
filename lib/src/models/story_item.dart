import 'package:flutter/material.dart';
import 'package:flutter_story_presenter/flutter_story_presenter.dart';
import 'package:just_audio/just_audio.dart';

class StoryItem {
  const StoryItem({
    this.url,
    required this.storyItemType,
    this.thumbnail,
    this.isMuteByDefault = false,
    this.duration = const Duration(seconds: 3),
    this.storyItemSource = StoryItemSource.network,
    this.videoConfig,
    this.errorWidget,
    this.imageConfig,
    this.textConfig,
    this.webConfig,
    this.customWidget,
    this.audioConfig,
  })  : assert(
  storyItemType == StoryItemType.custom || url != null,
  'URL is required when storyItemType is not custom',
  ),
        assert(
        storyItemType != StoryItemType.custom || customWidget != null,
        'CustomWidget is required when storyItemType is custom',
        );

  /// Duration of displaying the widget
  final Duration duration;

  /// Widget to display beneath main view as thumbnail
  final Widget? thumbnail;

  /// Widget to display when error occurs loading View
  final Widget? errorWidget;

  /// Custom Widget to display fully instead of any other view
  final Widget? Function(FlutterStoryController?, AudioPlayer? audioPlayer)?
  customWidget;

  final StoryItemType storyItemType;

  /// Asset URL, File Path or Web URL
  final String? url;

  /// Applicable when [storyItemType] is [StoryItemType.video]
  final bool isMuteByDefault;

  /// Defaults to [StoryItemSource.network]
  final StoryItemSource storyItemSource;

  /// Applicable when [storyItemType] is [StoryItemType.image]
  final StoryViewImageConfig? imageConfig;

  /// Applicable when [storyItemType] is [StoryItemType.video]
  final StoryViewVideoConfig? videoConfig;

  /// Applicable when you want to add audio in [StoryItemType.image],[StoryItemType.text],[StoryItemType.custom]
  final StoryViewAudioConfig? audioConfig;

  /// Applicable when [storyItemType] is [StoryItemType.text]
  final StoryViewTextConfig? textConfig;

  /// Applicable when [storyItemType] is [StoryItemType.web]
  final StoryViewWebConfig? webConfig;

  /// ایجاد نسخه جدید از StoryItem با تغییر مقادیر مورد نظر
  StoryItem copyWith({
    Duration? duration,
    Widget? thumbnail,
    Widget? errorWidget,
    Widget? Function(FlutterStoryController?, AudioPlayer? audioPlayer)?
    customWidget,
    StoryItemType? storyItemType,
    String? url,
    bool? isMuteByDefault,
    StoryItemSource? storyItemSource,
    StoryViewImageConfig? imageConfig,
    StoryViewVideoConfig? videoConfig,
    StoryViewAudioConfig? audioConfig,
    StoryViewTextConfig? textConfig,
    StoryViewWebConfig? webConfig,
  }) {
    return StoryItem(
      duration: duration ?? this.duration,
      thumbnail: thumbnail ?? this.thumbnail,
      errorWidget: errorWidget ?? this.errorWidget,
      customWidget: customWidget ?? this.customWidget,
      storyItemType: storyItemType ?? this.storyItemType,
      url: url ?? this.url,
      isMuteByDefault: isMuteByDefault ?? this.isMuteByDefault,
      storyItemSource: storyItemSource ?? this.storyItemSource,
      imageConfig: imageConfig ?? this.imageConfig,
      videoConfig: videoConfig ?? this.videoConfig,
      audioConfig: audioConfig ?? this.audioConfig,
      textConfig: textConfig ?? this.textConfig,
      webConfig: webConfig ?? this.webConfig,
    );
  }
}
