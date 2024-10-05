import 'package:flutter/material.dart';
import 'package:jokes_app/model/joke_model.dart';
import 'package:jokes_app/services/api_services.dart';
import 'package:jokes_app/static/jokes_category_data.dart';

class JokeProvider extends ChangeNotifier{

  String _currentCategory = JokesCategoryData.categoryData[0]['name'];
  String get currentCategory => _currentCategory;

  

  List<Joke> _jokes = [];
  List<Joke> get jokes => _jokes;

  setCurrentCategory(String categoryName){

    _currentCategory = categoryName;
    getJokes();
    notifyListeners();
  }

  getJokes()async {

   _jokes =  await ApiServices().getJokesByCategory(_currentCategory);

   notifyListeners();




  }








}