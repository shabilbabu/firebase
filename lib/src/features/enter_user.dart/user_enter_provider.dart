import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fininfocom_assignment/src/features/user_display/user_display_provider.dart';
import 'package:fininfocom_assignment/src/features/user_display/user_display_view.dart';
import 'package:fininfocom_assignment/src/model/user_model.dart';
import 'package:fininfocom_assignment/src/services/firebase/firebase.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserEnterProvider with ChangeNotifier {
  final TextEditingController username = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController phonenumber = TextEditingController();
  final TextEditingController password = TextEditingController();

  toPostUsers(BuildContext context) {
    final userData = UserModel(
      username: username.text.trim(),
      email: email.text.trim(),
      phonenumber: phonenumber.text.trim(),
      password: password.text.trim(),
    );
    Firebase().userAdd(userData).then((value) {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => UserDisplay()));
   

    });
  }
}
