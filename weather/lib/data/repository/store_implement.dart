import 'dart:convert';

import 'package:weather/data/repository/store_repository.dart';
import 'package:weather/model/city.dart';
import 'package:shared_preferences/shared_preferences.dart';

const keyCities = 'cities';

class StoreImp extends StorageRepository {
  @override
  Future<List<City>> getCities() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final list = prefs.getStringList(keyCities);
    if (list != null && list.isNotEmpty) {
      final cities = list
          .map((e) => City.fromMap(
                jsonDecode(e),
              ))
          .toList();
    return cities;
    }
    return <City>[];
  }

  @override
  void saveCity(City city) async {
    final list=await getCities();
    
    for(City item in list){
      if(item.id==city.id){
        throw Exception('La ciudad ya existe');
      }
    }
    list.add(city);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList(keyCities, list.map((e) => jsonEncode(e.toJson())).toList());
  }
}
