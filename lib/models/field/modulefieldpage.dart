import 'package:json_annotation/json_annotation.dart';
import "modulefield.dart";
part 'modulefieldpage.g.dart';

@JsonSerializable()
class Modulefieldpage {
  Modulefieldpage();

  late List<Modulefield> list;
  late num totalRow;
  late num pageSize;
  late num pageNumber;
  late String current;
  late num totalPage;
  late String pages;
  
  factory Modulefieldpage.fromJson(Map<String,dynamic> json) => _$ModulefieldpageFromJson(json);
  Map<String, dynamic> toJson() => _$ModulefieldpageToJson(this);
}
