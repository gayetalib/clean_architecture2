import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_based_on_pubc_mobile_logic/features/comment/domain/entity/comment_entity.dart';
import 'package:test_based_on_pubc_mobile_logic/features/comment/domain/repositories/comment_repository_interface.dart';

class CommentListScreen extends StatelessWidget {
  const CommentListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final repository = Provider.of<CommentRepositoryInterface>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Commentaires',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.blueAccent,
        ),
        body: FutureBuilder<List<CommentEntity>>(
            future: repository.getComments(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text('Error: ${snapshot.error}'),
                );
              } else {
                final comments = snapshot.data as List<CommentEntity>;
                return ListView.builder(
                    itemCount: comments.length,
                    itemBuilder: (context, index) {
                      final comment = comments[index];
                      return ListTile(
                        title: Text(comment.author),
                        subtitle: Text(comment.text),
                      );
                    });
              }
            }));
  }
}
