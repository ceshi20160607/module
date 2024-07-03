import 'package:json_annotation/json_annotation.dart';
part 'modulerecordpage.g.dart';

@JsonSerializable()
class Modulerecordpage {
  Modulerecordpage();

  late List<Map<String,dynamic>> list;
  late num totalRow;
  late num pageSize;
  late num pageNumber;
  late String current;
  late num totalPage;
  late String pages;
  
  factory Modulerecordpage.fromJson(Map<String,dynamic> json) => _$ModulerecordpageFromJson(json);
  Map<String, dynamic> toJson() => _$ModulerecordpageToJson(this);
}
