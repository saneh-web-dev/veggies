import 'package:get/get.dart';
import 'package:veggies/common/widgets/loaders/loaders.dart';
import 'package:veggies/data/repositories/categories/category_repository.dart';
import 'package:veggies/features/shop/models/category_model.dart';

class CategoryController extends GetxController {
  static CategoryController get instance => Get.find();

  final isLoading = false.obs;
  RxList<CategoryModel> featuredCategories = <CategoryModel>[].obs;
  RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
  final _categoryRepository = Get.put(CategoryRepository());

  @override
  void onInit() {
    fetchCategories();
    super.onInit();
  }

  //load category data
  Future<void> fetchCategories() async {
    try {
      //show loader while loading categories
      isLoading.value = true;

      //Fetch categories from data source
      final categories = await _categoryRepository.getAllCategories();

      //update categories list
      allCategories.assignAll(categories);

      //filter categories
      featuredCategories.assignAll(allCategories
          .where((category) => category.isFeatured && category.parentId.isEmpty)
          .take(8)
          .toList());
      //hide loader
    } catch (e) {
      VLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      // remove loader
      isLoading.value = false;
    }
  }
//load selected category data

//get category or subcategory products
}
