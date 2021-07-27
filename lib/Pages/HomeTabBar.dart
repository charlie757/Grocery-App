import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import 'Modal/data.dart';

class HomeTabBar extends StatefulWidget {
  const HomeTabBar({Key key}) : super(key: key);

  @override
  _HomeTabBarState createState() => _HomeTabBarState();
}

class _HomeTabBarState extends State<HomeTabBar> {
  List<Data> dataList = [];

  void initState() {
    super.initState();
    DatabaseReference referenceData =
        FirebaseDatabase.instance.reference().child('Grocery');
    referenceData.once().then((DataSnapshot dataSnapshot) {
      dataList.clear();
      var keys = dataSnapshot.value.key;
      var values = dataSnapshot.value;

      for (var key in keys) {
        Data data = new Data(values[keys]["img"], values[keys]["price"]);
        dataList.add(data);
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: dataList.length == 0
            ? Center(
                child:
                    Text("No Data Available", style: TextStyle(fontSize: 20)))
            : ListView.builder(itemBuilder: (_, index) {
                return Card(
                  child: Text(dataList[index].price),
                );
              }));
  }
}
