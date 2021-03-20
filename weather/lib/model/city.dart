import 'package:weather/model/weather.dart';

class City {
  final String title;
  final int id;
  final List<Weather> weathers;
  City({this.title, this.id, this.weathers});

  Map<String, dynamic> toJson() => {
        "title": title,
        "woeid": id,
        "weathers": weathers.map((e) => e.toJson()).toList(),
  };

//Constructor de fábrica
  factory City.fromMap(Map<String, dynamic> map) {
    return City(
      id: map['woeid'],
      title: map['title'],
    );
  }
  City fromWeathers(List<Weather> weathers) {
    return City(
      id: id,
      title: title,
      weathers: weathers,
    );
  }
}
