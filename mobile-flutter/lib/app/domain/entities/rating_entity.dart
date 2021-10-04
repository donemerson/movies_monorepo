import 'user_entity.dart';

class RatingEntity {
  final UserEntity user;
  final int value;

  RatingEntity({
    required this.user,
    required this.value,
  });
}
