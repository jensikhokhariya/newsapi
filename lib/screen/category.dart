import 'package:flutter/material.dart';

class Category extends StatefulWidget {
  const Category({Key? key}) : super(key: key);

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  String data = "business";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.only(top: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        Navigator.pushNamed(context, 'page2',arguments: data);
                        data = "business";
                      });
                    },
                    child: custombutton("business"),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        Navigator.pushNamed(context, 'page2',arguments: data);
                        data = "sports";
                      });
                    },
                    child: custombutton("sports"),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        Navigator.pushNamed(context, 'page2',arguments: data);
                        data = "technology";
                      });
                    },
                    child: custombutton("technology"),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        Navigator.pushNamed(context, 'page2',arguments: data);
                        data = "science";
                      });
                    },
                    child: custombutton("science"),
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    Navigator.pushNamed(context, 'page2',arguments: data);
                    data = "politics";
                  });
                },
                child: custombutton("politics"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget custombutton(String t1) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 10,
        shadowColor: Colors.purple,
        child: Container(
          height: 50,
          width: 100,
          alignment: Alignment.center,
          child: Text("$t1"),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: Colors.purple,
          ),
        ),
      ),
    );
  }
}
