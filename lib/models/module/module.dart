import 'package:json_annotation/json_annotation.dart';

part 'module.g.dart';

@JsonSerializable()
class Module {
  Module();

  late String createUserId;
  late String createTime;
  late String companyId;
  late num hiddenFlag;
  String? updateTime;
  String? updateUserId;
  late String parentId;
  late num sortNum;
  late String name;
  late String depthDepth;
  late String rootId;
  String? id;
  late num typeFlag;
  late List<Module> children;
  
  factory Module.fromJson(Map<String,dynamic> json) => _$ModuleFromJson(json);
  Map<String, dynamic> toJson() => _$ModuleToJson(this);
}
