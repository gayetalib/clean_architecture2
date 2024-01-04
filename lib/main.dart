import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_based_on_pubc_mobile_logic/features/post/domain/entities/post_entity.dart';
import 'package:test_based_on_pubc_mobile_logic/features/post/domain/repositories/post_repository_interface.dart';
import 'package:test_based_on_pubc_mobile_logic/features/post/infrastruture/datasources/remote/post_remote_datasource.dart';
import 'package:test_based_on_pubc_mobile_logic/features/post/infrastruture/repositories/post_repository_impl.dart';
import 'package:test_based_on_pubc_mobile_logic/features/post/presentation/screens/post_list_screen.dart';
import 'package:test_based_on_pubc_mobile_logic/features/post/presentation/screens/post_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Clean Architecture Example',
      home: Provider<PostRepositoryInterface>(
        create: (_) => PostRepositoryImpl(PostRemoteDataSource.create()),
        child: const HomePage(),
      ),
    );
  }
}
