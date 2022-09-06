import 'package:cloud_firestore/cloud_firestore.dart';

class PersonModel {
  String? name;
  String? city;
  int? age;

  PersonModel({this.name, this.city, this.age});

  PersonModel.fromResponse(DocumentSnapshot<Object?> response) {
    name = response.get('name');
    city = response.get('city');
    age = response.get('age');
  }
}