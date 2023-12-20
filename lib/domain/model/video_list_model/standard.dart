import 'package:json_annotation/json_annotation.dart';

part 'standard.g.dart';

@JsonSerializable()
class Standard {
  String? url;
  int? width;
  int? height;

  Standard({this.url, this.width, this.height});

  factory Standard.fromJson(Map<String, dynamic> json) {
    return _$StandardFromJson(json);
  }

  Map<String, dynamic> toJson() => _$StandardToJson(this);
}
