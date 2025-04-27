class SliderModel {
  String? author;
  String? title;
  String? urlToImage;
  String? url;
  String? description;
  String? content;

  SliderModel({
   this.url,this.urlToImage,this.title,this.description,this.author,this.content
});

  factory SliderModel.fromJson(Map<String,dynamic> json){
    return SliderModel(
      title: json['title'],
      description: json['description'],
      author: json['author'],
      urlToImage: json['urlToImage'],
      url: json['url'],
      content: json['content']
    );
  }
}