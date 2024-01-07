import 'package:chopper/chopper.dart';

part 'post_remote_datasource.chopper.dart';

@ChopperApi(baseUrl: 'https://jsonplaceholder.typicode.com/posts')
abstract class PostRemoteDataSource extends ChopperService {
  @Get()
  Future<Response<List<dynamic>>> getPosts();

  @Get(path: '/{id}')
  Future<Response<dynamic>> getPost(@Path('id') int id);

  static PostRemoteDataSource create() {
    final client = ChopperClient(
      services: [
        _$PostRemoteDataSource(), // Generated service
      ],
      converter: JsonConverter(), // Or your converter of choice
    );
    return _$PostRemoteDataSource(client);
  }
}
