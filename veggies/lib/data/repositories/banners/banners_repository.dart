
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:veggies/utils/exceptions/firebase_exceptions.dart';

import '../../../features/shop/models/banner_model.dart';
import '../../../utils/exceptions/format_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';

class BannerRepository extends GetxController{
  static BannerRepository get instance => Get.find();

  //variables
final _db = FirebaseFirestore.instance;

//get all order related to current user
Future<List<BannerModel>> fetchBanners() async {
  try{
final result = await _db.collection('Banners').where('active',isEqualTo: true).get();
return result.docs.map((documentSnapshot) => BannerModel.fromSnapshot(documentSnapshot)).toList();
  }on FirebaseException catch(e){
    throw VFirebaseException(e.code).message;
  }on FormatException catch(_){
    throw VFormatException();
  }on PlatformException catch(e){
    throw VPlatformException(e.code).message;
  }
  catch (e) {
    throw 'Something went wrong Please try again';
  }
}
//upload banner to cloud storage
}

