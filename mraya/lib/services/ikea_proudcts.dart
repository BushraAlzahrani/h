import 'dart:convert';
import '../Models/proudct_model.dart';
import 'package:http/http.dart' as http;

class IkeaProudctsService {

  static const String baseURL = 'https://64146f3836020cecfda8843f.mockapi.io/proudcts';

  static Future<List<ProudctModel>> getArticles() async {
    var response = await http.get(Uri.parse('${baseURL}'));
    var products = <ProudctModel>[];

    if (response.statusCode == 200) {
       var data = jsonDecode(response.body.toString());

      print(response.statusCode);
      for (var i in data) {
        products.add(ProudctModel.fromJson(i));
      }
      return products;
    } else {
      return throw Exception('Failed to load products');
    }
  }
}