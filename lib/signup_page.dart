import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void funRegister(String email, password) async {
    try {
      http.Response response = await http.post(
        Uri.parse("https://reqres.in/api/register"),
        body: {"email": email, "password": password},
      );
      if (response.statusCode == 200) {
        var jsonData= jsonDecode(response.body.toString());
        print(jsonData); //for all values
       // print(jsonData["id"]); // for single value
       // print(jsonData["token"]); // for single value
        print("Registered successfully..!");
      } else {
        print("Registration failed");
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign Up Page"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(hintText: "Email"),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: passwordController,
              decoration: InputDecoration(hintText: "Password"),
            ),
            SizedBox(
              height: 40,
            ),
            InkWell(
              onTap: () {
                funRegister(emailController.text.toString(),
                    passwordController.text.toString());
              },
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.lightGreen,
                    borderRadius: BorderRadius.circular(10)),
                child: Center(child: Text("Sign Up")),
              ),
            )
          ],
        ),
      ),
    );
  }
}
