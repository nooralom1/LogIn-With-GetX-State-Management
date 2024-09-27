class ProductsModel {
  List<Products>? products;

  ProductsModel({this.products});

  ProductsModel.fromJson(Map<String, dynamic> json) {
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(Products.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (products != null) {
      data['products'] = products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Products {
  int? productId;
  int? categoryId;
  int? subCategoryId;
  int? childCategoryId;
  String? nameEn;
  String? image;
  int? regPrice;
  int? disType;
  int? disPrice;
  String? brand;
  String? stock;
  int? rating;

  Products(
      {this.productId,
      this.categoryId,
      this.subCategoryId,
      this.childCategoryId,
      this.nameEn,
      this.image,
      this.regPrice,
      this.disType,
      this.disPrice,
      this.brand,
      this.stock,
      this.rating});

  Products.fromJson(Map<String, dynamic> json) {
    productId = json['productId'];
    categoryId = json['category_id'];
    subCategoryId = json['sub_category_id'];
    childCategoryId = json['child_category_id'];
    nameEn = json['name_en'];
    image = json['image'];
    regPrice = json['reg_price'];
    disType = json['dis_type'];
    disPrice = json['dis_price'];
    brand = json['brand'];
    stock = json['stock'];
    rating = json['rating'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['productId'] = productId;
    data['category_id'] = categoryId;
    data['sub_category_id'] = subCategoryId;
    data['child_category_id'] = childCategoryId;
    data['name_en'] = nameEn;
    data['image'] = image;
    data['reg_price'] = regPrice;
    data['dis_type'] = disType;
    data['dis_price'] = disPrice;
    data['brand'] = brand;
    data['stock'] = stock;
    data['rating'] = rating;
    return data;
  }
}
