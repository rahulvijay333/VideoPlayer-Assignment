import 'package:json_annotation/json_annotation.dart';

part 'maxres.g.dart';

@JsonSerializable()
class Maxres {
  String? url;
  int? width;
  int? height;

  Maxres({this.url, this.width, this.height});

  factory Maxres.fromJson(Map<String, dynamic> json) {
    return _$MaxresFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MaxresToJson(this);
}
