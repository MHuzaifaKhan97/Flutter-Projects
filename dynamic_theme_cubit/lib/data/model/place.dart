class Place {
  String? title;
  String? description;
  String? image;
  String? price;
  double? rating;
  int? reviewCount;

  Place(
      {this.title,
      this.description,
      this.image,
      this.price,
      this.rating,
      this.reviewCount});

  Place.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    image = json['image'];
    price = json['price'];
    rating = json['rating'];
    reviewCount = json['reviewCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['description'] = description;
    data['image'] = image;
    data['price'] = price;
    data['rating'] = rating;
    data['reviewCount'] = reviewCount;
    return data;
  }
}
