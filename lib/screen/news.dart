import 'package:flutter/material.dart';
import 'package:newsapi/screen/category.dart';
import 'package:newsapi/screen/model.dart';
import 'package:newsapi/screen/newsclass.dart';
import 'package:newsapi/screen/sumber.dart';

class News extends StatefulWidget {
  const News({Key? key}) : super(key: key);

  @override
  State<News> createState() => _NewsState();
}

class _NewsState extends State<News> {
  int select = 0;
  String data = "";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            children: [
              Expanded(
                child: FutureBuilder<Status>(
                  future: NewsData().getnewsData(data),
                  builder: (context, AsyncSnapshot snapshot) {
                    if (snapshot.hasError) {
                      return Center(child: Text("${snapshot.error}"));
                    } else if (snapshot.hasData) {
                      Status s1 = snapshot.data;
                      return Padding(
                        padding: const EdgeInsets.all(8),
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                Container(
                                  height: 200,
                                  width: double.infinity,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.network(
                                      "${s1.article![0].urltoimage}",
                                      fit: BoxFit.cover,
                                      height: 300,
                                      width: 100,
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 200,
                                  width: double.infinity,
                                  padding: EdgeInsets.only(right: 10,left: 10,bottom: 5),
                                  alignment: Alignment.bottomCenter,
                                  child: Text("${s1.article![0].title}",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
                                ),
                              ],
                            ),
                            Expanded(
                              child: ListView.builder(
                                itemBuilder: (context, index) {
                                  return Card(
                                    shadowColor: Colors.pink,
                                    elevation: 30,
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.pushNamed(context, 'new',
                                            arguments: s1.article![index]);
                                      },
                                      child: ListTile(
                                        title:
                                            Text("${s1.article![index].title}"),
                                        subtitle: Text(
                                            "${s1.article![index].author}"),
                                        trailing: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: Image.network(
                                            "${s1.article![index].urltoimage}",
                                            fit: BoxFit.cover,
                                            height: 300,
                                            width: 100,
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                                itemCount: s1.article!.length,
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                    return Center(child: CircularProgressIndicator());
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
