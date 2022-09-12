import 'package:cloud_firestore/cloud_firestore.dart';
List<UserModel> usersFromMap(List list) =>
    List<UserModel>.from(list.map((item) => UserModel.fromJson(item)));
class UserModel{
   String? username;
  String? email;
  String? phonenumber;
  String? password;

  UserModel({this.username, this.email, this.phonenumber, this.password});

  UserModel.fromResponse(DocumentSnapshot<Object?> response) {
    username = response.get('username');
    email = response.get('email');
    phonenumber = response.get('phonenumber');
    password = response.get('password');
  }

  Map<String, dynamic> toMap() {
    return {
      'usernamae': username,
      'email': email,
      'phonenumber': phonenumber,
      'password': password,
    };
  }
  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        username: json['usernamae'],
        email: json['email'],
        phonenumber: json['phonenumber'],
        password: json['password'],

    );
}