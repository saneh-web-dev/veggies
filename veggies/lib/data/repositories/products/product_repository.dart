import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:veggies/data/services/cloud_storage/firebase_storage_service.dart';
import 'package:veggies/utils/exceptions/firebase_exceptions.dart';
import 'package:veggies/utils/exceptions/platform_exceptions.dart';

import '../../../features/shop/models/product_model.dart';
import '../../../utils/constants/enums.dart';

class ProductRepository extends GetxController {
  static ProductRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  Future<List<ProductModel>> getFeaturedProducts() async {
    try {
      final snapshot = await _db.collection('Products').where('IsFeatured',isEqualTo:true).limit(4).get();
      return snapshot.docs.map((e) => ProductModel.fromSnapshot(e)).toList();
    } on FirebaseException catch (e) {
      throw VFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw VPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  Future<List<ProductModel>> getAllFeaturedProducts() async {
    try {
      final snapshot = await _db.collection('Products').where('IsFeatured',isEqualTo:true).get();
      return snapshot.docs.map((e) => ProductModel.fromSnapshot(e)).toList();
    } on FirebaseException catch (e) {
      throw VFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw VPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  Future<List<ProductModel>> fetchProductsByQuery(Query query) async {
    try {
      final querySnapshot = await query.get();
      final List<ProductModel> productList = querySnapshot.docs.map((doc) => ProductModel.fromQuerySnapshot(doc)).toList();
      return productList;
    } on FirebaseException catch (e) {
      throw VFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw VPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }


  Future<void> uploadDummyData(List<ProductModel> products) async {
    try {
      final storage = Get.put(VFirebaseStorageService());

      for (var product in products) {
        final thumbnail =
            await storage.getImageDataFromAsset(product.thumbnail);

        final url = await storage.uploadImageData(
            'Products/Images', thumbnail, product.thumbnail.toString());
        product.thumbnail = url;

        if (product.images != null && product.images!.isNotEmpty) {
          List<String> imageUrl = [];
          for (var image in product.images!) {
            final assetImage = await storage.getImageDataFromAsset(image);
            final url = await storage.uploadImageData(
                'Products/Images', assetImage, image);
            imageUrl.add(url);
          }
          product.images!.clear();
          product.images!.addAll(imageUrl);
        }

        if (product.productType == ProductType.variable.toString()) {
          for (var variation in product.productVariations!) {
            final assetImage =
                await storage.getImageDataFromAsset(variation.image);

            final url = await storage.uploadImageData(
                'Product/Images', assetImage, variation.image);

            variation.image = url;
          }
        }
        await _db.collection('Products').doc(product.id).set(product.toJson());
      }
    } on FirebaseException catch (e) {
      throw e.message!;
    } on SocketException catch (e) {
      throw e.message;
    } on PlatformException catch (e) {
      throw e.message!;
    } catch (e) {
      e.toString();
    }
  }
}
