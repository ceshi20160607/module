import 'package:json_annotation/json_annotation.dart';
import "module.dart";
part 'modulepage.g.dart';

@JsonSerializable()
class Modulepage {
  Modulepage();

  late List<Module> list;
  late num totalRow;
  late num pageSize;
  late num pageNumber;
  late String current;
  late num totalPage;
  late String pages;
  
  factory Modulepage.fromJson(Map<String,dynamic> json) => _$ModulepageFromJson(json);
  Map<String, dynamic> toJson() => _$ModulepageToJson(this);
}
