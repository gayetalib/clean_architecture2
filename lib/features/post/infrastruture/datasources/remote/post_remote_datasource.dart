import 'package:chopper/chopper.dart';

part 'post_remote_datasource.chopper.dart';

@ChopperApi()
abstract class PostRemoteDataSource extends ChopperService {
  // static PostRemoteDataSource create(ChopperClient client) =>
  //     _$PostRemoteDataSource(client);
  static PostRemoteDataSource create() {
    final client = ChopperClient(
      baseUrl: Uri.parse('https://jsonplaceholder.typicode.com/posts'),
      services: [
        _$PostRemoteDataSource(), // Generated service
      ],
      converter: JsonConverter(), // Or your converter of choice
    );
    return _$PostRemoteDataSource(client);
  }

  @Get()
  Future<Response<List<dynamic>>> getPosts();

  @Get(path: '/{id}')
  Future<Response<dynamic>> getPost(@Path('id') int id);
}
