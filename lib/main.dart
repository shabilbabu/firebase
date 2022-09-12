import 'package:fininfocom_assignment/src/features/auth/provider/provider.dart';
import 'package:fininfocom_assignment/src/features/auth/view/view.dart';
import 'package:fininfocom_assignment/src/features/enter_user.dart/user_enter_provider.dart';
import 'package:fininfocom_assignment/src/features/home/provider/provider.dart';
import 'package:fininfocom_assignment/src/features/home/view/view.dart';
import 'package:fininfocom_assignment/src/features/user_display/user_display_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => LoginProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => HomeProvider(),
        ),
         ChangeNotifierProvider(
          create: (context) => UserEnterProvider(),
        ),
         ChangeNotifierProvider(
          create: (context) => UserDisplayProvider(),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeView(),
      ),
    );
  }
}
