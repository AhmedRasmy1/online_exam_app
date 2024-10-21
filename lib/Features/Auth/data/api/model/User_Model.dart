import '../../../domain/entities/user.dart';

/// message : "success"
/// user : {"_id":"670b34bfe77d68595a292b4d","username":"svsvsgsgsdvd","firstName":"zcarqfqfqf","lastName":"wfsfsfafwf","email":"05ssvsfsvs@mail.com","phone":"01200361130","role":"user","isVerified":false,"createdAt":"2024-10-13T02:47:27.461Z"}

class UserModel {
  UserModel({
    this.message,
    this.user,
  });

  UserModel.fromJson(dynamic json) {
    message = json['message'];
    user = json['user'] != null ? UserDto.fromJson(json['user']) : null;
  }

  String? message;
  UserDto? user;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    return map;
  }

  User toUser() {
    return User(
      username: user?.username,
      lastName: user?.lastName,
      email: user?.email,
      phone: user?.phone,
      firstName: user?.firstName,
      id: user?.id,
      isVerified: user?.isVerified,
    );
  }
}

/// _id : "670b34bfe77d68595a292b4d"
/// username : "svsvsgsgsdvd"
/// firstName : "zcarqfqfqf"
/// lastName : "wfsfsfafwf"
/// email : "05ssvsfsvs@mail.com"
/// phone : "01200361130"
/// role : "user"
/// isVerified : false
/// createdAt : "2024-10-13T02:47:27.461Z"

class UserDto {
  UserDto({
    this.id,
    this.username,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.role,
    this.isVerified,
    this.createdAt,
  });

  UserDto.fromJson(dynamic json) {
    id = json['_id'];
    username = json['username'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    phone = json['phone'];
    role = json['role'];
    isVerified = json['isVerified'];
    createdAt = json['createdAt'];
  }

  String? id;
  String? username;
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  String? role;
  bool? isVerified;
  String? createdAt;

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
    return map;
  }
}
