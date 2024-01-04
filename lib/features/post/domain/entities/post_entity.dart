class PostEntity {
  final int userId;
  final int id;
  final String title;
  final String body;

  PostEntity(
      {required this.userId,
      required this.id,
      required this.body,
      required this.title});

  // convert JSON to PostEntity
  factory PostEntity.fromJson(Map<String, dynamic> json) {
    return PostEntity(
      id: json['id'] as int,
      title: json['title'] as String,
      body: json['body'] as String,
      userId: json['userId'] as int,
    );
  }

  // convert entity
  factory PostEntity.fromEntity(PostEntity entity) {
    return PostEntity(
      id: entity.id,
      title: entity.title,
      body: entity.body,
      userId: entity.userId,
    );
  }
}
