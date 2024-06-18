import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../../../models/index.dart';
import '../../net/result.dart';

part 'rest_client.g.dart';

@RestApi()
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  ///-----------------------------user-------------------------
  /// 列表接口
  @POST("user/doLogin")
  Future<Result<User>> doLogin(@Body() Map<String, dynamic> param);

  // ///------------------------------examine------------------------
  @POST("examine/queryPageList")
  Future<Result<Modulefieldpage>> queryPageListExamine(@Body() Map<String, dynamic> param);
  // ///------------------------------module------------------------
  @POST("module/queryPageList")
  Future<Result<Modulepage>> getModuleList(@Body() Map<String, dynamic> param);

  // ///------------------------------module-field------------------------
  @POST("moduleField/queryFieldAdd")
  Future<Result<List<Modulefield>>> getModuleFieldAdd(@Query('type') int type,@Query('moduleId') int moduleId);
  // ///------------------------------module-record------------------------
  @POST("moduleRecord/add")
  Future<Result<String>> saveModuleRecord(@Body() Map<String, dynamic> param);
  @POST("moduleRecord/update")
  Future<Result<String>> updateModuleRecord(@Body() Map<String, dynamic> param);
  @POST("moduleRecord/queryById")
  Future<Result<Map<String,dynamic>>> queryById( @Query('id') int id);
  @POST("moduleRecord/information")
  Future<Result<List<Modulefield>>> information(@Query('id') int id);
  @POST("moduleRecord/queryPageList")
  Future<Result<List<Map<String,dynamic>>>> queryModuleRecordPageList(@Body() Map<String, dynamic> param);
  //
  // ///------------------------------car------------------------

}
