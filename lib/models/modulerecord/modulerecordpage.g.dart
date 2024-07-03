// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'modulerecordpage.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Modulerecordpage _$ModulerecordpageFromJson(Map<String, dynamic> json) =>
    Modulerecordpage()
      ..list = (json['list'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList()
      ..totalRow = json['totalRow'] as num
      ..pageSize = json['pageSize'] as num
      ..pageNumber = json['pageNumber'] as num
      ..current = json['current'] as String
      ..totalPage = json['totalPage'] as num
      ..pages = json['pages'] as String;

Map<String, dynamic> _$ModulerecordpageToJson(Modulerecordpage instance) =>
    <String, dynamic>{
      'list': instance.list,
      'totalRow': instance.totalRow,
      'pageSize': instance.pageSize,
      'pageNumber': instance.pageNumber,
      'current': instance.current,
      'totalPage': instance.totalPage,
      'pages': instance.pages,
    };
