import 'package:flutter/material.dart';

class LoginInfo extends StatelessWidget {
  final String userName;
  final String userEmail;
  final String userPassword;
  final VoidCallback onDelete;
  LoginInfo(

      {super.key,
      required this.userName,
      required this.userEmail,
      required this.userPassword,
      required this.onDelete
      });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 130, top: 30),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(3),
            color: Colors.white,
            border: Border.all(color: Colors.black, width: 1.2)),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 160),
              child: GestureDetector(

                  onTap: onDelete,
                  child: InkWell(
                    child: Container(
                      decoration: BoxDecoration(border: Border.all(color: Colors.black)),
                      child: Icon(
                        Icons.close,
                        size: 20,
                        color: Colors.red,
                      ),
                    ),
                  )),
            ),
            Row(
              children: [
                Text("Name: "),
                Text(userName),
              ],
            ),
            Row(children: [
              Text("Email: "),
              Text(userEmail),
            ]),
            Row(
              children: [Text("Password: "), Text(userPassword)],
            )
          ],
        ),
      ),
    );
  }
}
