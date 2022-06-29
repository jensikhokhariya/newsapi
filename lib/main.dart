import 'package:flutter/material.dart';
import 'package:newsapi/screen/bottem.dart';
import 'package:newsapi/screen/category.dart';
import 'package:newsapi/screen/news.dart';
import 'package:newsapi/screen/news2.dart';
import 'package:newsapi/screen/second.dart';
import 'package:newsapi/screen/sumber.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'bottam',
      routes: {
        '/':(context)=>News(),
        'new':(context)=>News2(),
        'cate':(context)=>Category(),
        'sum':(context)=>Sumber(),
        'bottam':(context)=>Bottem(),
        'page2':(context)=>Second(),
      },
    ),
  );
}