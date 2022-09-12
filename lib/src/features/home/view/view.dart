import 'package:fininfocom_assignment/src/features/enter_user.dart/user_enter_view.dart';
import 'package:fininfocom_assignment/src/features/home/provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeProvider homeProvider = context.watch<HomeProvider>();
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: GestureDetector(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => const UserEnterView())),
              child: const Text(
                'Persons Datas',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            actions: [
              IconButton(
                onPressed: (() {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return CupertinoActionSheet(
                        actions: <CupertinoActionSheetAction>[
                          CupertinoActionSheetAction(
                            onPressed: () {
                              homeProvider.sortByName();
                              Navigator.of(context).pop();
                            },
                            child: const Text('Sort by Name'),
                          ),
                          CupertinoActionSheetAction(
                              onPressed: () {
                                homeProvider.sortByCity();
                                Navigator.of(context).pop();
                              },
                              child: const Text('Sort by City')),
                          CupertinoActionSheetAction(
                              onPressed: () {
                                homeProvider.sortByAge();
                                Navigator.of(context).pop();
                              },
                              child: const Text('Sort by Age')),
                          CupertinoActionSheetAction(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text('Close'),
                          )
                        ],
                      );
                    },
                  );
                }),
                icon: const Icon(
                  Icons.sort,
                  size: 30,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          body: ui(homeProvider)),
    );
  }

  Widget ui(HomeProvider homeProvider) {
    if (homeProvider.networkError == true) {
      return Center(
        child: Column(children: [
          const Text(
            'Connection Refused !',
            style: TextStyle(
                color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),
          ),
          InkWell(
            onTap: () => homeProvider.fetchData(),
            child: const SizedBox(
              height: 50,
              width: 100,
              child: ColoredBox(
                color: Colors.black,
                child: Center(
                  child: Text(
                    'Retry !',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          )
        ]),
      );
    }
    if (homeProvider.isLoading == true) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    if (homeProvider.error == true) {
      return const Center(
        child: Text(
          'Something went wrong !',
          style: TextStyle(
              color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),
        ),
      );
    }
    return ListView.separated(
      itemCount: homeProvider.persons.length,
      shrinkWrap: true,
      separatorBuilder: (BuildContext context, int index) {
        return const Divider();
      },
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text(
            homeProvider.persons[index].name!,
            style: const TextStyle(fontSize: 20),
          ),
          subtitle: Text(
            homeProvider.persons[index].city!,
            style: const TextStyle(
              fontSize: 15,
            ),
          ),
          trailing: Text(
            homeProvider.persons[index].age!.toString(),
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        );
      },
    );
  }
}
