import 'dart:convert';

import 'package:dio/dio.dart';

class AdoptionDataProvider {
  final dio = Dio();

  Future<Map<String, dynamic>?> getAdoptionJson() async {
    String? accessToken;

    try {
      Map<String, dynamic> dataAccess = {
        'grant_type': 'client_credentials',
        'client_id': 'KUcDfEEORbmog4jkiucgMjLNdkDqz90Vh0CegCipxpJZmSSt5r',
        'client_secret': '9tJYReLbSdoKSdRlNt3SGvsFfJcZIoP5hYU1QQOR',
      };
      Response responseToken = await dio.post(
        'https://api.petfinder.com/v2/oauth2/token',
        data: dataAccess,
      );
      if (responseToken.statusCode != 200) {
        throw ("Error occurred");
      }
      accessToken = responseToken.data['access_token'];
      dio.options.headers['Authorization'] = 'Bearer $accessToken';
      Response response = await dio.get(
        'https://api.petfinder.com/v2/animals',
      );
      if (response.statusCode != 200) {
        throw ("Error occurred");
      }

      return response.data as Map<String, dynamic>;
    } catch (e) {
      throw (e.toString());
    }
  }
}
