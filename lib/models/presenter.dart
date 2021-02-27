// Presenter-presenter profile class
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'index.dart';

class Presenter {
  final int id;
  final String fname;
  final String lname;
  final String country;
  final String image;
  final List<LiveVideo> videos;
  final List followers;
  final List<Product> products;
  final String about;

  Presenter({
    this.id,
    this.fname,
    this.lname,
    this.country,
    this.image,
    this.videos,
    this.followers,
    this.products,
    this.about,
  });


  Presenter copyWith({
    int id,
    String fname,
    String lname,
    String country,
    String image,
    List<LiveVideo> videos,
    List followers,
    List<Product> products,
    String about,
  }) {
    return Presenter(
      id: id ?? this.id,
      fname: fname ?? this.fname,
      lname: lname ?? this.lname,
      country: country ?? this.country,
      image: image ?? this.image,
      videos: videos ?? this.videos,
      followers: followers ?? this.followers,
      products: products ?? this.products,
      about: about ?? this.about,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'fname': fname,
      'lname': lname,
      'country': country,
      'image': image,
      'videos': videos?.map((x) => x?.toMap())?.toList(),
      'followers': followers,
      'products': products?.map((x) => x?.toMap())?.toList(),
      'about': about,
    };
  }

  factory Presenter.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return Presenter(
      id: map['id'],
      fname: map['fname'],
      lname: map['lname'],
      country: map['country'],
      image: map['image'],
      videos: List<LiveVideo>.from(map['videos']?.map((x) => LiveVideo.fromMap(x))),
      followers: List.from(map['followers']),
      products: List<Product>.from(map['products']?.map((x) => Product.fromMap(x))),
      about: map['about'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Presenter.fromJson(String source) => Presenter.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Presenter(id: $id, fname: $fname, lname: $lname, country: $country, image: $image, videos: $videos, followers: $followers, products: $products, about: $about)';
  }

}
