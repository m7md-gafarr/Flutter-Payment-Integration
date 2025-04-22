import 'profile.dart';

class GenerateTokenModel {
  Profile? profile;
  String? token;

  GenerateTokenModel({this.profile, this.token});

  factory GenerateTokenModel.fromJson(Map<String, dynamic> json) {
    return GenerateTokenModel(
      profile:
          json['profile'] == null
              ? null
              : Profile.fromJson(json['profile'] as Map<String, dynamic>),
      token: json['token'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'profile': profile?.toJson(),
    'token': token,
  };
}
