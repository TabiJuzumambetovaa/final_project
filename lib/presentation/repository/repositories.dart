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

  Future<WeatherModel> getWeather() async {
    Dio dio = DioSettings().dio;
    final Response response = await dio.get("weather", queryParameters: {
      "lat": 42.882004,
      "lon": 74.582748,
      "appid": "65b23f22ef314a828ef75c5ef018232d",
    });
    return WeatherModel.fromJson(response.data);
  }
}
