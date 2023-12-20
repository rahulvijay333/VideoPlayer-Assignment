import 'package:json_annotation/json_annotation.dart';

part 'medium.g.dart';

@JsonSerializable()
class Medium {
  String? url;
  int? width;
  int? height;

  Medium({this.url, this.width, this.height});

  factory Medium.fromJson(Map<String, dynamic> json) {
    return _$MediumFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MediumToJson(this);
}
