import 'package:flutter/material.dart';
import 'package:jokes_app/providers/joke_provider.dart';
import 'package:jokes_app/screens/jokes_view.dart';
import 'package:jokes_app/static/jokes_category_data.dart';
import 'package:provider/provider.dart';

class JokesHome extends StatelessWidget {
  const JokesHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text("Jokes App", style: TextStyle(color: Colors.white),),
        centerTitle: true,
      ),

      body: ListView.builder(

        itemCount: JokesCategoryData.categoryData.length,
        
        itemBuilder: (context, index){


        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            onTap: (){

              Provider.of<JokeProvider>(context, listen: false).setCurrentCategory(JokesCategoryData.categoryData[index]['name']);

              Navigator.push(context, MaterialPageRoute(builder: (_)=> JokesViewScreen()));

            },
            leading: CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage(JokesCategoryData.categoryData[index]['imagePath'])),
            title: Text("${JokesCategoryData.categoryData[index]['name'] } Jokes"),
          ),
        );
      }),
    );
  }
}