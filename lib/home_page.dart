import 'dart:convert';

import 'package:api_practice/models/PostsModel.dart';
import 'package:api_practice/product_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<PostsModel> postList = [];
  dynamic PostMap;

  Future<List<PostsModel>> getPostApi() async {
    final response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      postList.clear();
      PostMap = data;
      for (Map i in data) {
        postList.add(PostsModel.fromJson(i));
      }
      return postList;
    } else {
      return postList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("API Practice"),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: getPostApi(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Text("Loading..!");
                } else {
                  return ListView.builder(
                    itemCount: postList.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                              builder: (context) => ProductPage(data:postList,Id:postList[index].id, data2:PostMap[index], ),
                          ));
                        },
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("ID : ${postList[index].id}",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold)),
                                //Text("ID : ${PostMap[index]['id']}",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold)),
                                SizedBox(height: 5),
                                Text("Title :",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.blue)),
                                SizedBox(height: 5),
                                Text(postList[index].title.toString()),
                                SizedBox(height: 5),
                                Text("Description :",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.blue),),
                                SizedBox(height: 5),
                                Text(postList[index].body.toString()),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
