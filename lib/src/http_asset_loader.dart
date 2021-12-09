//
//
//
//
import 'dart:convert';
import 'dart:developer';
import 'dart:ui';

import 'package:http/http.dart' as http;

import 'asset_loader.dart';

class HttpAssetLoader extends AssetLoader {
  @override
  Future<Map<String, dynamic>> load(String path, Locale locale) async {
    log('easy localization loader: load http $path');
    try {
      return http
          .get(Uri.parse(path))
          .then((response) => json.decode(response.body.toString()));
    } catch (e) {
      //Catch network exceptions
      return Future.value();
    }
  }
}
