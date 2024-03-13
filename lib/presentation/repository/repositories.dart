import 'package:dio/dio.dart';
import 'package:flutter_final_project/presentation/dio_settings.dart';
import 'package:flutter_final_project/presentation/model/weather_model.dart';

class Repositories {
  int counter = 0;

  int incrementCounter() {
    if (counter < 10) {
      counter++;
    }
    return counter;
  }

  int decrementCounter() {
    if (counter > 0) {
      counter--;
    }
    return counter;
  }

  Dio dio = DioSettings().dio;
  Future<WeatherModel> getWeather() async {
    final Response response = await dio.get(
        "https://api.openweathermap.org/data/2.5/weather?",
        queryParameters:{
          "lat":42.882004,
          "lon":74.582748,
          "appid":"65b23f22ef314a828ef75c5ef018232d",
          "units":"metric"
        } );
    return WeatherModel.fromJson(response.data);
  }
}
