import 'package:flutter/material.dart';
import 'package:test_based_on_pubc_mobile_logic/features/post/application/services/post_service.dart';
import 'package:test_based_on_pubc_mobile_logic/features/post/domain/entities/post_entity.dart';

class PostViewModel extends ChangeNotifier {
  final PostService postService;

  PostViewModel({required this.postService});

  List<PostEntity> posts = [];

  Future<void> fetchAllPosts() async {
    try {
      final fetchedPosts = await postService.getAllPosts();
      posts = fetchedPosts as List<PostEntity>;
      notifyListeners();
    } catch (e) {
      // Handle errors
    }
  }
}
