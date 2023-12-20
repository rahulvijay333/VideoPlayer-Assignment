import 'package:json_annotation/json_annotation.dart';

import 'localized.dart';
import 'thumbnails.dart';

part 'snippet.g.dart';

@JsonSerializable()
class Snippet {
  String? publishedAt;
  String? channelId;
  String? title;
  String? description;
  Thumbnails? thumbnails;
  String? channelTitle;
  List<String>? tags;
  String? categoryId;
  String? liveBroadcastContent;
  Localized? localized;
  String? defaultAudioLanguage;

  Snippet({
    this.publishedAt,
    this.channelId,
    this.title,
    this.description,
    this.thumbnails,
    this.channelTitle,
    this.tags,
    this.categoryId,
    this.liveBroadcastContent,
    this.localized,
    this.defaultAudioLanguage,
  });

  factory Snippet.fromJson(Map<String, dynamic> json) {
    return _$SnippetFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SnippetToJson(this);
}
