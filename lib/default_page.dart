import 'package:api_practice/ProductDetails.dart';
import 'package:api_practice/home_page.dart';
import 'package:api_practice/signup_page.dart';
import 'package:api_practice/users_details.dart';
import 'package:api_practice/users_details2.dart';
import 'package:flutter/material.dart';

import 'home_page2.dart';
import 'login_page.dart';

class DefaultPage extends StatelessWidget {
  const DefaultPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Learn API Integration"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomePage(),
                    ));
              },
              child: const Text("Home Page",
                  style: TextStyle(fontWeight: FontWeight.bold),
                  textScaleFactor: 1.5),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomePage2(),
                    ));
              },
              child: const Text("Home Page 2",
                  style: TextStyle(fontWeight: FontWeight.bold),
                  textScaleFactor: 1.5),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const UsersDetails(),
                    ));
              },
              child: const Text("Users Details Page",
                  style: TextStyle(fontWeight: FontWeight.bold),
                  textScaleFactor: 1.5),
            ),
            // TextButton(
            //   onPressed: () {
            //     Navigator.push(
            //         context,
            //         MaterialPageRoute(
            //           builder: (context) => const UsersDetails2(),
            //         ));
            //   },
            //   child: const Text("Users Details Page 2",
            //       style: TextStyle(fontWeight: FontWeight.bold),
            //       textScaleFactor: 1.5),
            // ),
          ],
        ),
      ),
    );
  }
}
