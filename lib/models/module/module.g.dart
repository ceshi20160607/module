// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'module.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Module _$ModuleFromJson(Map<String, dynamic> json) => Module()
  ..createUserId = json['createUserId'] as String
  ..createTime = json['createTime'] as String
  ..companyId = json['companyId'] as String
  ..hiddenFlag = json['hiddenFlag'] as num
  ..updateTime = json['updateTime'] as String?
  ..updateUserId = json['updateUserId'] as String?
  ..parentId = json['parentId'] as String
  ..sortNum = json['sortNum'] as num
  ..name = json['name'] as String
  ..depthDepth = json['depthDepth'] as String
  ..rootId = json['rootId'] as String
  ..id = json['id'] as String?
  ..typeFlag = json['typeFlag'] as num
  ..children = (json['children'] as List<dynamic>)
      .map((e) => Module.fromJson(e as Map<String, dynamic>))
      .toList();

Map<String, dynamic> _$ModuleToJson(Module instance) => <String, dynamic>{
      'createUserId': instance.createUserId,
      'createTime': instance.createTime,
      'companyId': instance.companyId,
      'hiddenFlag': instance.hiddenFlag,
      'updateTime': instance.updateTime,
      'updateUserId': instance.updateUserId,
      'parentId': instance.parentId,
      'sortNum': instance.sortNum,
      'name': instance.name,
      'depthDepth': instance.depthDepth,
      'rootId': instance.rootId,
      'id': instance.id,
      'typeFlag': instance.typeFlag,
      'children': instance.children,
    };
