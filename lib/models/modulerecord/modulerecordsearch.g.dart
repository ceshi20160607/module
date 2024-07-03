// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'modulerecordsearch.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Modulerecordsearch _$ModulerecordsearchFromJson(Map<String, dynamic> json) =>
    Modulerecordsearch()
      ..moduleId = json['moduleId'] as String?
      ..typeFlag = json['typeFlag'] as num?
      ..pageNumber = json['pageNumber'] as num
      ..pageSize = json['pageSize'] as num
      ..pageType = json['pageType'] as num?
      ..keyword = json['keyword'] as String;

Map<String, dynamic> _$ModulerecordsearchToJson(Modulerecordsearch instance) =>
    <String, dynamic>{
      'moduleId': instance.moduleId,
      'typeFlag': instance.typeFlag,
      'pageNumber': instance.pageNumber,
      'pageSize': instance.pageSize,
      'pageType': instance.pageType,
      'keyword': instance.keyword,
    };
