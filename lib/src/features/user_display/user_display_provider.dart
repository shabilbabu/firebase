import 'dart:developer';

import 'package:fininfocom_assignment/src/model/user_model.dart';
import 'package:fininfocom_assignment/src/services/firebase/firebase.dart';
import 'package:flutter/material.dart';

class UserDisplayProvider with ChangeNotifier {

  List<UserModel> users = [];
  
  laodUsers(BuildContext context) {
    Firebase().getUSer().then((data) {
      if (data is List<UserModel>) {
        log('isList');
        users = data;
        notifyListeners();
      } else if (data is String) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(data)));
      }
    });
  }
}
