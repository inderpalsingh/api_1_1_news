import 'news_model.dart';

class MainModel{
  String? status;
  num? totalResults;
  List<NewsModel>? articles;

  MainModel({required this.status, required this.totalResults, required this.articles});


  factory MainModel.fromJson(Map<String, dynamic> json){

    List<NewsModel> getNewsList = [];

    for(Map<String, dynamic> eachNews in json['articles']){
      NewsModel newsModel = NewsModel.fromJson(eachNews);
      getNewsList.add(newsModel);
    }


    return MainModel(
        status: json['status'],
        totalResults: json['totalResults'],
        articles: getNewsList
    );
  }
}