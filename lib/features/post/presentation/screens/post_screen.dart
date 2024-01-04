import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_based_on_pubc_mobile_logic/features/post/domain/entities/post_entity.dart';
import 'package:test_based_on_pubc_mobile_logic/features/post/domain/repositories/post_repository_interface.dart';

class PostScreen extends StatelessWidget {
  const PostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final repository = Provider.of<PostRepositoryInterface>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post Detail'),
      ),
      body: FutureBuilder<PostEntity>(
          future: repository.getPost(2),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            } else {
              final post = snapshot.data as PostEntity;
              return ListTile(
                title: Text(post.title),
                subtitle: Text(post.body),
              );
            }
          }),
    );
  }
}
