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
  Future<Result<Modulefieldpage>> examineQueryPageList(@Body() Map<String, dynamic> param);
  // ///------------------------------module------------------------
  @POST("module/queryPageList")
  Future<Result<Modulepage>> moduleQueryPageLis(@Body() Map<String, dynamic> param);

  // ///------------------------------module-field------------------------
  @POST("moduleField/queryFieldAdd")
  Future<Result<List<Modulefield>>> moduleFieldQueryFieldAdd(@Query('type') int type,@Query('moduleId') int moduleId);
  // ///------------------------------module-field-user------------------------
  @POST("moduleFieldUser/queryFieldHead")
  Future<Result<List<Modulefield>>> moduleFieldUserQueryFieldHead(@Query('moduleId') int moduleId);
  @POST("moduleFieldUser/queryFieldSearch")
  Future<Result<List<Modulefield>>> moduleFieldUserQueryFieldSearch(@Query('moduleId') int moduleId);
  @POST("moduleFieldUser/changeFieldSort")
  Future<Result<List<Modulefield>>> moduleFieldUserChangeFieldSort(@Body() Map<String, dynamic> param);

  // ///------------------------------module-record------------------------
  @POST("moduleRecord/add")
  Future<Result<String>> moduleRecordAdd(@Body() Map<String, dynamic> param);
  @POST("moduleRecord/update")
  Future<Result<String>> moduleRecordUpdate(@Body() Map<String, dynamic> param);
  @POST("moduleRecord/queryById")
  Future<Result<Map<String,dynamic>>> moduleRecordQueryById( @Query('id') int id);
  @POST("moduleRecord/information")
  Future<Result<List<Modulefield>>> moduleRecordInformation(@Query('id') int id);
  @POST("moduleRecord/queryPageList")
  Future<Result<Modulerecordpage>> moduleRecordQueryPageList(@Body() Map<String, dynamic> param);
  //
  // ///------------------------------car------------------------

}
