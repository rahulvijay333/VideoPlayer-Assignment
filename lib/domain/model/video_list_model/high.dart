import 'package:json_annotation/json_annotation.dart';

part 'high.g.dart';

@JsonSerializable()
class High {
  String? url;
  int? width;
  int? height;

  High({this.url, this.width, this.height});

  factory High.fromJson(Map<String, dynamic> json) => _$HighFromJson(json);

  Map<String, dynamic> toJson() => _$HighToJson(this);
}
