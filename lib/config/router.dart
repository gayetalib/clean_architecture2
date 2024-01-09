import 'package:go_router/go_router.dart';
import 'package:test_based_on_pubc_mobile_logic/features/comment/presentation/screens/comment_one_screen.dart';
import 'package:test_based_on_pubc_mobile_logic/features/comment/presentation/widgets/comment_widget.dart';

final router = GoRouter(routes: [
  GoRoute(
      path: '/',
      name: CommentWidget.route,
      builder: (context, state) => const CommentWidget()),
  GoRoute(
      path: 'comment',
      name: CommentOne.route,
      builder: ((context, state) => const CommentOne(
            comment: null,
          )))
]);
