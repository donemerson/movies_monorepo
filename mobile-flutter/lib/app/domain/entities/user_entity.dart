class UserEntity {
  final int id;
  final String username;
  final String? token;

  UserEntity({
    this.token,
    required this.id,
    required this.username,
  });
}
