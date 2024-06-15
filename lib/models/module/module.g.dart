// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'module.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Module _$ModuleFromJson(Map<String, dynamic> json) => Module()
  ..create_user_id = json['create_user_id'] as String
  ..create_time = json['create_time'] as String
  ..company_id = json['company_id'] as String
  ..hidden_flag = json['hidden_flag'] as num
  ..update_time = json['update_time'] as String?
  ..update_user_id = json['update_user_id'] as String?
  ..parent_id = json['parent_id'] as String
  ..sort_num = json['sort_num'] as num
  ..name = json['name'] as String
  ..depth_depth = json['depth_depth'] as String
  ..root_id = json['root_id'] as String
  ..id = json['id'] as String?
  ..type_flag = json['type_flag'] as num;

Map<String, dynamic> _$ModuleToJson(Module instance) => <String, dynamic>{
      'create_user_id': instance.create_user_id,
      'create_time': instance.create_time,
      'company_id': instance.company_id,
      'hidden_flag': instance.hidden_flag,
      'update_time': instance.update_time,
      'update_user_id': instance.update_user_id,
      'parent_id': instance.parent_id,
      'sort_num': instance.sort_num,
      'name': instance.name,
      'depth_depth': instance.depth_depth,
      'root_id': instance.root_id,
      'id': instance.id,
      'type_flag': instance.type_flag,
    };
