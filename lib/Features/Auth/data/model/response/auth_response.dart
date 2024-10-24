import '../../../domain/entities/user.dart';

/// message : "success"
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY3MGIzNGJmZTc3ZDY4NTk1YTI5MmI0ZCIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNzI5NTM5ODAzfQ.OsynMqlXiwJV_HDmczVN7eobIp_1-lU_eBqHlLR4nXc"
/// user : {"_id":"670b34bfe77d68595a292b4d","username":"svsvsgsgsdvd","firstName":"zcarqfqfqf","lastName":"wfsfsfafwf","email":"05ssvsfsvs@mail.com","phone":"01200361130","role":"user","isVerified":false,"createdAt":"2024-10-13T02:47:27.461Z"}

class AuthResponse {
  String? message;
  String? token;
  UserModel? user;
  AuthResponse({
    this.message,
    this.token,
    this.user,
  });

  AuthResponse.fromJson(dynamic json) {
    message = json['message'];
    token = json['token'];
    user = json['user'] != null ? UserModel.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['token'] = token;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    return map;
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

class UserModel {
  UserModel({
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

  UserModel.fromJson(dynamic json) {
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

  User toUser() {
    return User(
        username: username,
        lastName: lastName,
        email: email,
        phone: phone,
        firstName: firstName,
        token: AuthResponse().token,
        isVerified: isVerified,
        id: id);
  }
}
