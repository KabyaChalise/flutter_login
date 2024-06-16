import 'dart:ffi';

import 'package:flutter/material.dart';

class LoginPanel extends StatelessWidget {
  LoginPanel({super.key, required this.onClose, required this.onSave, required this.nameController, required this.emailController, required this.passwordController});

// cancel save
  VoidCallback onClose;
  VoidCallback onSave;
  final nameController;
  final emailController;
  final passwordController;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
      backgroundColor: Colors.white,
      content: Container(
        width: 400,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FloatingActionButton(
                mini: true,
                onPressed: onClose,
                backgroundColor: Colors.white,
                child: Icon(Icons.arrow_back_ios),
              ),
              Row(
                children: [
                  Text(
                    "Create an account ",
                    style: TextStyle(fontSize: 27, fontWeight: FontWeight.w500),
                  ),
                  Icon(
                    Icons.star_half,
                    color: Colors.amber[200],
                    size: 20,
                  )
                ],
              ),
              Text(
                "Welcome! Please enter your details.",
                style: TextStyle(fontWeight: FontWeight.w200),
              ),
              SizedBox(
                height: 20,
              ),
              Text("Name"),
              TextField(
                controller: nameController,
                cursorColor: Colors.black,
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)),
                    prefixIcon: Icon(Icons.person_2_outlined),
                    hintText: "Enter your name"),
              ),
              Text("Email"),
              TextField(
                controller: emailController,
                cursorColor: Colors.black,
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)),
                    prefixIcon: Icon(Icons.mail_outline),
                    hintText: "Enter your email"),
              ),
              Text("Password"),
              TextField(
                controller: passwordController,
                cursorColor: Colors.black,
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)),
                    prefixIcon: Icon(Icons.lock),
                    hintText: "*******"),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: 300,
                child: FloatingActionButton(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                  onPressed: onSave,
                  backgroundColor: Colors.black,
                  child: Text(
                    "Sign UP",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
