
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/Screens/articles_screen.dart';
import 'package:newsapp/model/SliderModel.dart';
import 'package:newsapp/model/article_model.dart';
import 'package:newsapp/services/slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../model/static_cat_model.dart';
import '../services/cat_data.dart';
import '../services/news.dart';
import '../widgets/category.dart';
import '../widgets/trending_lists.dart';

class Home extends StatefulWidget{
  const Home({super.key});


  @override
  State<StatefulWidget> createState() {
    return _Home();
  }

}

class _Home extends State<Home>{

  List<CategoryModel> categories = [];
  List<SliderModel> slider = [];
  List<ArticleModel> articles = [];
  bool _loading = true;
  bool _loading1 = true;

  @override
  void initState(){
    categories = getCatogeries();
    getSlider();
    getNews();
    super.initState();

  }

int activeIndex = 0;

  getNews() async{
    News newsClass = News();
    await newsClass.getNews();
    print('Raw fetched articles: ${newsClass.news}');
    articles = newsClass.news;
    print('Articles loaded: ${articles.length}');
    setState(() {
      _loading = false;
    });
  }

  getSlider() async{
    Sliders sliders = Sliders();
    await sliders.getSliders();
    slider = sliders.sliders;
    setState(() {
      _loading1 = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('News App',
              style: TextStyle(
                  color: Colors.lightBlue,
              fontWeight: FontWeight.bold),)
        ],
      ),
        centerTitle: true,
      ),
      body: _loading? Center(child: CircularProgressIndicator()): SingleChildScrollView(
       child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Container(

            height: 80,
            margin: const EdgeInsets.only(left: 10,top: 10),

            child: ListView.builder(

              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
                itemCount: categories.length,
                itemBuilder: (context,index){
              return CategoryTile(
                  categories[index].categoryName,
                  categories[index].image
              );
            }),
          ),
          const SizedBox(

            height: 20,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 15,right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Breaking News',

                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.black,
                ),
                ),
                Text('View All',style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 14,
                    color: Colors.black),)
              ],
            ),
          ),
          _loading1? Center(child: CircularProgressIndicator(),):
          CarouselSlider.builder(itemCount: slider.length, itemBuilder: (context, index, realIndex){
            String? res = slider[index].urlToImage;
            String? res2 = slider[index].title;
            return buildImage(res!, index, res2!);
          }, options: CarouselOptions(
            height: 300,
            autoPlay: true,
            enlargeCenterPage: true,
            enlargeStrategy: CenterPageEnlargeStrategy.zoom,
            onPageChanged: (index,reason){
              setState(() {
                activeIndex = index;
              });
            }
          )
          ),
          Center(child: buildIndicator()),
          const SizedBox(
            height: 15,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 15,right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Trending News',
                  style: TextStyle( fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.black, ),
                ),
                Text('View All',style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 14,
                    color: Colors.black),
                )
              ],
            ),
          ),
          SizedBox(
            height: 14,
          ),
          Container(
            child:ListView.builder(
              physics: ClampingScrollPhysics(),
              shrinkWrap: true,
                itemCount: articles.length,
                itemBuilder: (context,index){
              return BlogTile(title: articles[index].title!,
                  urlToImage: articles[index].urlToImage!,
              url: articles[index].url!,);
            }),
          )
        ],
      ),
      )
    );
  }
  Widget buildImage(String image, int index, String name)=>InkWell(
    onTap: (){
      Navigator.push(context, MaterialPageRoute(builder: (context)=> ArticleView(blogUrl: slider[index].url!)));
    },
    child: Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      child: Stack(
        children: [
          ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: CachedNetworkImage(

            height: 250,
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width, imageUrl: image,
          ),
        ),
          Container(
            height: 80,
            margin: const EdgeInsets.only(top: 170),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(color: Colors.black26,
            borderRadius: BorderRadius.circular(12)),
            child: Center(
              child: Text(
                name,
              textAlign: TextAlign.center,
              style: const TextStyle(

                color: Colors.white,
                fontSize: 13,
                fontWeight: FontWeight.bold,
              ),
              ),
            ),
          )
        ]
      ),
    ),
  );

  Widget buildIndicator()=> AnimatedSmoothIndicator(
      activeIndex: activeIndex,
      count: 3,
      effect: const SlideEffect(dotHeight: 10,dotWidth: 10),
  );
}

