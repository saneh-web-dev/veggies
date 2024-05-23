
import 'package:get/get.dart';
import 'package:veggies/data/repositories/banners/banners_repository.dart';
import 'package:veggies/features/shop/models/banner_model.dart';

import '../../../common/widgets/loaders/loaders.dart';

class BannerController extends GetxController{

  //variables
  final carouselCurrentIndex = 0.obs;
  final isLoading = false.obs;
final RxList<BannerModel> banners = <BannerModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchBanners();
  }

  //update page navigation dots
  void updatePageIndicator( index){
    carouselCurrentIndex.value = index;
  }

  //fetch banner
  Future<void> fetchBanners() async {
    try {
      //show loader while loading categories
      isLoading.value = true;

      //fetch banners
      final bannerRepo = Get.put(BannerRepository());
      final banners = await bannerRepo.fetchBanners();

      //assign banner
      this.banners.assignAll(banners);
      //hide loader
    } catch (e) {
      VLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      // remove loader
      isLoading.value = false;
    }
  }
}