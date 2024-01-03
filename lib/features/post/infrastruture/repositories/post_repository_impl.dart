import 'package:chopper/src/response.dart';
import 'package:dartz/dartz.dart';
import 'package:test_based_on_pubc_mobile_logic/features/post/domain/entities/post_entity.dart';
import 'package:test_based_on_pubc_mobile_logic/features/post/domain/repositories/post_repository_interface.dart';
import 'package:test_based_on_pubc_mobile_logic/features/post/infrastruture/datasources/remote/post_remote_datasource.dart';
import 'package:dio/dio.dart';

class PostRepositoryImpl implements PostRepositoryInterface {
  // final PostRemoteDataSource _remoteSource;

  // PostRepositoryImpl(this._remoteSource);

  // @override
  // Future<Response> getPost(int id) async {
  //   return await _remoteSource.getPost(id);
  // }

  @override
  Future<List<PostEntity>> getPosts() async {
    //final response = await _remoteSource.getPosts();
    final response =
        await Dio().get('https://jsonplaceholder.typicode.com/posts');

    if (response.statusCode == 200) {
      final List<dynamic> jsonList = response.data;

      // Mapping the data to PostEntity
      final List<PostEntity> posts = jsonList
          .map((json) => PostEntity.fromJson(json as Map<String, dynamic>))
          .toList();

      return posts; // Assuming the response is a list of posts
    } else {
      throw Exception('Failed to load posts');
    }
  }
}
