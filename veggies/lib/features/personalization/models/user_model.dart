// import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:veggies/utils/formatters/formatter.dart';

class UserModel {
  final String id;
  String firstName;
  String lastName;
  final String userName;
  final String email;
  String phoneNumber;
  String profilePicture;

  //constructor for user model
  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.userName,
    required this.email,
    required this.phoneNumber,
    required this.profilePicture,
  });

  //Helper function to get full name
  String get fullName => '$firstName $lastName';

//helper function to format phone number
  String get formattedPhoneNumber => VFormatter.formatPhoneNumber(phoneNumber);

//static function to split full name and last name
  static List<String> nameParts(fullName) => fullName.split('');

//static function to generate username from the full name
  static String generateUsername(fullName) {
    List<String> nameParts = fullName.split('');
    String firstName = nameParts[0].toLowerCase();
    String lastName = nameParts.length > 1 ? nameParts[1].toLowerCase() : "";

    String camelCaseUsername = "$firstName$lastName";
    String usernameWithPrefix = "cwt_$camelCaseUsername";
    return usernameWithPrefix;
  }

//static function to create empty user model
  static UserModel empty() =>
      UserModel(id: '',
          firstName: '',
          lastName: '',
          userName: '',
          email: '',
          phoneNumber: '',
          profilePicture: '');

  //convert model to Json structure for sorting data
Map<String ,dynamic> toJson() {
  return {
    'FirstName' : firstName,
    'LastName' : lastName,
    'UserName' : userName,
    'Email' : email,
    'PhoneNumber' : phoneNumber,
    'ProfilePicture' : profilePicture,
  };
}

//factory method to create model user from a firebase document snapshot
factory UserModel.fromSnapshot(DocumentSnapshot<Map<String,dynamic>> document) {

  if(document.data() !=null){
    final data = document.data()!;
    return UserModel(
      id: document.id,
      firstName: data['FirstName'] ?? '',
      lastName: data['LastName'] ??'',
      userName: data['UserName'] ?? '',
      email: data['Email'] ?? '',
      phoneNumber: data['PhoneNumber'] ?? '',
      profilePicture: data['ProfilePicture'] ?? '',
    );
  }
  return UserModel.empty();
}
}