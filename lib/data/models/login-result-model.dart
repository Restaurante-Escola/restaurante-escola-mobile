import 'package:json_annotation/json_annotation.dart';
part 'login-result-model.g.dart';

@JsonSerializable()
class LoginResultModel {
  LoginResultModel({required this.token});

  String token;

  factory LoginResultModel.fromJson(Map<String, dynamic> json) =>
      _$LoginResultModelFromJson(json);
  Map<String, dynamic> toJson() => _$LoginResultModelToJson(this);
}
