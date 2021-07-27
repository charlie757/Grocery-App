import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:online_shopping/utils/Contrains.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AllCategroiesPage extends StatefulWidget {
  const AllCategroiesPage({Key key}) : super(key: key);

  @override
  _AllCategroiesPageState createState() => _AllCategroiesPageState();
}

class _AllCategroiesPageState extends State<AllCategroiesPage> {
  String _email1 = '';
  String _password1 = '';
  String _email2 = '';
  String _password2 = '';
  var status = true;
  String fuid = "";
  getfuid() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    setState(() {
      fuid = prefs.getString('fuid');
    });

    return fuid;
  }

  Future<void> _getEmailDetails1() async {
    // final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

    FirebaseFirestore.instance
        .collection("Grocery")
        .doc("QjEBg7zTHyPX6JL6e1yh")
        .snapshots()
        .listen((event) {
      setState(() {
        _email1 = event.get("email").toString();
        _password1 = event.get("password").toString();
        print("bio: " + _email1.toString());
        print("name: " + _password1.toString());
      });
    });
  }

  Future<void> _getEmailDetails2() async {
    // final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

    FirebaseFirestore.instance
        .collection("Grocery")
        .doc("vqaiicYe2EMyTPrqkdp6")
        .snapshots()
        .listen((event) {
      setState(() {
        _email2 = event.get("email").toString();
        _password2 = event.get("password").toString();
        print("bio: " + _email2.toString());
        print("name: " + _password2.toString());
      });
    });
  }

  @override
  void initState() {
    _getEmailDetails1();

    _getEmailDetails2();
    getfuid();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        Card(
            child: ListTile(
          title: Text(
            _email1.toString(),
            style: TextStyle(color: black),
          ),
          subtitle: Text(_password1.toString()),
        )),
        Card(
            child: ListTile(
          title: Text(
            _email2.toString(),
          ),
          subtitle: Text(_password2.toString()),
        )),
      ],
    ));
  }
}
