import '../../data/data.dart';

import '../../domain/domain.dart';

class RemoteCommentModel {
  final RemoteUserModel user;
  final String value;

  RemoteCommentModel({
    required this.user,
    required this.value,
  });

  factory RemoteCommentModel.fromJson(Map json) {
    return RemoteCommentModel(
      user: RemoteUserModel.fromJson(json['user']),
      value: json['value'],
    );
  }

  CommentEntity toEntity() => CommentEntity(
        user: this.user.toEntity(),
        value: this.value,
      );
  factory RemoteCommentModel.fromEntity(CommentEntity entity) =>
      RemoteCommentModel(
        user: RemoteUserModel.fromEntity(entity.user),
        value: entity.value,
      );

  Map<String, dynamic> toJson() {
    return {
      'user': user.toJson(),
      'value': value,
    };
  }
}
