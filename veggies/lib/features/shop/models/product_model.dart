import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:veggies/features/shop/models/product_attribute.dart';
import 'package:veggies/features/shop/models/product_variation_model.dart';

import 'brand_model.dart';

class ProductModel {
  String id;
  int stock;
  String? sku;
  double price;
  String title;
  DateTime? date;
  double salePrice;
  String thumbnail;
  String? description;
  bool? isFeatured;
  BrandModel? brand;
  String? categoryId;
  List<String>? images;
  String productType;
  List<ProductAttributeModel>? productAttributes;
  List<ProductVariationModel>? productVariations;

  ProductModel({
    required this.id,
    required this.stock,
    this.sku,
    required this.price,
    required this.title,
    this.date,
    this.salePrice = 0.0,
    required this.thumbnail,
    this.isFeatured,
    this.brand,
    this.categoryId,
    this.images,
    required this.productType,
    this.productAttributes,
    this.productVariations,
     this.description,
  });

  static ProductModel empty() => ProductModel(id: '', stock: 0, price: 0, title: '', thumbnail: '', productType: '', description: '');

  toJson() {
    return {
     'Stock': stock,
     'SKU': sku,
      'Price': price,
      'Title': title,
      'Date': date,
      'Description' : description,
     'SalePrice': salePrice,
      'Thumbnail': thumbnail,
      'IsFeatured': isFeatured,
      'Brand': brand?.toJson(),
      'CategoryId': categoryId,
      'Images': images ?? [],
      'ProductType': productType,
      'ProductAttributes': productAttributes != null ? productAttributes!.map((e) => e.toJson()).toList() : [],
      'ProductVariations': productVariations != null ? productVariations!.map((e) => e.toJson()).toList:[],
    };
  }

  factory ProductModel.fromSnapshot(DocumentSnapshot<Map<String,dynamic>> document){
    final data = document.data()!;
    return ProductModel(
      id: document.id,
      stock: data['Stock'] ??0,
      sku: data['SKU'],
      description: data['Description'] ?? '',
      price: double.parse((data['SalePrice']??0.0).toString()),
      title: data['Title'],
      date: data['Date'],
      salePrice: double.parse((data['SalePrice']??0.0).toString()),
      thumbnail: data['Thumbnail'] ?? '',
      isFeatured: data['IsFeatured'] ?? false,
      brand: BrandModel.fromJson(data['Brand']),
      categoryId: data['CategoryId'] ?? '',
      images: data['Images'] != null ? List<String>.from(data['Images']) :[],
      productType: data['ProductType'] ?? '',
      productAttributes:(data['ProductAttributes'] as List<dynamic>).map((e) => ProductAttributeModel.fromJson(e)).toList(),
      productVariations:(data['ProductVariations'] as List<dynamic>).map((e)=> ProductVariationModel.fromJson(e)).toList(),
    );
  }

  factory ProductModel.fromQuerySnapshot(QueryDocumentSnapshot<Object?> document){
    final data = document.data() as Map<String,dynamic>;
  return ProductModel(
    id: document.id,
    stock: data['Stock'] ??0,
    sku: data['SKU'],
    description: data['Description'] ?? '',
    price: double.parse((data['SalePrice']??0.0).toString()),
    title: data['Title'],
    date: data['Date'],
    salePrice: double.parse((data['SalePrice']??0.0).toString()),
    thumbnail: data['Thumbnail'] ?? '',
    isFeatured: data['IsFeatured'] ?? false,
    brand: BrandModel.fromJson(data['Brand']),
    categoryId: data['CategoryId'] ?? '',
    images: data['Images'] != null ? List<String>.from(data['Images']) :[],
    productType: data['ProductType'] ?? '',
    productAttributes:(data['ProductAttributes'] as List<dynamic>).map((e) => ProductAttributeModel.fromJson(e)).toList(),
    productVariations:(data['ProductVariations'] as List<dynamic>).map((e)=> ProductVariationModel.fromJson(e)).toList(),
  );
  }
}
