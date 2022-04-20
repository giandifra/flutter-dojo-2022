import '../../domain/entities/wall_post.dart';

class WallPostDTO {
  final String id;
  final String userId;
  final String name;
  final String text;
  final DateTime createdOn;

  WallPostDTO({
    required this.id,
    required this.userId,
    required this.name,
    required this.text,
    required this.createdOn,
  });

  factory WallPostDTO.fromJson(Map<String, dynamic> json) {
    return WallPostDTO(
      id: json['id'],
      userId: json['userId'],
      name: json['name'],
      text: json['text'],
      createdOn: json['createdOn'].toDate(),
    );
  }

  factory WallPostDTO.fromDomain(WallPost post) {
    return WallPostDTO(
      id: post.id,
      userId: post.userId,
      name: post.name,
      text: post.text,
      createdOn: post.createdOn,
    );
  }

  toJson() {
    return <String, dynamic>{
      'id': id,
      'userId': userId,
      'name': name,
      'text': text,
      'createdOn': createdOn
    };
  }
}

extension WallPostDTOX on WallPostDTO {
  WallPost toDomain() {
    return WallPost(
      id: id,
      userId: userId,
      name: name,
      text: text,
      createdOn: createdOn,
    );
  }
}
