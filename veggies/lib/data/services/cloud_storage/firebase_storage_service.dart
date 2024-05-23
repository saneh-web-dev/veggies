

import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class VFirebaseStorageService extends GetxController{
  static VFirebaseStorageService get instance => Get.find();

  final _firebaseStorage = FirebaseStorage.instance;

  //upload local asset form ide

// return a unit8 list containing image data
  Future<Uint8List> getImageDataFromAsset(String path) async {
   try{
     final byteData = await rootBundle.load(path);
     final imageData = byteData.buffer.asUint8List(byteData.offsetInBytes,byteData.lengthInBytes);
     return imageData;
   } catch (e){
     throw 'Error loading image Data : $e';
   }
  }
  
  //upload image using cloud storage
//returns the download url form uploaded image
Future<String> uploadImageData(String path, Uint8List image,String name) async {
    try{
      final  ref = _firebaseStorage.ref(path).child(name);
     await ref.putData(image);
     final url = await ref.getDownloadURL();
     return url;
    } catch (e){
      if(e is FirebaseException){
        throw 'Firebase Exception : ${e.message}';
      }else if(e is SocketException){
        throw 'Network Error : ${e.message}';
      }else if(e is PlatformException){
        throw 'Platform Exception : ${e.message}';
      }else{
        throw 'Something went wrong. Please try again';
      }
    }

}
}