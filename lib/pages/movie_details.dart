import 'package:flutter/material.dart';

class MovieDetailsPage extends StatefulWidget {
  static const String routeName = '/movie_details';
  const MovieDetailsPage({Key? key}) : super(key: key);

  @override
  State<MovieDetailsPage> createState() => _MovieDetailsPageState();
}

class _MovieDetailsPageState extends State<MovieDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Movie Details Page'),),
    );
  }
}
