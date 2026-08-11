import 'package:json_annotation/json_annotation.dart';

part 'profile_response_model.g.dart';

@JsonSerializable()
class UsersResponseModel {
  String? message;

  @JsonKey(name: 'data')
  List<UserData?>? usersList;

  bool? status;
  int? code;

  UsersResponseModel({
    this.message,
    this.usersList,
    this.status,
    this.code,
  });

  factory UsersResponseModel.fromJson(Map<String, dynamic> json) =>
      _$UsersResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$UsersResponseModelToJson(this);
}

@JsonSerializable()
class UserData {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? gender;

  UserData({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.gender,
  });

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);

  Map<String, dynamic> toJson() => _$UserDataToJson(this);
}