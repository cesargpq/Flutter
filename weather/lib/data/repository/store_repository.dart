import 'package:weather/model/city.dart';

abstract class StorageRepository{

  void saveCity(City city);
  Future<List<City>> getCities();
}