// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:api_1_1_news/screens/detail_page.dart';

import '../model/main_model.dart';

class HomePage extends StatefulWidget {

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String searchQueryUser = "USA" ;

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 20),
                  child: TextField(
                    onTap: (){

                      if(searchController.text.isNotEmpty){
                        searchQueryUser = searchController.text;
                      }

                      setState(() {
                        
                      });
                    },
                    controller: searchController,
                    decoration: InputDecoration(
                        border:  OutlineInputBorder(borderRadius: BorderRadius.circular(21)),
                        suffixIcon: const Icon(Icons.search_rounded),
                        hintText: 'Search here '),
                  ),
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: FutureBuilder(
                      future: getAllNews(searchQueryUser.toString()),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return const Center(child: CircularProgressIndicator());
                        }
                            
                        if (snapshot.hasError) {
                          // print('Error : $snapshot');
                          return Center(child: Text('Error : ${snapshot.error}'));
                        }
                            
                        if (snapshot.hasData) {
                          MainModel allNews = snapshot.data!;
                            
                          return snapshot.data != null
                              ? ListView.builder(
                                  itemCount: allNews.articles!.length,
                                  itemBuilder: (context, index) {
                                    return SizedBox(
                                      height: 200,
                                      child: Card(
                                        color: Colors.amberAccent.shade100,
                                        child: Column(
                                          children: [
                                            ListTile(
                                              leading: Image.network(allNews.articles![index].urlToImage.toString()),
                                              title: Text(allNews.articles![index].title.toString(),maxLines: 2),
                                              subtitle: Text(
                                                allNews.articles![index].content.toString(),
                                                maxLines: 2,
                                              ),
                                            ),
                                            Container(
                                              padding: const EdgeInsets.only(right: 20),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.end,
                                                children: [
                                                  ElevatedButton(
                                                      onPressed: () {
                                                        Navigator.push(context, MaterialPageRoute(
                                                            builder: (context)=> DetailPage(newsModel: allNews.articles![index])));
                                                      },
                                                      child: const Text('Read More')),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    );
                                  }): const Center(child: Text('No data'));
                        }
                        return Container();
                      }),
                ),
              ],
            ),
          )),
    );
  }

  Future<MainModel?> getAllNews(String searchQuery) async {
    MainModel? news;
    
    String baseUrl = "https://newsapi.org/v2/everything?q=$searchQuery&apiKey=61e8994af44d470785c129a32a8851c1";

    http.Response response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      var mData = response.body;
      var rawData = jsonDecode(mData);
      news = MainModel.fromJson(rawData);
    }
    return news;
  }
}
