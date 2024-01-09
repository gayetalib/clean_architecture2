import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_based_on_pubc_mobile_logic/config/app_colors.dart';
import 'package:test_based_on_pubc_mobile_logic/features/comment/domain/entity/comment_entity.dart';
import 'package:test_based_on_pubc_mobile_logic/features/comment/domain/repositories/comment_repository_interface.dart';
import 'package:test_based_on_pubc_mobile_logic/features/comment/presentation/widgets/my_app_bar.dart';

class CommentOne extends StatelessWidget {
  static const String route = 'comment';
  final CommentEntity? comment;

  const CommentOne({required this.comment, super.key});

  @override
  Widget build(BuildContext context) {
    //final repository = Provider<CommentRepositoryInterface>();
    return Scaffold(
      backgroundColor: AppColors.backgroundPage,
      appBar: const MyAppBar(title: 'Detail of comment'),
      body: Card(
        elevation: 2,
        child: ListTile(
          title: Column(children: [
            Row(
              children: [
                const Icon(Icons.person),
                Text(
                  '  ${comment!.author}',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                )
              ],
            ),
            //const Divider(),
            Row(
              children: [
                const Icon(Icons.edit),
                Text(
                  comment!.text,
                  style: TextStyle(
                    fontSize: 18,
                  ),
                )
              ],
            )
          ]),
          subtitle: Text(comment!.text),
        ),
      ),
    );
  }
}
