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
  Future<Result<Modulefieldpage>> queryPageListExamine(
    @Query('moduleId') int moduleId,
    @Query('pageNumber') int pageNumber,
    @Query('pageSize') int pageSize,
    @Query('pageType') int pageType,
    @Query('keyword') String keyword,
  );
  // ///------------------------------module------------------------
  @POST("module/queryPageList")
  Future<Result<Modulepage>> getModuleList(
    @Query('rootId') int? rootId,
    @Query('typeFlag') int? typeFlag,
    @Query('pageNumber') int pageNumber,
    @Query('pageSize') int pageSize,
    @Query('pageType') int pageType,
    @Query('keyword') String keyword,
  );

  // ///------------------------------module-field------------------------
  @POST("moduleField/queryFieldAdd")
  Future<Result<List<Modulefield>>> getModuleFieldAdd(
    @Query('type') int type,
    @Query('moduleId') int moduleId
  );
  // ///------------------------------module-record------------------------
  @POST("moduleRecord/add")
  Future<Result<String>> saveModuleRecord(
    @Query('moduleId') int moduleId,
    @Query('entity') Map<String,dynamic> entity,
  );
  @POST("moduleRecord/update")
  Future<Result<String>> updateModuleRecord(
    @Query('moduleId') int moduleId,
    @Query('entity') Map<String,dynamic> entity,
  );
  @POST("moduleRecord/queryById")
  Future<Result<Map<String,dynamic>>> queryById(
    @Query('id') int id
  );
  @POST("moduleRecord/information")
  Future<Result<List<Modulefield>>> information(
    @Query('id') int id
  );
  @POST("moduleRecord/queryPageList")
  Future<Result<List<Map<String,dynamic>>>> queryModuleRecordPageList(
    @Query('moduleId') int moduleId,
    @Query('pageNumber') int pageNumber,
    @Query('pageSize') int pageSize,
    @Query('pageType') int pageType,
    @Query('keyword') String keyword,
  );
  //
  // ///------------------------------car------------------------
  // /// 列表接口
  // @POST("noteCar/queryList")
  // Future<Result<Carpage>> getInfoListData(
  //   @Query('moduleType') int moduleType,
  //   @Query('pageNumber') int pageNumber,
  //   @Query('pageSize') int pageSize,
  //   @Query('pageType') int pageType,
  //   @Query('keyword') String keyword,
  // );
  //
  // /// 详情接口
  // @GET("noteCar/queryById")
  // Future<Result<Car>> queryCarById(
  //   @Query('id') String id,
  // );
  //
  // /// 详情接口
  // @POST("noteCar/queryInformation")
  // Future<Result<List<Fieldvo>>> queryInformation(
  //   @Query('id') String id,
  // );
  //
  // /// 点赞接口
  // @POST("thumbsUpOrDown")
  // Future<Result<InfoWorkModel>> likeThumbsUpOrDown(
  //     @Body() Map<String, dynamic> param);
}
