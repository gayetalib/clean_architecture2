class CommentEntity {
  final int id;
  final String author;
  final String text;
  final String date;
  final bool deleted;

  CommentEntity(
      {required this.id,
      required this.author,
      required this.text,
      required this.date,
      required this.deleted});

  factory CommentEntity.fromJson(Map<String, dynamic> json) {
    return CommentEntity(
        id: json['id'] as int,
        author: json['author'] as String,
        text: json['text'] as String,
        date: json['date'],
        deleted: json['deleted']);
  }

  factory CommentEntity.fromEntity(CommentEntity entity) {
    return CommentEntity(
        id: entity.id,
        author: entity.author,
        text: entity.text,
        date: entity.date,
        deleted: entity.deleted);
  }
}
