import 'package:hive/hive.dart';

class LoginInfoDetailsDb {
  List loginInfoDetails = [];
  final _mybox = Hive.box('myBox');

  void createInitialDatabase() {
    loginInfoDetails = [
      ["Ramesh", "Ramesh123@gmail.com", "Ramesh123"],
    ];
  }

  void loadData() {
    loginInfoDetails = _mybox.get("LOGININFODETAILS");
  }

  void updateDatabase() {
    _mybox.put("LOGININFODETAILS", loginInfoDetails);
  }
}
