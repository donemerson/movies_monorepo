import 'user_entity.dart';

class CommentEntity {
  final UserEntity user;
  final String value;

  CommentEntity({
    required this.user,
    required this.value,
  });
}
