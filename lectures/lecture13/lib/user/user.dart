import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    required String login,
    required String firstName,
    required String lastName,
    DateTime? birthday,
    String? photo,
    @Default([]) List<UserModel> users,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
  
  @override
  Map<String,dynamic> toJson();
}