import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'package:flutter_application_1/models/imagemodel.dart';

class ImageRepo {
  Future<List<PixelfromImage>> getNetworkImages() async {
    try {
      //this api call will not work because this api site no longer exists
      var endpointUrl = Uri.parse('https://pixelford.com/api2/images');

      final response = await http.get(endpointUrl);

      if (response.statusCode == 200) {
        final List<dynamic> decodedList = jsonDecode(response.body) as List;

        final List<PixelfromImage> _imageList = decodedList.map((listItem) {
          return PixelfromImage.fromJson(listItem);
        }).toList();

        print(_imageList[0].urlFullSize);
        return _imageList;
      } else {
        // custom exception
        throw Exception("API call not successful");
      }
    } on SocketException {
      throw Exception('No internet connection');
    } on HttpException {
      throw Exception('Could not retrieve the images!');
    } on FormatException {
      throw Exception('Bad response format');
    } catch (e) {
      throw Exception('Unknown error');
    }
  }
}
