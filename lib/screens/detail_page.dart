
import 'package:api_1_1_news/model/news_model.dart';
import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';

class DetailPage extends StatelessWidget {
  NewsModel newsModel;
  DetailPage({super.key, required this.newsModel});

  @override
  Widget build(BuildContext context) {

    // DateFormat dateFormat = DateFormat.yMMMMd();
    
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Center(
                  child: Image.network(newsModel.urlToImage.toString(),fit: BoxFit.cover,)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  Text('${newsModel.title}', style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                  const SizedBox(height: 20),
                  Text('${newsModel.content}', style: const TextStyle(fontSize: 20)),
                  const SizedBox(height: 10),
                  Text('${newsModel.description}', style: const TextStyle(fontSize: 20)),
                  const SizedBox(height: 20),
                  Text('Source: ${newsModel.source!.name}', style: const TextStyle(fontSize: 20)),
                  Text('Author: ${newsModel.author}', style: const TextStyle(fontSize: 20)),
                ],
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}
