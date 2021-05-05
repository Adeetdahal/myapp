import 'package:flutter/material.dart';
import 'package:flutter_app/homePage.dart';
import 'package:flutter_app/navigation.dart';
import 'package:flutter_app/signUp.dart';

class SubmitPage extends StatefulWidget {
  @override
  _SubmitPageState createState() => _SubmitPageState();
}

class _SubmitPageState extends State<SubmitPage> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  void validate() {
    if (formkey.currentState.validate()) {
      print("Validated");
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Navigation()));
    } else {
      print("Not Validated");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.deepPurple,
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: ListView(
            //mainAxisAlignment: MainAxisAlignment.center,
            //crossAxisAlignment: CrossAxisAlignment.start,
            //shrinkWrap: true,
            children: [
              SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/flutter.png'),
                    radius: 40,
                  ),
                  SizedBox(width: 12),
                  Text(
                    'DEMO',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              //Text('Log In',style: TextStyle(fontSize: 40,fontWeight: FontWeight.w500),),
              SizedBox(
                height: 35,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 20.0, top: 15.0, right: 20.0, bottom: 15.0),
                    child: Form(
                      key: formkey,
                      child: Column(
                        children: [
                          TextFormField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30.0)),
                                  borderSide: BorderSide(color: Colors.black),
                                ),
                                prefixIcon: Icon(Icons.people),
                                labelText: 'Email',
                              ),
                              validator: (value) {
                                if (RegExp(
                                        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                                    .hasMatch(value)) {
                                  return null;
                                } else {
                                  return "Invalid Email !";
                                }
                              }
                              ),
                          SizedBox(height: 10),
                          TextFormField(
                            obscureText: true,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30.0)),
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                              prefixIcon: Icon(Icons.warning_rounded),
                              labelText: 'Password',
                            ),
                            validator: (value) {
                              if (value.isEmpty) {
                                return " Required";
                              } else if (value.length < 6) {
                                return "Password should be atleast 6 characters";
                              } else if (value.length > 15) {
                                return "Password should not be greater than 15 characters";
                              } else
                                return null;
                            },
                          ),
                          SizedBox(height: 15.0),
                          InkWell(
                            onTap: () {
                              validate();
                            },
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12)),
                              color: Colors.deepPurple,
                              child: Padding(
                                  padding: const EdgeInsets.all(6.0),
                                  child: Text(
                                    "login",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500),
                                  )),
                            ),
                          ),
                          SizedBox(height: 25.0),
                          Row(
                            children: [
                              InkWell(
                                child: Text(
                                  'Do not have an account?',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => SignUp()));
                                },
                                child: Text(
                                  'Sign Up',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                    decoration: TextDecoration.underline,
                                    color: Colors.deepPurple,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
