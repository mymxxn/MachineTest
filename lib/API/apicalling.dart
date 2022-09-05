import 'dart:convert';

import 'package:machine_test/constant.dart';
import 'package:machine_test/model/pixabaymodel.dart';
import 'package:http/http.dart' as http;

class Services {
 static Future<PixabayModel?> getimages() async {
    final resp = await http.get(Uri.parse(
        "https://pixabay.com/api/?key=26258716-773289a97f22d89a59fa905ff&q={${Getss.getsearch()}}&image_type=photo"));

    if (resp.statusCode == 200) {
      final decoded = jsonDecode(resp.body);

      return PixabayModel.fromJson(json.decode(resp.body));
    } else {
      throw Exception('Failed to load data');
    }
  }
}
  