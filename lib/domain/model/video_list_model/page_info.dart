import 'package:json_annotation/json_annotation.dart';

part 'page_info.g.dart';

@JsonSerializable()
class PageInfo {
  int? totalResults;
  int? resultsPerPage;

  PageInfo({this.totalResults, this.resultsPerPage});

  factory PageInfo.fromJson(Map<String, dynamic> json) {
    return _$PageInfoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PageInfoToJson(this);
}
