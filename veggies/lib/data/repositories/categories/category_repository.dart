import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:veggies/utils/exceptions/firebase_auth_exception.dart';

import '../../../features/shop/models/category_model.dart';
import '../../services/cloud_storage/firebase_storage_service.dart';

class CategoryRepository extends GetxController {
  static CategoryRepository get instance => Get.find();

//variable
  final _db = FirebaseFirestore.instance;

//  Get all category
  Future<List<CategoryModel>> getAllCategories() async {
    try {
      final snapshot = await _db.collection('categories').get();
      final list = snapshot.docs
          .map((document) => CategoryModel.fromSnapshot(document))
          .toList();
      return list;
    } on FirebaseException catch(e){
      throw VFirebaseAuthException(e.code).message;
    }on PlatformException catch(e){
    throw VFirebaseAuthException(e.code).message;
    }
    catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }
//get sub category

//upload category to cloud firebase
Future<void> uploadDummyData(List<CategoryModel> categories) async {
    try {
      // upload all the categories with their images
      final storage= Get.put(VFirebaseStorageService());

      //loop through each category
      for(var category in categories) {
        final file = await storage.getImageDataFromAsset(category.image);

        //upload image and gets its url
        final url = await storage.uploadImageData('categories',file,category.name );

        //assign url to image
        category.image = url;

        //upload category to firebase
        await _db.collection('categories').doc(category.id).set(category.toJson());
      }
    } on FirebaseException catch(e){
      throw VFirebaseAuthException(e.code).message;
    }on PlatformException catch(e){
      throw VFirebaseAuthException(e.code).message;
    }
    catch(e) {
      throw 'Something went wrong. Please try again';
    }
}
}
