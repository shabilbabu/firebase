import 'dart:developer';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fininfocom_assignment/src/model/person_model.dart';

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

}
