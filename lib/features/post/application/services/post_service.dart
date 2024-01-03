import 'package:chopper/chopper.dart';
import 'package:test_based_on_pubc_mobile_logic/features/post/domain/entities/post_entity.dart';
import 'package:test_based_on_pubc_mobile_logic/features/post/domain/repositories/post_repository_interface.dart';

class PostService {
  final PostRepositoryInterface repository;

  PostService({required this.repository});

  Future<List<PostEntity>> getAllPosts() async {
    return repository.getPosts();
  }
}
