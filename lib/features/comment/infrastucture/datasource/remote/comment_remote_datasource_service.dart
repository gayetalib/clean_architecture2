import 'package:chopper/chopper.dart';
import 'package:test_based_on_pubc_mobile_logic/config/constants.dart';

part 'comment_remote_datasource_service.chopper.dart';

@ChopperApi(baseUrl: Constants.API_URL)
abstract class CommentRemoteDatasourceService extends ChopperService {
  @Get()
  Future<Response<List<dynamic>>> getComments();

  @Get(path: '{id}')
  Future<Response<dynamic>> getComment(@Path('id') int id);

  @Post()
  Future<Response> addComment(@Body() Map<String, dynamic> body);

  @Delete(path: '{id}')
  Future<Response<dynamic>> deleteComment(@Path('id') int id);

  @Put(path: '{id}')
  Future<Response<dynamic>> updateComment(
      @Path('id') int id, @Body() Map<String, dynamic> body);

  static CommentRemoteDatasourceService create() {
    final client = ChopperClient(
        services: [_$CommentRemoteDatasourceService()],
        converter: const JsonConverter());
    return _$CommentRemoteDatasourceService(client);
  }
}
