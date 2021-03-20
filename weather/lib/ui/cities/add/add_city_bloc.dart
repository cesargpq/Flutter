import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:weather/common/debounced.dart';
import 'package:weather/data/data_constantas.dart';
import 'package:weather/data/repository/store_implement.dart';
import 'package:weather/data/repository/store_repository.dart';
import 'package:weather/model/city.dart';
import 'package:http/http.dart' as http;
import 'package:weather/model/weather.dart';

class AddCityBloc extends ChangeNotifier{
  final debouncer = Debouncer();
  final StorageRepository storage = StoreImp();
  List<City> cities = [];
  bool loading = false;

  String errorMessage;
  void onChangedText(String text) {
    debouncer.run(() {
      if (text.isNotEmpty) requestSearch(text);
    });
  }

  void requestSearch(String text) async {
    this.loading = true;
    notifyListeners();
    await Future.delayed(const Duration(seconds: 3));
      final url = '${api}search/?query=$text';
      final response = await http.get(url);
      final data = jsonDecode(response.body) as List;
      loading=false;
      cities =data.map((e) => City.fromMap(e)).toList();
      notifyListeners();
       
  }

  void addCity(City city) async{
    //TODO CONSULTAR SI ESTÁ PERSISTIDA
    loading=true;
    notifyListeners();
    final url = '$api${city.id}';
    final response = await http.get(url);
    final data = jsonDecode(response.body); 
    final listData = data['consolidated_weather'] as List;
    final weathers= listData.map((e) => Weather.fromJson(e)).toList();
    final newCity= city.fromWeathers(weathers);

    try{
      await storage.saveCity(newCity);
      errorMessage=null;
    }catch(ex){
      errorMessage=ex.message;
      print(ex);
    }
    loading=false;
    notifyListeners();
  }
}