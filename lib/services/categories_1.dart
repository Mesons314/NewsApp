import 'dart:convert';
import 'package:newsapp/model/category.dart';
import 'package:http/http.dart' as http;

class Categories {
  List<CategoryModel1> category = [];

  Future<void> getCategories1(String categoryName) async {
    String url = 'https://newsapi.org/v2/top-headlines?country=us&category=$categoryName&apiKey=e34650a65a9241d7922e8e08ef1b18ea';
    var response = await http.get(Uri.parse(url));
    var jsonData = jsonDecode(response.body);
    print("Response data: $jsonData");

    if (jsonData['status'] == 'ok') {
      for (var element in jsonData['articles']) {
        if (element['urlToImage'] != null &&
            element['title'] != null &&
            element['url'] != null &&
            await isImageAccessible(element['urlToImage'])) {
          CategoryModel1 categoryModel = CategoryModel1.fromJson(element);
          category.add(categoryModel);
        }
      }
    } else {
      print('Error: ${jsonData['message']}');
    }
  }
}
Future<bool> isImageAccessible(String imageUrl) async {
  try {
    var res = await http.head(Uri.parse(imageUrl));
    return res.statusCode == 200;
  } catch (e) {
    return false;
  }
}
