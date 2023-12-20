import 'package:json_annotation/json_annotation.dart';

import 'default.dart';
import 'high.dart';
import 'maxres.dart';
import 'medium.dart';
import 'standard.dart';

part 'thumbnails.g.dart';

@JsonSerializable()
class Thumbnails {
  @JsonKey(name: 'default')
  Default? thumbnailsDefault;
  Medium? medium;
  High? high;
  Standard? standard;
  Maxres? maxres;

  Thumbnails({
    this.thumbnailsDefault,
    this.medium,
    this.high,
    this.standard,
    this.maxres,
  });

  factory Thumbnails.fromJson(Map<String, dynamic> json) {
    return _$ThumbnailsFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ThumbnailsToJson(this);
}
