import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_based_on_pubc_mobile_logic/features/post/presentation/viewmodeles/post_viewmodel.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      final postViewModel = Provider.of<PostViewModel>(context, listen: false);
      postViewModel.fetchAllPosts();
    });
  }

  @override
  Widget build(BuildContext context) {
    final postViewModel = Provider.of<PostViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Posts Test',
          style: TextStyle(color: Colors.black45),
        ),
        backgroundColor: const Color.fromARGB(255, 70, 64, 255),
      ),
      body: postViewModel.posts.isEmpty
          ? Center(
              child: CircularProgressIndicator(
              color: Colors.red,
            ))
          : ListView.builder(
              itemCount: postViewModel.posts.length,
              itemBuilder: (context, index) {
                final post = postViewModel.posts[index];
                return ListTile(
                  title: Text(post.title),
                  subtitle: Text(post.body),
                );
              },
            ),
    );
  }
}
