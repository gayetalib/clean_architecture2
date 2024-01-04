import 'package:chopper/chopper.dart';
import 'package:dartz/dartz.dart';
import 'package:test_based_on_pubc_mobile_logic/features/post/domain/entities/post_entity.dart';

abstract class PostRepositoryInterface {
  Future<List<PostEntity>> getPosts();
  Future<PostEntity> getPost(int id);
}
