import 'package:flutter/foundation.dart';
import 'package:newsapp/model/category.dart';

List<CategoryModel> getCatogeries(){

  List<CategoryModel> category=[];
  CategoryModel categoryModel = new CategoryModel();

  categoryModel.categoryName='Business';
  categoryModel.image="assets/images/business.jpg";
  category.add(categoryModel);
  categoryModel = new CategoryModel();

  categoryModel.categoryName='General';
  categoryModel.image="assets/images/general.jpg";
  category.add(categoryModel);
  categoryModel = new CategoryModel();

  categoryModel.categoryName='Health';
  categoryModel.image="assets/images/health.jpg";
  category.add(categoryModel);
  categoryModel = new CategoryModel();

  categoryModel.categoryName='Sports';
  categoryModel.image="assets/images/sport.jpg";
  category.add(categoryModel);
  categoryModel = new CategoryModel();

  return category;
}