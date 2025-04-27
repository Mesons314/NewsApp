
import 'package:flutter/material.dart';
import 'package:newsapp/model/category.dart';
import 'package:newsapp/services/categories_1.dart';
import 'package:newsapp/widgets/trending_lists.dart';

class CategoryWise extends StatefulWidget{
  String name;
  CategoryWise({required this.name});
  @override
  State<StatefulWidget> createState() {
    return Category_News();
  }
}

class Category_News extends State<CategoryWise>{
  List<CategoryModel1> category1 = [];
  bool _load = true;

  @override
  void initState(){
    getCategories1();
    super.initState();
  }

  getCategories1() async {
    Categories categories = Categories();
    await categories.getCategories1(widget.name.toLowerCase());

    print("Response data for category: ${widget.name.toLowerCase()}");
    categories.category.forEach((cat) {
      print("Article: ${cat.title}, Image: ${cat.urlToImage}");
    });

    if (categories.category.isEmpty) {
      print("No articles found for this category.");
    } else {
      print("Articles found for ${widget.name.toLowerCase()}: ${categories.category.length}");
    }

    setState(() {
      category1 = categories.category;
      _load = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
      ),
      body: _load? Center(child: CircularProgressIndicator(),):
      Container(
        child: ListView.builder(shrinkWrap: true,
            itemCount: category1.length,
            itemBuilder: (context,index){
          return BlogTile(title: category1[index].title!,
              urlToImage: category1[index].urlToImage!,
              url: category1[index].url!
          );
        }),
      ),
    );
  }
}