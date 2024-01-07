class CommentEntity {
  final int id;
  final String author;
  final String text;
  //final DateTime date;

  CommentEntity({
    required this.id,
    required this.author,
    required this.text,
  });

  factory CommentEntity.fromJson(Map<String, dynamic> json) {
    return CommentEntity(
      id: json['id'] as int,
      author: json['author'] as String,
      text: json['text'] as String,
      //date: json['date'],
    );
  }

  factory CommentEntity.fromEntity(CommentEntity entity) {
    return CommentEntity(
      id: entity.id,
      author: entity.author,
      text: entity.text,
      //date: entity.date
    );
  }
}
