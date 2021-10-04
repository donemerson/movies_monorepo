import '../../domain/domain.dart';

class RemoteUserModel {
  final int id;
  final String username;
  final String? token;

  RemoteUserModel({
    this.token,
    required this.id,
    required this.username,
  });

  factory RemoteUserModel.fromJson(Map json) {
    return RemoteUserModel(
      id: json['id'],
      username: json['username'],
      token: json['token'],
    );
  }

  UserEntity toEntity() => UserEntity(
        id: this.id,
        username: this.username,
        token: this.token,
      );

  factory RemoteUserModel.fromEntity(UserEntity entity) => RemoteUserModel(
        id: entity.id,
        username: entity.username,
        token: entity.token,
      );

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
    };
  }
}
