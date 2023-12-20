// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VideoListModel _$VideoListModelFromJson(Map<String, dynamic> json) =>
    VideoListModel(
      kind: json['kind'] as String?,
      etag: json['etag'] as String?,
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => Item.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextPageToken: json['nextPageToken'] as String?,
      pageInfo: json['pageInfo'] == null
          ? null
          : PageInfo.fromJson(json['pageInfo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$VideoListModelToJson(VideoListModel instance) =>
    <String, dynamic>{
      'kind': instance.kind,
      'etag': instance.etag,
      'items': instance.items,
      'nextPageToken': instance.nextPageToken,
      'pageInfo': instance.pageInfo,
    };
