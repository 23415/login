import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import 'googlesignpage.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage(this.submitFn);
  final void Function(
    String username,
    String password,
    bool islogin,
  ) submitFn;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var LogIn = true;

  final _formkey = GlobalKey<FormState>();

  var _username = '';
  var _password = '';

  void _trysubmit() {
    final isvalid = _formkey.currentState!.validate();
    FocusScope.of(context).unfocus();

    if (isvalid) {
      _formkey.currentState!.save();
      widget.submitFn(
        _username,
        _password,
        LogIn,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/bg.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 100,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 30,
                ),
                child: Text(
                  LogIn ? "Sign In" : "Sign Up",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, top: 10),
                child: Text(
                  LogIn
                      ? "sign in with your username or email"
                      : "sign up with your username or password",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              SizedBox(
                height: 100,
              ),
              Form(
                  key: _formkey,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 90, right: 30),
                        child: TextFormField(
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          validator: (value) {
                            if (value!.isEmpty || value.length < 6) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _username = value!;
                          },
                          key: ValueKey('username'),
                          decoration: InputDecoration(
                            labelText: "Username or Email",
                            labelStyle: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 90, right: 30),
                        child: TextFormField(
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          validator: (value) {
                            if (value!.isEmpty || value!.length < 6) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _password = value!;
                          },
                          key: ValueKey('password'),
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: "Password",
                            labelStyle: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      if (!LogIn)
                        Padding(
                          padding: const EdgeInsets.only(left: 90, right: 30),
                          child: TextFormField(
                            validator: (value) {
                              if (value != _password) {
                                return 'Password doesn\'t match';
                              }
                              return null;
                            },
                            obscureText: true,
                            key: ValueKey('confirm password'),
                            decoration: InputDecoration(
                              labelText: "Confirm Password",
                              labelStyle: TextStyle(fontSize: 12),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 80),
                        child: SizedBox(
                          width: 150,
                          child: ElevatedButton(
                            onPressed: () {
                              _trysubmit();
                            },
                            child: Text(
                              LogIn ? "Sign In" : 'Sign Up',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 250, right: 30),
                        child: TextButton(
                          onPressed: () {
                            setState(() {
                              LogIn = !LogIn;
                            });
                          },
                          child: Text(
                            LogIn ? "Create Account" : "Forgot Password?",
                            style: TextStyle(
                              color: Colors.deepPurple,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
              Divider(
                color: Colors.deepPurple,
                thickness: 3,
                height: 1,
                indent: 250,
                endIndent: 30,
              ),
              SizedBox(
                height: 200,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 75, right: 10, bottom: 45),
                child: Text(
                  'Social Login can save your valuable time',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Divider(
                    color: Colors.deepPurple,
                    thickness: 3,
                    height: 1,
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 60,
                      right: 30,
                    ),
                    child: Container(
                      width: 120,
                      child: ElevatedButton.icon(
                        icon: Icon(FontAwesomeIcons.google),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          onPrimary: Colors.black,
                        ),
                        onPressed: () {
                          final provider = Provider.of<GoogleSignInProvider>(
                              context,
                              listen: false);
                          provider.googleLogin();
                        },
                        label: Text(
                          'Google',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    width: 125,
                    child: ElevatedButton.icon(
                      icon: Icon(FontAwesomeIcons.facebook),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blueAccent,
                      ),
                      onPressed: () {},
                      label: Text('Facebook'),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
