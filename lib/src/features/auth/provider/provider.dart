import 'package:fininfocom_assignment/src/features/home/view/view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  GlobalKey<FormState> usernameFormkey = GlobalKey<FormState>();
  GlobalKey<FormState> passwordFormkey = GlobalKey<FormState>();

  validation(BuildContext context) {
    if (usernameController.text == "Fininfocom" && passwordController.text == "Fin@123") {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const HomeView()));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text(
          'Enter valid Details',
        ),
      ));
    }
  }
}
