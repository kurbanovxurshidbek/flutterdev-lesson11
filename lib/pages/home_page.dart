import 'package:flutter/material.dart';
import 'package:ngdemo10/services/pref_service.dart';

import '../models/user_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String name = "no name";
  User? user;
  List<User> userList = [
    User(id: 1002,username: "Foziljon"),
    User(id: 1003,username: "Dilshod"),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //Prefs.storeName("Durdona");
    //_loadName();
    //User user = User(id: 1001, username: "Sohiba");
    //Prefs.storeUser(user);
    //_loadUser();
    //Prefs.storeUserList(userList);
    _loadUserList();
  }

  _loadUserList() async {
    List<User>? result = await Prefs.loadUserList();
    setState(() {
      user = result!.first;
    });
  }

  _loadUser() async {
    User? result = await Prefs.loadUser();
    setState(() {
      user = result!;
    });
  }

  _loadName() async {
    String result = await Prefs.loadName();
    setState(() {
      name = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Shared Preferences"),
      ),
      body: Center(
        child: Text(
          user != null ? user!.toMap().toString():"No user",
          style: TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}
