import '../../domain/entities/user.dart';

/// _id : "6702ad39e77d68595a291e8b"
/// username : "elevate123"
/// firstName : "Elevate"
/// lastName : "Tech"
/// email : "admin123@elevate.com"
/// phone : "01094155711"
/// role : "user"
/// isVerified : false
/// createdAt : "2024-10-06T15:31:05.209Z"
/// token : ""

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
    this.token,
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
    token = json['token'];
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
  String? token;

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
    map['token'] = token;
    return map;
  }

  User toUser() {
    return User(
      username: username,
      lastName: lastName,
      email: email,
      phone: phone,
      firstName: firstName,
      id: id,
      isVerified: isVerified,
      token: token,
    );
  }
}
