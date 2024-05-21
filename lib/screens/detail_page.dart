import 'package:api_1_1_news/model/main_model.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  MainModel mainModel;
  DetailPage({super.key, required this.mainModel});

  @override
  Widget build(BuildContext context) {
    print('mainModel ${mainModel.articles!.length}');
    return Scaffold(
      body: Column(
        children: [
          Container(
            child: Text('ddd'),
           
          )
        ],
        ),
    );
  }
}