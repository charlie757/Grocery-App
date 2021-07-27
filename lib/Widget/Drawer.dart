import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:online_shopping/Pages/Auth/AuthWithGmail/authService.dart';
import 'package:online_shopping/Pages/Auth/AuthWithGoogle/GoogleAuth.dart';
import 'package:online_shopping/utils/Contrains.dart';
import 'package:provider/provider.dart';

class DrawerPage extends StatefulWidget {
  const DrawerPage({Key key}) : super(key: key);

  @override
  _DrawerPageState createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  var _loginwithgoogle = false;
  @override
  Widget build(BuildContext context) {
    FirebaseAuth.instance.authStateChanges();
    final user = FirebaseAuth.instance.currentUser;
    return Drawer(
        child: Container(
            width: MediaQuery.of(context).size.width,
            child: ListView(
              children: [
                Container(
                    height: 70,
                    color: Colors.blue,
                    child: ListTile(
                        title: Text(
                          'Hello, '
                          // + user.displayName,
                          ,
                          style: TextStyle(color: Colors.white),
                        ),
                        subtitle: Text(
                          user.email,
                          style: TextStyle(color: Colors.white),
                        ),
                        trailing: IconButton(
                            icon: Icon(
                              Icons.close,
                              size: 30,
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            }),
                        leading: CircleAvatar(
                            // backgroundImage: NetworkImage(user.photoURL),
                            ))),
                // UserAccountsDrawerHeader(
                // accountName: Text(user.displayName),
                // accountEmail: Text(user.email),
                // currentAccountPicture: CircleAvatar(
                //     backgroundImage: NetworkImage(user.photoURL)),
                //   onDetailsPressed: () {},
                // ),
                ListTile(
                  onTap: () {},
                  title: Text("Home"),
                ),
                ListTile(
                  onTap: () {},
                  title: Text("Shop by Category"),
                ),
                ListTile(
                  onTap: () {},
                  title: Text("Jio Mart Wallet"),
                ),
                ListTile(
                  onTap: () {},
                  title: Text("My Orders"),
                ),
                ListTile(
                  onTap: () {},
                  title: Text("My List"),
                ),
                ListTile(
                  onTap: () {},
                  title: Text("All Offers"),
                ),
                Divider(
                  color: black2,
                ),
                ListTile(
                  onTap: () {},
                  title: Text("Help and setting"),
                ),
                ListTile(
                  onTap: () {},
                  title: Text("Customer Service"),
                ),
                ListTile(
                  onTap: () {},
                  title: Text("Guide"),
                ),
                ListTile(
                  onTap: () {
                    AuthService().signOut();
                    //       final provider =
                    //     Provider.of<GoogleSignInProvider>(context, listen: false);
                    // provider.googleLoginIn();
                  },
                  title: Text("Sign Out"),
                ),
              ],
            )));
  }
}
