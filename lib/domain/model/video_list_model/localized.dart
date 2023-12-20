import 'package:json_annotation/json_annotation.dart';

part 'localized.g.dart';

@JsonSerializable()
class Localized {
  String? title;
  String? description;

  Localized({this.title, this.description});

  factory Localized.fromJson(Map<String, dynamic> json) {
    return _$LocalizedFromJson(json);
  }

  Map<String, dynamic> toJson() => _$LocalizedToJson(this);
}
