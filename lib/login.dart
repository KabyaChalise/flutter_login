import 'package:flutter/material.dart';
import 'package:flutter_login/login_info.dart';
import 'package:flutter_login/login_info_details_db.dart';
import 'package:flutter_login/login_panel.dart';
import 'package:hive/hive.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _myBox = Hive.box('myBox');
  LoginInfoDetailsDb db = LoginInfoDetailsDb();

  // Defining all the controller for name email password
  final name_controller = TextEditingController();
  final email_controller = TextEditingController();
  final password_controller = TextEditingController();
  // database management
  void initState() {
    if (_myBox.get("LOGININFODETAILS") == null) {
      db.createInitialDatabase();
    } else {
      db.loadData();
    }
    super.initState();
  }

  void saveNewSignUp() {
    setState(() {
      db.loginInfoDetails.add([
        name_controller.text,
        email_controller.text,
        password_controller.text,
      ]);
      name_controller.clear();
      email_controller.clear();
      password_controller.clear();
      db.updateDatabase();
    });

    Navigator.of(context).pop();
  }

  createNewLogin() {
    showDialog(
        context: context,
        builder: (context) {
          return LoginPanel(
            nameController: name_controller,
            emailController: email_controller,
            passwordController: password_controller,
            onSave: saveNewSignUp,
            onClose: () => Navigator.of(context).pop(),
          );
        });
  }

  void delete(int index) {
    setState(() {
      db.loginInfoDetails.removeAt(index);
      db.updateDatabase();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("LOGIN INFO"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewLogin,
        child: Icon(Icons.login),
        backgroundColor: Colors.white,
      ),
      body: ListView.builder(
          itemCount: db.loginInfoDetails.length,
          itemBuilder: (context, index) {
            return LoginInfo(
              userName: db.loginInfoDetails[index][0],
              userEmail: db.loginInfoDetails[index][1],
              userPassword: db.loginInfoDetails[index][2],
              onDelete: () => delete(index),
            );
          }),
      backgroundColor: Colors.grey[100],
    );
  }
}
