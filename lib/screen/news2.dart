import 'package:flutter/material.dart';
import 'package:newsapi/screen/model.dart';

class News2 extends StatefulWidget {
  const News2({Key? key}) : super(key: key);

  @override
  State<News2> createState() => _News2State();
}

class _News2State extends State<News2> {
  @override
  Widget build(BuildContext context) {
    Article a1 = ModalRoute.of(context)!.settings.arguments as Article;
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.purple.shade100,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      height: 300,
                      width: 400,
                      child: ClipRRect(
                        child: Image.network(
                          "${a1.urltoimage}",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      height: 300,
                      width: 400,
                      padding: EdgeInsets.only(right: 10, left: 10),
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        "${a1.title}",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 23,
                            color: Colors.white),
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 600,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      ListTile(
                        title: Text(
                          "${a1.author}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Colors.black),
                        ),
                        subtitle: Text(
                          "${a1.source!.name}",
                          style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.normal,
                              color: Colors.black),
                        ),
                        trailing: Text(
                          "${a1.publishedAt}",
                          style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 15,
                              color: Colors.black),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "${a1.description}",
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 20,
                            color: Colors.black),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "${a1.content}",
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
