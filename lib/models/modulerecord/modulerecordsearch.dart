import 'package:json_annotation/json_annotation.dart';

part 'modulerecordsearch.g.dart';

@JsonSerializable()
class Modulerecordsearch {
  Modulerecordsearch();

  String? moduleId;
  num? typeFlag;
  late num pageNumber;
  late num pageSize;
  num? pageType;
  late String keyword;
  
  factory Modulerecordsearch.fromJson(Map<String,dynamic> json) => _$ModulerecordsearchFromJson(json);
  Map<String, dynamic> toJson() => _$ModulerecordsearchToJson(this);
}
