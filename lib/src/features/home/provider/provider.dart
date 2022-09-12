import 'package:fininfocom_assignment/src/model/person_model.dart';
import 'package:fininfocom_assignment/src/services/firebase/firebase.dart';
import 'package:flutter/cupertino.dart';

class HomeProvider extends ChangeNotifier {
  HomeProvider() {
    fetchData();
  }
  bool isLoading = false;

  List<PersonModel> persons = [];

  bool networkError = false;

  bool error = false;



  void setLoading() {
    isLoading = true;
    networkError = false;
    error = false;
    notifyListeners();
  }

  void setNetworkError() {
    networkError = true;
    isLoading = false;
    error = false;
    notifyListeners();
  }

  void setError() {
    error = true;
    networkError = false;
    isLoading = false;
    notifyListeners();
  }

  void fetched() {
    isLoading = false;
    networkError = false;
    error = false;
    notifyListeners();
  }

  void sortByName(){
    setLoading();
    persons.sort((a, b) => a.name.toString().compareTo(b.name.toString()),);
    fetched();
  }

  void sortByCity(){
    setLoading();
    persons.sort((a, b) => a.city.toString().compareTo(b.city.toString()),);
    fetched();
  }

  void sortByAge(){
    setLoading();
    persons.sort((a, b) => a.age!.compareTo(b.age!),);
    fetched();
  }

  void fetchData() async {
    setLoading();
    final response = await Firebase().fetchUsers();
    if (response is List<PersonModel>) {
      persons = response;
      fetched();
    } else if (response == 'Connection Refused !') {
      setNetworkError();
    } else {
      setError();
    }
  }
}
