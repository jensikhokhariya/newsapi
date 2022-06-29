import 'package:flutter/material.dart';
import 'package:newsapi/screen/category.dart';
import 'package:newsapi/screen/news.dart';
import 'package:newsapi/screen/sumber.dart';

class Bottem extends StatefulWidget {
  const Bottem({Key? key}) : super(key: key);

  @override
  State<Bottem> createState() => _BottemState();
}

class _BottemState extends State<Bottem> {
  int select = 0;
  List sel = [
    News(),
    Category(),
    Sumber(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: sel[select],
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_rounded),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.category),
              label: "category",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.vpn_lock_outlined),
              label: "Sumber",
            ),
          ],
          currentIndex: select,
          selectedItemColor: Colors.purple,
          onTap: onitem,
          iconSize: 30,
          backgroundColor: Colors.purple.shade50,
          elevation: 5,
        ),
      ),
    );
  }

  void onitem(int index) {
    setState(() {
      select = index;
    });
  }
}
