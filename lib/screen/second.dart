import 'package:flutter/material.dart';
import 'package:newsapi/screen/model.dart';
import 'package:newsapi/screen/newsclass.dart';

class Second extends StatefulWidget {
  const Second({Key? key}) : super(key: key);

  @override
  State<Second> createState() => _SecondState();
}

class _SecondState extends State<Second> {
  @override
  Widget build(BuildContext context) {
    String data=ModalRoute.of(context)!.settings.arguments as String;
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder<Status>(
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
    );
  }
}
