import 'package:flutter/material.dart';
import 'package:flutter_app/submitPage.dart';
class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  GlobalKey<FormState> formkey =GlobalKey<FormState>();
  var confirmPass;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Padding(
          padding: EdgeInsets.all(12.0),
          child: Form(
            key: formkey,
            child: ListView(
              // mainAxisAlignment: MainAxisAlignment.center,
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Sign Up', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 25),),
                SizedBox(height: 15),
                TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      labelText: 'Name'
                  ),
                  validator: (value){
                    if(value.isEmpty){
                      return "Name can't be empty";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 15,),
                TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      labelText: 'Email Address'
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
                SizedBox(height: 15,),
                TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      labelText: 'Password'
                  ),
                  obscureText: true,
                  validator: (value) {
                    confirmPass=value;
                    if(value.isEmpty){
                      return "Required ";
                    }else if(value.length<6) {
                      return "Password should be 6 characters long";
                    }else if(value.length>15) {
                      return "Password shoud not be greater than 15 characters";
                    }else
                      return null;
                  },
                ),
                SizedBox(height: 15,),
                TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      labelText: 'Confirm Password'
                  ),
                  obscureText: true,
                  validator: (value){
                    if(value.isEmpty){
                      return"Required";
                    }else if(value!=confirmPass){
                      return"Password must be same as above";
                    }else
                      return null;
                  },

                ),
                SizedBox(height: 15,),
                Row(
                  children: [
                    InkWell(
                      onTap: (){
                          if (formkey.currentState.validate()) {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>SubmitPage()));
                          } else {
                            print("Not Validated");
                          }
                        },
                      child: Card(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                        color: Colors.cyan,
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text('Sign Up', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),),
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
    );
  }
}