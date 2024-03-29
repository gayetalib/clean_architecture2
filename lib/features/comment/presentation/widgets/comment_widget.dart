import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:test_based_on_pubc_mobile_logic/config/router.dart';
import 'package:test_based_on_pubc_mobile_logic/features/comment/domain/entity/comment_entity.dart';
import 'package:test_based_on_pubc_mobile_logic/features/comment/domain/repositories/comment_repository_interface.dart';
import 'package:test_based_on_pubc_mobile_logic/features/comment/infrastucture/datasource/remote/comment_remote_datasource_service.dart';
import 'package:test_based_on_pubc_mobile_logic/features/comment/infrastucture/repositories/comment_repository_impl.dart';
import 'package:test_based_on_pubc_mobile_logic/features/comment/presentation/screens/comment_one_screen.dart';

class CommentWidget extends StatefulWidget {
  static const String route = 'home';
  const CommentWidget({super.key});

  @override
  _CommentWidget createState() => _CommentWidget();
}

class _CommentWidget extends State<CommentWidget> {
  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    final repository = Provider.of<CommentRepositoryInterface>(context);

    TextEditingController authorController = TextEditingController();
    TextEditingController textController = TextEditingController();

    void showBootomSheet(int? id) async {
      if (id != null) {
        final existingPost = await repository.getComment(id);
        authorController.text = existingPost.author;
        textController.text = existingPost.text;
      }
      showModalBottomSheet(
          elevation: 5,
          isScrollControlled: true,
          context: context,
          builder: (_) => Container(
                padding: EdgeInsets.only(
                  top: 30,
                  left: 15,
                  right: 15,
                  bottom: MediaQuery.of(context).viewInsets.bottom + 50,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    TextField(
                      controller: authorController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(), hintText: 'Author'),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: textController,
                      maxLines: 4,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(), hintText: 'Comment'),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: ElevatedButton(
                        onPressed: () async {
                          final body = {
                            'author': authorController.text,
                            'text': textController.text,
                          };
                          if (id == null) {
                            await repository.addComment(body);
                          }

                          if (id != null) {
                            await repository.updateComment(id, body);
                          }

                          authorController.text = "";
                          textController.text = "";

                          Navigator.of(context).pop();
                        },
                        child: Padding(
                          padding: EdgeInsets.all(18),
                          child: Text(
                            id == null ? 'Add Comment' : 'Update',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ));
    }

    return Scaffold(
      backgroundColor: Color(0xFFECEAF4),
      appBar: AppBar(
        title: const Text(
          'Commentaires',
          style: TextStyle(color: Color.fromARGB(255, 221, 218, 218)),
        ),
        backgroundColor: const Color.fromARGB(255, 8, 102, 179),
      ),
      body: FutureBuilder<List<CommentEntity>>(
        future: repository.getComments(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
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
            if (comments.isEmpty) {
              return const Center(
                child: Text(
                  "Il n'ya pas de commentaire !",
                  style: TextStyle(color: Colors.black),
                ),
              );
            }
            return ListView.builder(
                itemCount: comments.length,
                itemBuilder: (context, index) => Card(
                      margin: const EdgeInsets.all(15),
                      child: ListTile(
                        title: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 3),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => CommentOne(
                                            comment: comments[index],
                                          )),
                                );
                                // GoRouter.of(context)
                                //     .go('comment', extra: comments[index]);
                                //router.go('comment', extra: comments[index]);
                              },
                              child: Text(
                                comments[index].author,
                                style: TextStyle(fontSize: 20),
                              ),
                            )),
                        subtitle: Text(
                          '${comments[index].text} \n ${comments[index].date}',
                          style: const TextStyle(fontSize: 16),
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                                onPressed: () {
                                  showBootomSheet(comments[index].id);
                                },
                                icon: const Icon(
                                  Icons.edit,
                                  color: Colors.indigo,
                                )),
                            IconButton(
                                onPressed: () {
                                  // dialog(
                                  //     context, comments[index].id, repository);
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        AlertDialog(
                                      title: const Text('Deletion'),
                                      content: const Text(
                                          'Etes-vous sur de supprimer this comment ?'),
                                      contentPadding:
                                          const EdgeInsets.all(20.0),
                                      actions: [
                                        TextButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: const Text('Cancel')),
                                        TextButton(
                                            onPressed: () async {
                                              await repository.deleteComment(
                                                  comments[index].id);
                                              // Refresh the screen by updating the state
                                              setState(() {
                                                comments.removeAt(
                                                    index); // Update the comments list
                                              });

                                              Navigator.of(context)
                                                  .pop(); // Close the dialog
                                            },
                                            child: const Text('Confirm'))
                                      ],
                                    ),
                                  );
                                },
                                icon: const Icon(
                                  Icons.delete,
                                  color: Colors.redAccent,
                                ))
                          ],
                        ),
                      ),
                    ));
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add, color: Colors.white),
          backgroundColor: const Color.fromARGB(255, 8, 102, 179),
          onPressed: () => showBootomSheet(null)),
    );
  }

  void dialog(BuildContext context, int id,
      CommentRepositoryInterface repositoryInterface) {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Deletion'),
        content: const Text('Etes-vous sur de supprimer this comment ?'),
        contentPadding: const EdgeInsets.all(20.0),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel')),
          TextButton(
              onPressed: () async {
                await repositoryInterface.deleteComment(id);
                // print(
                //     '${comments[index].id}');
                Navigator.of(context).pop();
              },
              child: const Text('Confirm'))
        ],
      ),
    );
  }
}
