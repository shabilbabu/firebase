import 'dart:developer';

import 'package:fininfocom_assignment/src/features/user_display/user_display_provider.dart';
import 'package:fininfocom_assignment/src/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserDisplay extends StatelessWidget {
  const  UserDisplay({Key? key,}) : super(key: key);

  

  @override
  Widget build(BuildContext context) {
    context.read<UserDisplayProvider>().laodUsers(context);
    return SafeArea(
      child: Scaffold(
      
        appBar: AppBar(
          title: const Text('user display'),
        ),
        body: Consumer<UserDisplayProvider>(
          builder: (context, provider, _) {
            final users = provider.users;
            log('list in ${users.length}');
            return ListView.builder(
              itemCount: users.length,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children:  [
                    Text(users[index].username!,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20,),),
                SizedBox(height: 15,),
                Text(users[index].email!,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20,),),
                SizedBox(height: 15,),
                Text('phonenumber',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20,),),
                SizedBox(height: 15,),
                Text('password',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20,),),
                SizedBox(height: 15,),
                  ],
                );
              },
            );
          }
        ),
      ),
    );
  }
}