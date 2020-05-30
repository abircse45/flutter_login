
      import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gagro/Api/api.dart';
import 'package:gagro/Validation_pass/validation_passord.dart';
      import 'package:http/http.dart'as http;

      class ForgotPass extends StatefulWidget {
        @override
        _ForgotPassState createState() => _ForgotPassState();
      }

      class _ForgotPassState extends State<ForgotPass> {

        String email;
        var _key = GlobalKey<FormState>();
        checkForgot(){

          final form  = _key.currentState;
          if(form.validate()){

            form.save();
            submitForgotton();
          }


        }

            var loading = false;
        submitForgotton()async{

          setState(() {
            loading = true;
          });

          final response = await http.post(Baseurl.requestresetpassword,

          body: {
            "email" :  email,
          },
          );

          final data = jsonDecode(response.body);

          bool Success = data["Success"];

          if(Success== false){

            Navigator.push(context, MaterialPageRoute(builder: (context)=> ValidationPassWord(email)));

          }

          else
            {

            print(Success);
          }






        }


        @override
        Widget build(BuildContext context) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.purple,
              title: Text("Email"),
            ),
            body: Padding(
              padding: EdgeInsets.all(25),
              child: Form(
                key: _key,
                child: Column(
                  children: <Widget>[

                    Text("Reset Your Email"),

                  SizedBox(height: 20,),

                    TextFormField(
                      validator: (value){
                        if(value.isEmpty){
                          return "Please enter email";
                        }
                        return null;
                      },
                      keyboardType: TextInputType.text,
                      onSaved: (e)=> email = e,
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                          ),
                          prefixIcon: Icon(
                            Icons.email,
                            color: Colors.black54,
                          ),
                          filled: true,
                          fillColor: Colors.grey[100],
                          hintText: "Email"

                      ),

                    ),

                    SizedBox(
                      height: 30,
                    ),

                    RaisedButton(
                      child: Text("Submit",style: TextStyle(fontSize: 17,color: Colors.white),),
                      color: Colors.purple,
                      onPressed: (){
                        checkForgot();
                      },
                    ),

                  ],
                ),
              ),
            ),

          );
        }
      }
