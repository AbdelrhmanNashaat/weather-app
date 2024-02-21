import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_models.dart';

class WeatherService {
  Future<WeatherModel> getWeather({required String cityName}) async {
    try {
      Response response = await Dio().get(
          'http://api.weatherapi.com/v1/forecast.json?key=e504337222444a7498f81133221612&q=$cityName&days=1');
      WeatherModel weatherModel = WeatherModel.fromjson(response.data);
      return weatherModel;
    } on DioException catch (e) {
      final String errorMessage =
          e.response?.data['error']['message'] ?? 'Dio Exception';
      log(e.toString());
      return throw Exception(errorMessage);
    } catch (e) {
      log(e.toString());
      return throw Exception(
          'There was an error getting the weather data. Please try again.');
    }
  }
}
