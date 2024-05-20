import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../model/main_model.dart';

class HomePage extends StatelessWidget {
  MainModel? news;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: FutureBuilder(
          future: getAllNews(),
          builder: (context, snapshot) {
            return ListView.builder(
              itemCount: news!.articles.length,
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
                    Text('data')
                  ],
                );
            });
          },
        
        ),
      ),
    );
  }


  Future<MainModel?> getAllNews()async{
    const String baseUrl = "https://newsapi.org/v2/everything?q=bitcoin&apiKey=61e8994af44d470785c129a32a8851c1";

    http.Response response = await http.get(Uri.parse(baseUrl));
    if(response.statusCode==200){
      var mData = response.body;
      var rawData = jsonDecode(mData);
      news = MainModel.fromJson(rawData);
    }
  }
}
