import 'package:flutter/material.dart';
import 'package:untitled/layout/news_screen/tab_details.dart';
import 'package:untitled/layout/news_screen/tab_widget.dart';
import 'package:untitled/network/remot/NewsResponse.dart';
import 'package:untitled/network/remot/api_mamger.dart';

import '../../network/remot/TabsResponce.dart';
class ListTab extends StatefulWidget {
List <Sources> sources ;

ListTab(this.sources);

  @override
  State<ListTab> createState() => _ListTabState();
}

class _ListTabState extends State<ListTab> {
int  selectedIndex=0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(

      length: widget.sources.length,
      child: Column (children: [
        TabBar(isScrollable: true,
            indicatorColor: Colors.transparent,
           padding: EdgeInsets.symmetric(vertical: 7),
           onTap:(index) {
              selectedIndex=index;
               setState((){});
           } ,
            tabs:widget.sources.map((tab) /// train sources to tab
            {
          return TabWidget(tab: tab, isSelected: selectedIndex==widget.sources.indexOf(tab));

        }).toList()

        ),
       FutureBuilder<NewsResponse>(
         future: ApiManager.getNews(widget.sources[selectedIndex].id!),
           builder: (context,snapshot){
           if (snapshot.connectionState==ConnectionState.waiting){
             return Center(child: CircularProgressIndicator());
           }
           if (snapshot.hasError){
             return (Text('error'));
           }
          else{
             var responce=snapshot.data!.articles??[];
             //snapshot.hasData;
             return Expanded(
               child: ListView.builder(itemCount: responce.length,
                   itemBuilder: (context,index){
                     return Text(responce[index].title??'');
                   }),
             );
           }
           })
      ],
    ),
    );
  }
}
