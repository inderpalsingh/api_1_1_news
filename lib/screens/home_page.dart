import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../model/main_model.dart';

class HomePage extends StatelessWidget {
  MainModel? allNewsList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: allNewsList !=null ? FutureBuilder(
          future: getAllNews(),
          builder: (context, snapshot) {
            if(snapshot.connectionState==ConnectionState.waiting){
              return const Center(child: CircularProgressIndicator());
            }

            if(snapshot.hasError){
              print(snapshot);
              return Center(child: Text('Error : ${snapshot.error}'));
            }

            if(snapshot.hasData){
              MainModel allNews = snapshot.data!;
       
              return ListView.builder(
                itemCount: allNews.articles!.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(21)),
                          suffixIcon: const Icon(Icons.search_rounded),
                          hintText: 'Search news ...'
                        ),
                      ),
                      Text(allNews.articles!.length.toString())
                    ],
                  );
              });
            }
            return Container();
          }

        ) : Center(child: Text('No News'),),
      ),
    );
  }


  Future<MainModel?> getAllNews()async{
    MainModel? news;
    const String baseUrl = "https://newsapi.org/v2/everything?q=bitcoin&apiKey=61e8994af44d470785c129a32a8851c1";

    http.Response response = await http.get(Uri.parse(baseUrl));
    if(response.statusCode==200){
      var mData = response.body;
      var rawData = jsonDecode(mData);
      print(rawData);
      news = MainModel.fromJson(rawData);
    }
    return news;
  }
}
