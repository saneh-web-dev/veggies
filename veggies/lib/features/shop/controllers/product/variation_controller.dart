
import 'package:get/get.dart';

import '../../models/product_variation_model.dart';

class VariationController extends GetxController{
  static VariationController get instance => Get.find();

  RxString variationStockStatus = ''.obs;
  Rx<ProductVariationModel> selectedVariation  = ProductVariationModel.empty().obs;

  void getProductVariationStockStatus() {
    variationStockStatus.value = selectedVariation.value.stock>0?'InStock':'out of Stock';
  }

  String getVariationPrice() {
return (selectedVariation.value.salePrice>0?selectedVariation.value.salePrice:selectedVariation.value.price).toString();
  }

  void resetSelectedVariationAttributes() {
    selectedVariation.value = ProductVariationModel.empty();
    variationStockStatus.value = '';
  }
}