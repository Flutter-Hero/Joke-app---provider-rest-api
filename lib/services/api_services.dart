
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:jokes_app/model/joke_model.dart';
class ApiServices{



  getJokesByCategory(String categoryName)async{

    List<Joke> allJokes = [];

    String url = "https://v2.jokeapi.dev/joke/${categoryName}?type=single&amount=10";
    Uri reqUri = Uri.parse(url);


   var response = await http.get(reqUri);

   if(response.statusCode == 200){

    print(response.body);


    var jsonResponse = jsonDecode(response.body)["jokes"];

    for (var joke in jsonResponse){

      Joke newJoke = Joke(joke:  joke['joke']);
      allJokes.add(newJoke);
    }
    




   }

   else {

    throw Exception("${response.statusCode} ${response.body}");


   }

   return allJokes;




  }
}