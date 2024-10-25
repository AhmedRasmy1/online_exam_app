import 'package:online_exam_app/Features/profile/domain/entities/edit_profile_entity.dart';

class EditProfileModel {
  String? id;
  String? username;
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  String? role;
  bool? isVerified;
  String? createdAt;
  String? passwordChangedAt;
  String? password;

  EditProfileModel({
    this.id,
    this.username,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.role,
    this.isVerified,
    this.createdAt,
    this.passwordChangedAt,
    this.password,
  });

  EditProfileModel.fromJson(dynamic json) {
    id = json['_id'];
    username = json['username'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    phone = json['phone'];
    role = json['role'];
    isVerified = json['isVerified'];
    createdAt = json['createdAt'];
    passwordChangedAt = json['passwordChangedAt'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['username'] = username;
    map['firstName'] = firstName;
    map['lastName'] = lastName;
    map['email'] = email;
    map['phone'] = phone;
    map['role'] = role;
    map['isVerified'] = isVerified;
    map['createdAt'] = createdAt;
    map['passwordChangedAt'] = passwordChangedAt;
    map['password'] = password;
    return map;
  }

  EditProfileEntity toEditProfileEntity() {
    return EditProfileEntity(
      username: username,
      firstName: firstName,
      lastName: lastName,
      email: email,
      phone: phone,
    );
  }
}
