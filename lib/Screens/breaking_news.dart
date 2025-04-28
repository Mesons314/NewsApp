import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/Screens/articles_screen.dart';

import '../model/SliderModel.dart';
import '../services/slider.dart';

class BreakingNews extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return breakingNews();
  }
}

class breakingNews extends State<BreakingNews> {
  List<SliderModel> slider = [];
  bool _loading = true; // Loading flag to show the progress indicator

  @override
  void initState() {
    super.initState();
    getSlider();
  }

  getSlider() async{
    Sliders sliders = Sliders();
    await sliders.getSliders();
    slider = sliders.sliders;
    setState(() {
      _loading = false;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Breaking News'),
      ),
      body: _loading
          ? Center(
          child: CircularProgressIndicator()) // Show loading indicator while fetching data
          : Container(
            child: ListView.builder(
                    itemCount: slider.length, // Properly pass itemCount
                    itemBuilder: (context, index) {
                      return Container(
                        padding: EdgeInsets.only(bottom: 10,left: 5,right: 5),
                        child: InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> ArticleView(blogUrl: slider[index].url!)));
                          },
                          child: Material(
                            borderRadius: BorderRadius.circular(10),
                            elevation: 3,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8),
                              child: Container(
                                height: MediaQuery.of(context).size.height/3.0,
                                width: MediaQuery.of(context).size.width/1.9,
                                child: Column(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.only(top: 6),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(12),
                                        child: CachedNetworkImage(
                                          imageUrl: slider[index].urlToImage!,
                                          height: 165,
                                          width: MediaQuery.of(context).size.width/0.9,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(top: 5),
                                      width: MediaQuery.of(context).size.width/0.9,
                                      child: Text(slider[index].title!,
                                      maxLines: 2,
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold
                                      ),
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(top: 3),
                                      width: MediaQuery.of(context).size.width/0.9,
                                      child: Text(slider[index].description!,
                                      maxLines: 3,
                                      style: TextStyle(
                                        fontSize: 12
                                      ),),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
            ),
          ),
    );
  }
}
