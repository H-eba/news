import 'package:flutter/material.dart';
import 'package:untitled/layout/news_screen/list_tab.dart';
import 'package:untitled/network/remot/TabsResponce.dart';

import 'package:untitled/network/remot/api_mamger.dart';

class HomeLayout extends StatelessWidget {
  static String routeName = 'home';

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.blue,
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/images/bc.png'),
          )),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text("News"),
        ),
        body: FutureBuilder<TabsResponce>(
          future: ApiManager.getTabs(),

          /// <<<
          builder: (_, snapshot) {
            if (snapshot.hasError) {
              return Text("error");
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else {
              return ListTab(snapshot.data!.source!);
              //ListTab(snapshot.data!.sources![0].name ?? "");
            }
          },
        ),
      ),
    );
  }
}
