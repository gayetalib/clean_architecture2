import 'package:chopper/chopper.dart';
import 'package:dartz/dartz.dart';
import 'package:test_based_on_pubc_mobile_logic/features/post/domain/entities/post_entity.dart';

part 'post_remote_datasource.chopper.dart';

@ChopperApi(baseUrl: 'https://jsonplaceholder.typicode.com/posts')
abstract class PostRemoteDataSource extends ChopperService {
  static PostRemoteDataSource create(ChopperClient client) =>
      _$PostRemoteDataSource(client);

  @Get()
  Future<Response<Map<String, dynamic>>> getPosts();

  @Get(path: '/{id}')
  Future<Response> getPost(@Path('id') int id);
}
