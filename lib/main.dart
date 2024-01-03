import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_based_on_pubc_mobile_logic/features/post/domain/entities/post_entity.dart';
import 'package:test_based_on_pubc_mobile_logic/features/post/domain/repositories/post_repository_interface.dart';
import 'package:test_based_on_pubc_mobile_logic/features/post/infrastruture/datasources/remote/post_remote_datasource.dart';
import 'package:test_based_on_pubc_mobile_logic/features/post/infrastruture/repositories/post_repository_impl.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Clean Architecture Example',
      home: Provider<PostRepositoryInterface>(
        create: (_) => PostRepositoryImpl(),
        child: HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final repository = Provider.of<PostRepositoryInterface>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Posts'),
      ),
      body: FutureBuilder<List<PostEntity>>(
        future: repository.getPosts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final posts = snapshot.data as List<PostEntity>;
            return ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                final post = posts[index];
                return ListTile(
                  title: Text(post.title),
                  subtitle: Text(post.body),
                  // Customize the display of posts here
                );
              },
            );
          }
        },
      ),
    );
  }
}
