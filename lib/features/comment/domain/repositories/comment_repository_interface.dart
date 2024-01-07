import 'package:test_based_on_pubc_mobile_logic/features/comment/domain/entity/comment_entity.dart';

abstract class CommentRepositoryInterface {
  Future<List<CommentEntity>> getComments();
  Future<CommentEntity> getComment(int id);
  Future<void> addComment(Map<String, dynamic> body);
  Future<CommentEntity> updateComment(int id, Map<String, dynamic> body);
  Future deleteComment(int id);
}
