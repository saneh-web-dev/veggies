import 'package:get/get.dart';
import 'package:veggies/common/widgets/loaders/loaders.dart';

import '../../../data/repositories/products/product_repository.dart';
import '../../../utils/constants/enums.dart';
import '../models/product_model.dart';

class ProductController extends GetxController {
  static ProductController get instance => Get.find();

  final isLoading = false.obs;
  final productRepository = Get.put(ProductRepository());
  RxList<ProductModel> featuredProducts = <ProductModel>[].obs;

  @override
  void onInit() {
    fetchFeaturedProducts();
    super.onInit();
  }

  void fetchFeaturedProducts()async {
    try {
      isLoading.value = true;
      final products = await productRepository.getFeaturedProducts();
      featuredProducts.assignAll(products);
    } catch (e) {
      VLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<List<ProductModel>> fetchAllFeaturedProducts()async {
    try {
      final products = await productRepository.getFeaturedProducts();
      return products;
    } catch (e) {
      VLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
      return [];
    }
  }

  String getProductPrice(ProductModel product){
double smallestPrice = double.infinity;
double largestPrice = 0.0;

if(product.productType == ProductType.single.toString()){
  return (product.salePrice > 0 ? product.salePrice:product.price).toString();
}else{
  for (var  variation in product.productVariations!){
    double priceToConsider = variation.salePrice>0.0?variation.salePrice:variation.price;
    if(priceToConsider < smallestPrice){
      smallestPrice = priceToConsider;
    }
    if(priceToConsider > largestPrice){
      largestPrice = priceToConsider;
    }
  }
  if(smallestPrice.isEqual(largestPrice)){
    return smallestPrice.toString();
  }else{
    return "$smallestPrice - \$$largestPrice";
  }
}
  }

  String? calculateSalePercentage(double originalPrice, double?salePrice){
    if(salePrice == null || salePrice == 0.0) return null;
    if(originalPrice <= 0) return null;

    double percentage = ((originalPrice - salePrice) / originalPrice) * 100;
    return percentage.toStringAsFixed(0);
  }

  String getProductStockStatus(int stock){
    return stock >0 ? 'In stock' : 'Out of stock';
  }
}
