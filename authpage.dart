import 'package:assignui/MyhomePage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Authenticate extends StatefulWidget {
  Authenticate({Key? key}) : super(key: key);

  @override
  State<Authenticate> createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  final _auth = FirebaseAuth.instance;

  void _submitLoginPage(
    final String name,
    String password,
    bool isLogin,
  ) async {
    try {
      if (isLogin) {
        final AuthCredential = await _auth.signInWithEmailAndPassword(
            email: name, password: password);
      } else {
        final AuthCredential = await _auth.createUserWithEmailAndPassword(
            email: name, password: password);
      }
    } on PlatformException catch (err) {
      var message = 'error occured , check your credentials!';

      if (err.message != null) {
        message = err.message!;
      }
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text(message),
      ));
    } catch (err) {
      print(err);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MyHomePage(_submitLoginPage),
    );
  }
}
