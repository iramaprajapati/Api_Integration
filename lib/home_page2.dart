import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage2 extends StatefulWidget {
  const HomePage2({Key? key}) : super(key: key);

  @override
  State<HomePage2> createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2> {
  List<PhotosModel> photosList = [];

  Future<List<PhotosModel>> getPhotosApi() async {
    final response = await http
        .get(Uri.parse("https://jsonplaceholder.typicode.com/photos"));
    var jsonData = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      photosList.clear();
      for (Map i in jsonData) {
        photosList.add(PhotosModel(
            title: i["title"],
            url: i["url"],
            thumbnailUrl: i["thumbnailUrl"],
            id: i["id"]));
      }
      return photosList;
    } else {
      return photosList;
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
            future: getPhotosApi(),
            builder: (context, AsyncSnapshot<List<PhotosModel>> snapshot) {
              if (!snapshot.hasData) {
                return Text("Loading..!");
              } else {
                return ListView.builder(
                  itemCount: photosList.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundImage:
                            NetworkImage(snapshot.data![index].url.toString()),
                      ),
                      title: Text("Notes Id : ${snapshot.data![index].id}"),
                      subtitle: Text(snapshot.data![index].title.toString()),
                    );
                  },
                );
              }
            },
          )),
        ],
      ),
    );
  }
}

class PhotosModel {
  String title, url, thumbnailUrl;
  int id;

  PhotosModel(
      {required this.title,
      required this.url,
      required this.thumbnailUrl,
      required this.id});
}
