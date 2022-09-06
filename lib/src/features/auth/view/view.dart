import 'package:fininfocom_assignment/src/features/auth/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Center(
                    child: Text(
                      'Login',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Form(
                    key: context.read<LoginProvider>().usernameFormkey,
                    child: TextFormField(
                      controller:
                          context.watch<LoginProvider>().usernameController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Field is required';
                        } else if (value.length < 10) {
                          return 'Username should be 10 digit';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: 'username',
                        prefixIcon: const Icon(Icons.person),
                        fillColor: Colors.grey[400],
                        filled: true,
                        border: const OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                      ),
                      onChanged: (value) => context
                          .read<LoginProvider>()
                          .usernameFormkey
                          .currentState!
                          .validate(),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Form(
                    key: context.read<LoginProvider>().passwordFormkey,
                    child: TextFormField(
                      controller:
                          context.watch<LoginProvider>().passwordController,
                      validator: (value) {
                        if (value!.length < 7) {
                          return 'Password should be 7 digit';
                        } else if (!RegExp(
                                r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{7,}$')
                            .hasMatch(value)) {
                          return 'Password is 1 UpperCase Alphabet and 1 Special Character and Numeric';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: 'password',
                        errorMaxLines: 2,
                        prefixIcon: const Icon(Icons.lock),
                        fillColor: Colors.grey[400],
                        filled: true,
                        border: const OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                      ),
                      onChanged: (value) => context
                          .read<LoginProvider>()
                          .passwordFormkey
                          .currentState!
                          .validate(),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () => context.read<LoginProvider>().validation(context),
                    child: Container(
                      height: 50,
                      width: 120,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(5)),
                      child: const Center(
                          child: Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      )),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
