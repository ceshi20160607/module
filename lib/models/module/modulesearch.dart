import 'package:json_annotation/json_annotation.dart';

part 'modulesearch.g.dart';

@JsonSerializable()
class Modulesearch {
  Modulesearch();

  String? rootId;
  num? typeFlag;
  late num pageNumber;
  late num pageSize;
  num? pageType;
  late String keyword;
  
  factory Modulesearch.fromJson(Map<String,dynamic> json) => _$ModulesearchFromJson(json);
  Map<String, dynamic> toJson() => _$ModulesearchToJson(this);
}
