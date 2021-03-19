import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:weather/common/debounced.dart';
import 'package:weather/common/header_widget.dart';
import 'package:http/http.dart' as http;


class AddCityPage extends StatefulWidget {
  @override
  _AddCityPageState createState() => _AddCityPageState();
}

class _AddCityPageState extends State<AddCityPage> {
  final debouncer = Debouncer();

  void onChangedText(String text) {
    debouncer.run(() {
      print(text);
      requestSearch(text);
    });
  }

  void requestSearch(String text) async{
    final url = 'https://www.metaweather.com/api/location/search/?query=angeles';
    final response =  await http.get(url);
    final data= jsonDecode(response.body);
    print(data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              HeaderWidget(title: 'Agregar Ciudad'),
              const SizedBox(
                height: 15,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: TextField(
                  onChanged: onChangedText,
                  decoration: InputDecoration(
                      focusedBorder: InputBorder.none,
                      border: InputBorder.none,
                      filled: true,
                      hintText: 'Buscar ciudad',
                      fillColor: Colors.grey[200],
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.grey,
                      )),
                ),
              ),
            ],
          )),
    );
  }
}
