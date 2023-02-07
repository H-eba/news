import 'package:flutter/material.dart';
import 'package:untitled/main.dart';
import 'package:untitled/network/remot/TabsResponce.dart';

class TabWidget extends StatelessWidget {
  Sources tab;  ///my tab <<class
  bool isSelected;
  TabWidget({ required this.tab, required this.isSelected});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.green),
          borderRadius: BorderRadius.circular(13),
          color: isSelected ? Colors.green : Colors.transparent),
      child: Text(
        tab.name ?? '',
        style: TextStyle(
            fontSize: 15, color: isSelected ? Colors.white : Colors.green),
      ),
    );
  }
}
