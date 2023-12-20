import 'package:json_annotation/json_annotation.dart';

import 'snippet.dart';

part 'item.g.dart';

@JsonSerializable()
class Item {
  String? kind;
  String? etag;
  String? id;
  Snippet? snippet;

  Item({this.kind, this.etag, this.id, this.snippet});

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);

  Map<String, dynamic> toJson() => _$ItemToJson(this);
}
