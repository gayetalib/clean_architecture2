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
  Future deleteComment(int id) async {
    try {
      final response = await _remoteDatasourceService.deleteComment(id);
      if (response.isSuccessful) {
        print('${response.body}');
      } else {
        print('Failed to delete comment : ${response.error}');
      }
    } catch (e) {
      throw Exception('Error : $e');
    }
  }

  @override
  Future<CommentEntity> getComment(int id) async {
    try {
      final response = await _remoteDatasourceService.getComment(id);
      if (response.isSuccessful) {
        final dynamic data = response.body! as dynamic;
        return CommentEntity.fromJson(data);
      } else {
        throw Exception('Failed to get post : ${response.error}');
      }
    } catch (e) {
      throw Exception('Error getting post : $e');
    }
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
  Future<CommentEntity> updateComment(int id, Map<String, dynamic> body) async {
    try {
      final response = await _remoteDatasourceService.updateComment(id, body);
      if (response.isSuccessful) {
        final data = response.body!;
        return CommentEntity.fromJson(data);
      } else {
        throw Exception('Failed to update post : ${response.error}');
      }
    } catch (e) {
      throw Exception('Error : $e');
    }
  }
}
