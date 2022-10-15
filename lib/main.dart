import 'package:flutter/material.dart';
import 'package:movie_model_db/pages/movie_list.dart';

import 'pages/movie_details.dart';
import 'pages/new_movie_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: MovieListPage.routeName,
      routes: {
        MovieListPage.routeName:(context)=>MovieListPage(),
        AddNewMoviePage.routeName:(context)=>AddNewMoviePage(),
        MovieDetailsPage.routeName:(context)=>MovieDetailsPage(),
      },
    );
  }
}


