/// id : "6702ad39e77d68595a291e8b"
/// username : "elevate123"
/// firstName : "Elevate"
/// lastName : "Tech"
/// email : "admin123@elevate.com"
/// phone : "01094155711"
/// role : "user"
/// isVerified : false
/// createdAt : "2024-10-06T15:31:05.209Z"
/// token : ""

class User {
  User({
    this.id,
    this.username,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.isVerified,
    this.token,
  });

  String? id;
  String? username;
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  bool? isVerified;
  String? token;
}
