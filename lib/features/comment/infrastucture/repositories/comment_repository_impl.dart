import 'package:test_based_on_pubc_mobile_logic/features/comment/domain/entity/comment_entity.dart';
import 'package:test_based_on_pubc_mobile_logic/features/comment/domain/repositories/comment_repository_interface.dart';
import 'package:test_based_on_pubc_mobile_logic/features/comment/infrastucture/datasource/remote/comment_remote_datasource_service.dart';

class CommentRepositoryImpl implements CommentRepositoryInterface {
  final CommentRemoteDatasourceService _remoteDatasourceService;

  CommentRepositoryImpl(this._remoteDatasourceService);

  @override
  Future<void> addComment(Map<String, dynamic> body) async {
    try {
      final response = await _remoteDatasourceService.addComment(body);
      if (response.isSuccessful) {
        //final dynamic data = response.body!;
        print('Post added : ${response.body}');
        //return data.map((json) => CommentEntity.fromEntity(json));
      } else {
        print('Failed to add post: ${response.error}');
      }
    } catch (error) {
      print('Error adding post: $error');
    }
  }

  @override
  Future deleteComment(int id) {
    // TODO: implement deleteComment
    throw UnimplementedError();
  }

  @override
  Future<CommentEntity> getComment(int id) {
    // TODO: implement getComment
    throw UnimplementedError();
  }

  @override
  Future<List<CommentEntity>> getComments() async {
    final response = await _remoteDatasourceService.getComments();
    if (response.isSuccessful) {
      final List<dynamic> data = response.body!;
      return data.map((json) => CommentEntity.fromJson(json)).toList();
    } else {
      throw Exception('null');
    }
  }

  @override
  Future<CommentEntity> updateComment(int id, Map<String, dynamic> body) {
    // TODO: implement updateComment
    throw UnimplementedError();
  }
}
