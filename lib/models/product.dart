import 'package:saldah_shop/models/user_model.dart';

class Product {
  int? id;
  String? name;
  String? price;
  String? stock;
  String? type;
  String? description;
  String? image;
  String? likesCount;
  String? commentsCount;
  User? user;
  bool? selfLiked;

  Product({
    this.id,
    this.name,
    this.price,
    this.stock,
    this.type,
    this.description,
    this.image,
    this.likesCount,
    this.commentsCount,
    this.user,
    this.selfLiked,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      price: json['price'],
      stock: json['stock'],
      type: json['type'],
      description: json['description'],
      image: json['image'],
      likesCount: json['likes_count'],
      commentsCount: json['comments_count'],
      selfLiked: json['likes'].length > 0,
      user: User(
        id: json['user']['id'],
        name: json['user']['name'],
        image: json['user']['image'],
      ),
    );
  }
}
