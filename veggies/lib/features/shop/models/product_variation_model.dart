
class ProductVariationModel {
  final String id;
  String sku;
  String image;
  String? description;
  double price;
  double salePrice;
  int stock;
  Map<String,String> attributeValues;

  ProductVariationModel({
    required this.id,
     this.sku = '',
     this.image = '',
     this.description = '',
     this.price = 0.0,
    this.salePrice = 0.0,
     this.stock = 0,
    required this.attributeValues,
  });

static ProductVariationModel empty() => ProductVariationModel(id: '', attributeValues: {});

toJson() {
  return {
    'id': id,
   'sku': sku,
    'image': image,
    'description': description,
    'price': price,
   'salePrice': salePrice,
   'stock': stock,
    'attributeValues': attributeValues,
  };
}
  factory ProductVariationModel.fromJson(Map<String,dynamic> document){
  final data = document;
  if(data.isEmpty) return ProductVariationModel.empty();
  return ProductVariationModel(
    id: data['Id'] ?? '',
    price: double.parse((data['Price']?? 0.0).toString()),
    sku: data['SKU'] ?? '',
    stock:data['Stock'] ?? '',
    salePrice: double.parse((data['SalePrice']?? 0.0).toString()),
    image: data['Image'] ?? '',
    description: data['Description'] ?? '',
    attributeValues: Map<String,String>.from(data['AttributeValues']),
  );
  }

}