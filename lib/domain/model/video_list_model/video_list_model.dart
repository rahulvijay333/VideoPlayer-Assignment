import 'package:json_annotation/json_annotation.dart';

import 'item.dart';
import 'page_info.dart';

part 'video_list_model.g.dart';

@JsonSerializable()
class VideoListModel {
  String? kind;
  String? etag;
  List<Item>? items;
  String? nextPageToken;
  PageInfo? pageInfo;

  VideoListModel({
    this.kind,
    this.etag,
    this.items,
    this.nextPageToken,
    this.pageInfo,
  });

  factory VideoListModel.fromJson(Map<String, dynamic> json) {
    return _$VideoListModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$VideoListModelToJson(this);
}
