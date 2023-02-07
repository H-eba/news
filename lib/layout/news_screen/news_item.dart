import 'package:flutter/material.dart';
import 'package:untitled/network/remot/NewsResponse.dart';

class NewsItem extends StatelessWidget {
  Articles article;
  NewsItem({required this.article});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.all(7),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [

    Image.network(article.title??'hkljn;jpo'),
          SizedBox(
            height: 5,
          ),

          /*Text(
            article.author??'',
            textAlign: TextAlign.start,
            style: TextStyle(fontSize: 15, color: Colors.grey),
          ),
          SizedBox(height: 5,),
          Text(
            article.title??'',
            textAlign: TextAlign.end,
            style: TextStyle(fontSize: 15, color: Colors.grey),
          ),
          SizedBox(height: 5,),
          Text(
            article.publishedAt??'',
            textAlign: TextAlign.start,
            style: TextStyle(fontSize: 15, color: Colors.grey),
          ),*/


        ],
      ),
    );
  }
}
