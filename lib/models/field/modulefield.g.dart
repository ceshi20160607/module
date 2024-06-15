// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'modulefield.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Modulefield _$ModulefieldFromJson(Map<String, dynamic> json) => Modulefield()
  ..id = json['id'] as String?
  ..moduleId = json['moduleId'] as String
  ..fieldName = json['fieldName'] as String
  ..name = json['name'] as String
  ..type = json['type'] as num
  ..remark = json['remark'] as String?
  ..inputTips = json['inputTips'] as String?
  ..maxLength = json['maxLength'] as String?
  ..defaultValue = json['defaultValue'] as String?
  ..value = json['value'] as String?
  ..unionFlag = json['unionFlag'] as num
  ..mustFlag = json['mustFlag'] as num
  ..hiddenFlag = json['hiddenFlag'] as num
  ..deleteFlag = json['deleteFlag'] as num
  ..addFlag = json['addFlag'] as num
  ..indexFlag = json['indexFlag'] as num
  ..detailFlag = json['detailFlag'] as num
  ..sorting = json['sorting'] as num
  ..fieldType = json['fieldType'] as num
  ..dictId = json['dictId'] as String?
  ..optionData = json['optionData'] as String?
  ..parentId = json['parentId'] as String?
  ..depthDepth = json['depthDepth'] as String?
  ..transferModelId = json['transferModelId'] as String?
  ..transferFieldName = json['transferFieldName'] as String?
  ..stylePercent = json['stylePercent'] as num
  ..precisions = json['precisions'] as num?
  ..maxNumRestrict = json['maxNumRestrict'] as num?
  ..minNumRestrict = json['minNumRestrict'] as num?
  ..axisx = json['axisx'] as num
  ..axisy = json['axisy'] as num
  ..createTime = json['createTime'] as String?
  ..createUserId = json['createUserId'] as String?
  ..updateTime = json['updateTime'] as String?
  ..updateUserId = json['updateUserId'] as String?;

Map<String, dynamic> _$ModulefieldToJson(Modulefield instance) =>
    <String, dynamic>{
      'id': instance.id,
      'moduleId': instance.moduleId,
      'fieldName': instance.fieldName,
      'name': instance.name,
      'type': instance.type,
      'remark': instance.remark,
      'inputTips': instance.inputTips,
      'maxLength': instance.maxLength,
      'defaultValue': instance.defaultValue,
      'value': instance.value,
      'unionFlag': instance.unionFlag,
      'mustFlag': instance.mustFlag,
      'hiddenFlag': instance.hiddenFlag,
      'deleteFlag': instance.deleteFlag,
      'addFlag': instance.addFlag,
      'indexFlag': instance.indexFlag,
      'detailFlag': instance.detailFlag,
      'sorting': instance.sorting,
      'fieldType': instance.fieldType,
      'dictId': instance.dictId,
      'optionData': instance.optionData,
      'parentId': instance.parentId,
      'depthDepth': instance.depthDepth,
      'transferModelId': instance.transferModelId,
      'transferFieldName': instance.transferFieldName,
      'stylePercent': instance.stylePercent,
      'precisions': instance.precisions,
      'maxNumRestrict': instance.maxNumRestrict,
      'minNumRestrict': instance.minNumRestrict,
      'axisx': instance.axisx,
      'axisy': instance.axisy,
      'createTime': instance.createTime,
      'createUserId': instance.createUserId,
      'updateTime': instance.updateTime,
      'updateUserId': instance.updateUserId,
    };
