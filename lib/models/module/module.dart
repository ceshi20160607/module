import 'package:json_annotation/json_annotation.dart';

part 'module.g.dart';

@JsonSerializable()
class Module {
  Module();

  late String create_user_id;
  late String create_time;
  late String company_id;
  late num hidden_flag;
  String? update_time;
  String? update_user_id;
  late String parent_id;
  late num sort_num;
  late String name;
  late String depth_depth;
  late String root_id;
  String? id;
  late num type_flag;
  
  factory Module.fromJson(Map<String,dynamic> json) => _$ModuleFromJson(json);
  Map<String, dynamic> toJson() => _$ModuleToJson(this);
}
