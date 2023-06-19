import 'dart:convert';

import 'package:api_practice/models/UsersModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UsersDetails extends StatefulWidget {
  const UsersDetails({Key? key}) : super(key: key);

  @override
  State<UsersDetails> createState() => _UsersDetailsState();
}

class _UsersDetailsState extends State<UsersDetails> {
  List<UsersModel> usersList = [];

  Future<List<UsersModel>> getUsersApi() async {
    final response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));
    var userData = jsonDecode(response.body);
    if (response.statusCode == 200) {

      for (Map i in userData) {
      //  print(i["name"]);
        usersList.add(UsersModel.fromJson(i));
      }
      return usersList;
    } else {
      return usersList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("User Details from API")),
      body: Column(
        children: [
          Expanded(
              child: FutureBuilder(
            future: getUsersApi(),
            builder: (context, AsyncSnapshot<List<UsersModel>> snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return ListView.builder(
                  itemCount: usersList.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            ReusableRow(title: "User Id : ", value: snapshot.data![index].id.toString()),
                            ReusableRow(title: "Name : ", value: snapshot.data![index].name.toString()),
                            ReusableRow(title: "User Name : ", value: snapshot.data![index].username.toString()),
                            ReusableRow(title: "Email : ", value: snapshot.data![index].email.toString()),
                            ReusableRow(title: "Address : ", value: snapshot.data![index].address!.street.toString()),
                            ReusableRow(title: "City : ", value: snapshot.data![index].address!.city.toString()),
                            ReusableRow(title: "Zipcode : ", value: snapshot.data![index].address!.zipcode.toString()),
                            ReusableRow(title: "Geo Latitude : ", value: snapshot.data![index].address!.geo!.lat.toString()),
                            ReusableRow(title: "Geo Longitude : ", value: snapshot.data![index].address!.geo!.lng.toString()),
                            ReusableRow(title: "Phone : ", value: snapshot.data![index].phone.toString()),
                            ReusableRow(title: "Website : ", value: snapshot.data![index].website.toString()),
                            ReusableRow(title: "Company : ", value: snapshot.data![index].company!.name.toString()),
                          ],
                        ),
                      ),
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

class ReusableRow extends StatelessWidget {
  String title, value;

  ReusableRow({Key? key, required this.title, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          Text(value),
        ],
      ),
    );
  }
}
