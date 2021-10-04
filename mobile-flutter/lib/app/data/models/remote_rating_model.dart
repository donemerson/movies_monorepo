import '../../data/data.dart';

import '../../domain/domain.dart';

class RemoteRatingModel {
  final RemoteUserModel user;
  final int value;

  RemoteRatingModel({
    required this.user,
    required this.value,
  });

  factory RemoteRatingModel.fromJson(Map json) {
    return RemoteRatingModel(
      user: RemoteUserModel.fromJson(json['user']),
      value: json['value'],
    );
  }

  RatingEntity toEntity() => RatingEntity(
        user: this.user.toEntity(),
        value: this.value,
      );
  factory RemoteRatingModel.fromEntity(RatingEntity entity) =>
      RemoteRatingModel(
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
