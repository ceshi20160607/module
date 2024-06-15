import 'package:json_annotation/json_annotation.dart';

part 'modulefield.g.dart';

@JsonSerializable()
class Modulefield {
  Modulefield();

  String? id;
  late String moduleId;
  late String fieldName;
  late String name;
  late num type;
  String? remark;
  String? inputTips;
  String? maxLength;
  String? defaultValue;
  String? value;
  late num unionFlag;
  late num mustFlag;
  late num hiddenFlag;
  late num deleteFlag;
  late num addFlag;
  late num indexFlag;
  late num detailFlag;
  late num sorting;
  late num fieldType;
  String? dictId;
  String? optionData;
  String? parentId;
  String? depthDepth;
  String? transferModelId;
  String? transferFieldName;
  late num stylePercent;
  num? precisions;
  num? maxNumRestrict;
  num? minNumRestrict;
  late num axisx;
  late num axisy;
  String? createTime;
  String? createUserId;
  String? updateTime;
  String? updateUserId;
  
  factory Modulefield.fromJson(Map<String,dynamic> json) => _$ModulefieldFromJson(json);
  Map<String, dynamic> toJson() => _$ModulefieldToJson(this);
}
