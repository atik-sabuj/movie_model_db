import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:movie_model_db/models/movie_model.dart';

import '../models/movie_model.dart';
import '../utils/helper_functions.dart';
import '../utils/utils.dart';

class AddNewMoviePage extends StatefulWidget {
  static const String routeName='/movie_add';

  const AddNewMoviePage({Key? key}) : super(key: key);

  @override
  State<AddNewMoviePage> createState() => _AddNewMoviePageState();
}

class _AddNewMoviePageState extends State<AddNewMoviePage> {

  final _fromKey=GlobalKey<FormState>();
  final nameController = TextEditingController();
  final descriptionController = TextEditingController();
  final budgetController = TextEditingController();
  String? selectedType;
  DateTime? releaseDate;
  String? imagePath;




  @override
  void dispose() {
    nameController.dispose();
    descriptionController.dispose();
    budgetController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add New Movie'),
        actions: [
          IconButton(
              onPressed: onSaved,
              icon: Icon(Icons.save))
        ],
      ),
      body: Form(
          key: _fromKey,
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(
                      hintText: 'Enter Name',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                          borderSide:
                          BorderSide(color: Colors.blue, width: 1))),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'This field must not be empty';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: descriptionController,
                  decoration: InputDecoration(
                      hintText: 'Enter Description',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                          borderSide:
                          BorderSide(color: Colors.blue, width: 1))),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'This field must not be empty';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: budgetController,
                  decoration: InputDecoration(
                      hintText: 'Enter budget',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                          borderSide:
                          BorderSide(color: Colors.blue, width: 1))),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'This field must not be empty';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6),
                            borderSide:
                            BorderSide(color: Colors.blue, width: 1))),
                    hint: Text('Select Movie Type'),
                    items: movieTypes
                        .map((e) => DropdownMenuItem(value: e, child: Text(e!)))
                        .toList(),
                    value: selectedType,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please select a type';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      setState(() {
                        selectedType = value;
                      });
                    }),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton.icon(
                      onPressed: selectDate,
                      icon: const Icon(Icons.calendar_month),
                      label: const Text('Select Release Date'),
                    ),
                    Text(releaseDate == null
                        ? 'No date chosen'
                        : getFormattedDate(releaseDate!, 'dd/MM/yyyy'))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    imagePath == null
                        ? const Icon(
                      Icons.movie,
                      size: 100,
                    )
                        : Image.file(
                      File(imagePath!),
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                    TextButton.icon(
                      onPressed: getImage,
                      icon: const Icon(Icons.photo),
                      label: const Text('Select from Gallery'),
                    )
                  ],
                ),
              ),
            ],
          )),
    );
  }
  void selectDate() async {
    final selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (selectedDate != null) {
      setState(() {
        releaseDate = selectedDate;
      });
    }
  }

  void getImage() async {
    final file = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (file != null) {
      setState(() {
        imagePath = file.path;
      });
    }
  }

  void onSaved() {
    if(_fromKey.currentState!.validate()){
      final movieModel=MovieModel(
        name: nameController.text,
        image: imagePath!,
        budget: int.parse(budgetController.text),
        description: descriptionController.text,
        release_date: getFormattedDate(releaseDate!, 'dd/MM/yyyy'),
        type: selectedType!,
        rating: 4.4,
      );
      print(movieModel.toString());

    }
  }
}
