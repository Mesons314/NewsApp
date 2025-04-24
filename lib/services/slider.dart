import 'package:flutter/foundation.dart';
import 'package:newsapp/model/category.dart';

import '../model/SliderModel.dart';

List<SliderModel> getSlider(){

  List<SliderModel> slider=[];
  SliderModel sliderModel = new SliderModel();

  sliderModel.name='Business';
  sliderModel.image="assets/images/business.jpg";
  slider.add(sliderModel);
  sliderModel = new SliderModel();

  sliderModel.name='General';
  sliderModel.image="assets/images/general.jpg";
  slider.add(sliderModel);
  sliderModel = new SliderModel();

  sliderModel.name='Sports';
  sliderModel.image="assets/images/sport.jpg";
  slider.add(sliderModel);
  sliderModel = new SliderModel();

  sliderModel.name='Health';
  sliderModel.image="assets/images/general.jpg";
  slider.add(sliderModel);
  sliderModel = new SliderModel();

  sliderModel.name='General';
  sliderModel.image="assets/images/general.jpg";
  slider.add(sliderModel);
  sliderModel = new SliderModel();


  return slider;
}