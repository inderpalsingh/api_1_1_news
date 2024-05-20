import 'news_model.dart';

class MainModel{
  String status;
  num totalResults;
  List<NewsModel> articles;
  
  MainModel({required this.status, required this.totalResults, required this.articles});
  
  
  factory MainModel.fromJson(Map<String, dynamic> json){
    return MainModel(
        status: json['status'],
        totalResults: json['totalResults'],
        articles: json['articles']
    );
  }
}