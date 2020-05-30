
          import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gagro/Api/api.dart';
          import 'package:http/http.dart'as http;

      class ValidationPassWord extends StatefulWidget {

        final String email;
        ValidationPassWord(this.email);


        @override
        _ValidationPassWordState createState() => _ValidationPassWordState();
      }

      class _ValidationPassWordState extends State<ValidationPassWord> {

        String code,email;
        var _key = GlobalKey<FormState>();

        check(){

          final form = _key.currentState;
          if(form.validate()){

            form.save();
            verification();

          }

        }



            verification()  async{

                final response = await http.post(Baseurl.userverification,

                body: {
                  "email" : widget.email,
                  "code" : code,

                },

                );

                final data = jsonDecode(response.body);

                bool Success = data["Success"];
                String message = data["message"];


                if(Success== false){

                      print("SuccessFully COde Generated");
                }

                else
                {

                  print(message);
                }



            }





        @override
        Widget build(BuildContext context) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.purple,
                title: Text("Validation"),
            ),
            body: Padding(
              padding: EdgeInsets.all(30),
              child: Form(
                    key: _key,
                child: ListView(
                  children: <Widget>[

                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
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


                    SizedBox(height: 20,),

                    TextFormField(
                      keyboardType: TextInputType.number,
                      onSaved: (e)=> code = e,
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                          ),
                          prefixIcon: Icon(
                            Icons.code,
                            color: Colors.black54,
                          ),
                          filled: true,
                          fillColor: Colors.grey[100],
                          hintText: "Code"

                      ),

                    ),



                    SizedBox(height: 30,),


                    Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: RaisedButton(
                        child: Text("Submit"),
                        onPressed: (){
                  check();
                        },
                        color: Colors.purple,
                      ),
                    ),

                  ],
                ),
              ),
            ),
          );
        }
      }
