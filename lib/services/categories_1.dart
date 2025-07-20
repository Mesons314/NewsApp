import 'dart:convert';
import 'package:newsapp/model/category.dart';
import 'package:http/http.dart' as http;

class Categories {
  List<CategoryModel1> category = [];

  Future<void> getCategories1(String categoryName) async {
    String url = 'https://newsapi.org/v2/top-headlines?country=us&category=$categoryName&apiKey=';
    var response = await http.get(Uri.parse(url));
    var jsonData = jsonDecode(response.body);
    print("Response data: $jsonData");

    if (jsonData['status'] == 'ok') {
      List<Future<void>> futures = [];
      for (var element in jsonData['articles']) {
        if (element['urlToImage'] != null) {
          futures.add(_processArticle(element));
        }
      }
      await Future.wait(futures);
    } else {
      print('Error: ${jsonData['message']}');
    }
  }
  Future<void> _processArticle(Map<String,dynamic> element) async{
      CategoryModel1 categoryModel1 = CategoryModel1.fromJson(element);
      category.add(categoryModel1);

  }
}


//
// Future<bool> isImageAccessible(String imageUrl) async {
//   try {
//     var res = await http.head(Uri.parse(imageUrl));
//     return res.statusCode == 200;
//   } catch (e) {
//     return false;
//   }
// }
