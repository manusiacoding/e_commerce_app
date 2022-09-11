class User {
  int? id;
  String? name;
  String? email;
  String? token;
  String? image;

  User({this.id, this.name, this.email, this.image, this.token});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        id: json['user']['id'],
        name: json['user']['name'],
        email: json['user']['email'],
        image: json['user']['email'],
        token: json['token']
    );
  }
}
