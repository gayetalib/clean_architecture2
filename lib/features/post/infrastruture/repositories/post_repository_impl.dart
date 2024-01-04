import 'package:chopper/chopper.dart';
import 'package:test_based_on_pubc_mobile_logic/features/post/domain/entities/post_entity.dart';
import 'package:test_based_on_pubc_mobile_logic/features/post/domain/repositories/post_repository_interface.dart';
import 'package:test_based_on_pubc_mobile_logic/features/post/infrastruture/datasources/remote/post_remote_datasource.dart';

class PostRepositoryImpl implements PostRepositoryInterface {
  //final ChopperClient _chopperClient;
  final PostRemoteDataSource _remoteDataSource;

  PostRepositoryImpl(this._remoteDataSource);

  @override
  Future<List<PostEntity>> getPosts() async {
    final response = await _remoteDataSource.getPosts();

    if (response.statusCode == 200) {
      final List<dynamic> jsonList = response.body as List<dynamic>;

      return jsonList.map((json) => PostEntity.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load posts');
    }
  }

  @override
  Future<PostEntity> getPost(int id) async {
    final response = await _remoteDataSource.getPost(id);
    if (response.isSuccessful) {
      final dynamic jsonElement = response.body;
      return jsonElement.map((json) => PostEntity.fromEntity(json));
    } else {
      throw Exception('Failed to load post of id = $id');
    }
  }
}
