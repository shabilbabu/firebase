import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fininfocom_assignment/src/model/person_model.dart';
import 'package:fininfocom_assignment/src/model/user_model.dart';

class Firebase{

  CollectionReference users = FirebaseFirestore.instance.collection('persons');

  Future<dynamic> fetchUsers() async {
    try {
      final res = await users.get();
      final resp = res.docs.map((e) => PersonModel.fromResponse(e)).toList();
       resp.sort((a, b) => a.name.toString().compareTo(b.name.toString()),);
       return resp;
    } on FirebaseException {
      return 'firebase error';
    } on SocketException {
      return 'Connection Refused !';
    }
  }

   userAdd(UserModel user) async {
    final userPost =  FirebaseFirestore.instance.collection('users').doc();
    await userPost.set(user.toMap());
    
  } 

  Future<dynamic> getUSer() async {
    try {
      final userte =  FirebaseFirestore.instance.collection('users');
      //final res = await userte.get();
      QuerySnapshot snapshot =await userte.get();
       final allData = snapshot.docs.map((doc) => doc.data()).toList();
      
      final users= usersFromMap(allData);
      log(users.length.toString());
      return users;
    // return"EMPTY";
    } on FirebaseException {
      return 'firebase error';
    } on SocketException {
      return 'Connection Refused !';
    }
  }

}
