class UserModel {
  String? id;
  String? username;
  String? email;
  String? name;
  String? photoUrl;

  UserModel({
    this.id,
    this.username,
    this.email,
    this.name,
    this.photoUrl,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    email = json['email'];
    name = json['name'];
    photoUrl = json['photoUrl'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'email': email,
      'name': name,
      'photoUrl': photoUrl,
    };
  }
}
