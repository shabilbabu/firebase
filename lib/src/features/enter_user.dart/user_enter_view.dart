import 'package:fininfocom_assignment/src/features/enter_user.dart/user_enter_provider.dart';
import 'package:fininfocom_assignment/src/features/user_display/user_display_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserEnterView extends StatelessWidget {
  const UserEnterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Enter details'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:  [
               TextField(
                controller: context.watch<UserEnterProvider>().username,
                decoration: const InputDecoration(
                  hintText: 'username'
                ),
                
              ),
              const SizedBox(height: 20,),
               TextField(
                controller: context.watch<UserEnterProvider>().email,
                decoration: const InputDecoration(
                  hintText: 'email'
                ),
                
              ),
              const SizedBox(height: 20,),
               TextField(
                controller: context.watch<UserEnterProvider>().phonenumber,
                decoration: const InputDecoration(
                  hintText: 'phonenumber'
                ),
                
              ),
              const SizedBox(height: 20,),
               TextField(
                controller: context.watch<UserEnterProvider>().password,
                decoration: const InputDecoration(
                  hintText: 'password'
                ),
                
              ),
              const SizedBox(height: 30,),
              GestureDetector(
                onTap: () {
                  context.read<UserEnterProvider>().toPostUsers(context);

                },
                child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    color: Colors.black
                  ),
                  child: const Center(child: Text('submit',style: TextStyle(color: Colors.white),)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}