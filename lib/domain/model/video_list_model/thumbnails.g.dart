// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'thumbnails.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Thumbnails _$ThumbnailsFromJson(Map<String, dynamic> json) => Thumbnails(
      thumbnailsDefault: json['default'] == null
          ? null
          : Default.fromJson(json['default'] as Map<String, dynamic>),
      medium: json['medium'] == null
          ? null
          : Medium.fromJson(json['medium'] as Map<String, dynamic>),
      high: json['high'] == null
          ? null
          : High.fromJson(json['high'] as Map<String, dynamic>),
      standard: json['standard'] == null
          ? null
          : Standard.fromJson(json['standard'] as Map<String, dynamic>),
      maxres: json['maxres'] == null
          ? null
          : Maxres.fromJson(json['maxres'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ThumbnailsToJson(Thumbnails instance) =>
    <String, dynamic>{
      'default': instance.thumbnailsDefault,
      'medium': instance.medium,
      'high': instance.high,
      'standard': instance.standard,
      'maxres': instance.maxres,
    };
