import 'dart:convert';

// product class
class Product {
  final int id;
  final String name;
  final String productClass;
  final String image;
  final String description;
  final double price;
  final String reviewVideoUrl;

  Product({
    this.id,
    this.name,
    this.productClass,
    this.image,
    this.description,
    this.price,
    this.reviewVideoUrl,
  });

  Product copyWith({
    int id,
    String name,
    String productClass,
    String image,
    String description,
    double price,
    String reviewVideoUrl,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      productClass: productClass ?? this.productClass,
      image: image ?? this.image,
      description: description ?? this.description,
      price: price ?? this.price,
      reviewVideoUrl: reviewVideoUrl ?? this.reviewVideoUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'productClass': productClass,
      'image': image,
      'description': description,
      'price': price,
      'reviewVideoUrl': reviewVideoUrl,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return Product(
      id: map['id'],
      name: map['name'],
      productClass: map['productClass'],
      image: map['image'],
      description: map['description'],
      price: map['price'],
      reviewVideoUrl: map['reviewVideoUrl'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) => Product.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Product(id: $id, name: $name, productClass: $productClass, image: $image, description: $description, price: $price, reviewVideoUrl: $reviewVideoUrl)';
  }

}
