import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_based_on_pubc_mobile_logic/config/router.dart';
import 'package:test_based_on_pubc_mobile_logic/features/comment/domain/repositories/comment_repository_interface.dart';
import 'package:test_based_on_pubc_mobile_logic/features/comment/infrastucture/datasource/remote/comment_remote_datasource_service.dart';
import 'package:test_based_on_pubc_mobile_logic/features/comment/infrastucture/repositories/comment_repository_impl.dart';
import 'package:test_based_on_pubc_mobile_logic/features/comment/presentation/screens/comment_list_screen.dart';
import 'package:test_based_on_pubc_mobile_logic/features/comment/presentation/widgets/comment_widget.dart';

void main() => runApp(const CommentScreen());

class CommentScreen extends StatelessWidget {
  const CommentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Comment',
        //home: CommentWidget(),
        home: Provider<CommentRepositoryInterface>(
            create: (_) =>
                CommentRepositoryImpl(CommentRemoteDatasourceService.create()),
            child: const CommentWidget()));
  }
}
