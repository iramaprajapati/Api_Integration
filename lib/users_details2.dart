import 'dart:convert';

import 'package:api_practice/models/UsersModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UsersDetails2 extends StatefulWidget {
  const UsersDetails2({Key? key}) : super(key: key);

  @override
  State<UsersDetails2> createState() => _UsersDetails2State();
}

class _UsersDetails2State extends State<UsersDetails2> {
  var usersData;

  Future<void> getUsersApi() async {
    final response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));
    if (response.statusCode == 200) {
      usersData = jsonDecode(response.body.toString());
    } else {
      usersData = jsonDecode(response.body.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Details from API"),
      ),
      body: Column(children: [
        Expanded(
          child: FutureBuilder(
            future: getUsersApi(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else {
                return ListView.builder(
                  itemCount: usersData.length,
                  itemBuilder: (context, index) {
                  return Card(
                    child: Column(
                      children: [
                        ReusableRow(title: "User Id", value: usersData[index]["id"].toString()),
                        ReusableRow(title: "User Name", value: usersData[index]["username"].toString()),
                        ReusableRow(title: "Name", value: usersData[index]["name"].toString()),
                        ReusableRow(title: "Email", value: usersData[index]["email"].toString()),
                        ReusableRow(title: "Phone", value: usersData[index]["phone"].toString()),
                        ReusableRow(title: "Address", value: usersData[index]["address"]["street"].toString()),
                        ReusableRow(title: "City", value: usersData[index]["address"]["city"].toString()),
                        ReusableRow(title: "Zipcode", value: usersData[index]["address"]["zipcode"].toString()),
                        ReusableRow(title: "Website", value: usersData[index]["website"].toString()),
                        ReusableRow(title: "Company", value: usersData[index]["company"]["name"].toString()),
                        ReusableRow(title: "Geo Latitude", value: usersData[index]["address"]["geo"]["lat"].toString()),
                        ReusableRow(title: "Geo Longitude", value: usersData[index]["address"]["geo"]["lng"].toString()),
                      ]
                      ,
                    ),
                  );
                },);
              }
            },
          ),
        )
      ]),
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