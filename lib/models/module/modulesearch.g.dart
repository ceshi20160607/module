// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'modulesearch.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Modulesearch _$ModulesearchFromJson(Map<String, dynamic> json) => Modulesearch()
  ..rootId = json['rootId'] as String?
  ..typeFlag = json['typeFlag'] as num?
  ..pageNumber = json['pageNumber'] as num
  ..pageSize = json['pageSize'] as num
  ..pageType = json['pageType'] as num?
  ..keyword = json['keyword'] as String;

Map<String, dynamic> _$ModulesearchToJson(Modulesearch instance) =>
    <String, dynamic>{
      'rootId': instance.rootId,
      'typeFlag': instance.typeFlag,
      'pageNumber': instance.pageNumber,
      'pageSize': instance.pageSize,
      'pageType': instance.pageType,
      'keyword': instance.keyword,
    };
