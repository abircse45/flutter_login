import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gagro/Api/api.dart';
import 'package:http/http.dart'as http;
import 'package:gagro/Login/login.dart';

        class SignUp extends StatefulWidget {

          @override
          _SignUpState createState() => _SignUpState();
        }

        class _SignUpState extends State<SignUp> {

          TextEditingController nameController = TextEditingController();
          TextEditingController mailController = TextEditingController();
          TextEditingController passwordController = TextEditingController();
          TextEditingController confirmpasswordController = TextEditingController();
          TextEditingController phoneController = TextEditingController();

          final _keySign = GlobalKey<FormState>();
          String name,email,phone,password,password_confirmation;
          bool _showPassword = false;



          handleSignUp() async{

            final form = _keySign.currentState;
            if(form.validate()){
              form.save();
              register();
              //      print("$name  $password");
            }
          }

          register() async{

            var reponse = await http.post(
              Baseurl.register,
              body:
              {
               // "account_type" :myList,
                "name" :name,
                "email" :email,
                "phone" :phone,
                "password" :password,
                "password_confirmation" :password_confirmation,
              },
              headers: {"Accept" : "application/json"},
            );

            final data = json.decode(reponse.body);

            bool Success = data["Success"];
            String pMessage = data["message"];

            if(Success== false){
              setState(() {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> Login()));
                print(pMessage);
              });
            }
            else{
              print(pMessage);
            }
          }
          @override
          Widget build(BuildContext context) {
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.purple,
                title: Text("Register"),
              ),
              body: Padding(
                padding: EdgeInsets.all(20),
                child: Form(
                  key: _keySign,
                  child: ListView(
                    children: <Widget>[
//                      DropdownButtonHideUnderline(
//                        child: ButtonTheme(
//                          alignedDropdown: true,
//                          child: DropdownButton<String>(
//                            value: myList,
//                            iconSize: 30,
//                            icon: (null),
//                            style: TextStyle(
//                              color: Colors.black54,
//                              fontSize: 15,
//                            ),
//                          hint: Text("Select Account Type"),
//                            onChanged: (String newVal){
//                              setState(() {
//                                myList = newVal;
//                                getAccountList();
//                                print(myList);
//
//                              });
//                            },
//                            items: accountTypeList?.map((item){
//                              return DropdownMenuItem(
//                                child: Text(item['name']),
//                                value: item['id'].toString(),
//                              );
//                            })?.toList() ??
//                            [],
//
//
//                          ),
//                        ),
//                      ),

                    SizedBox(height: 20,),

                      TextFormField(
                        onSaved: (eee)=> name= eee,
                        controller: nameController,
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(8)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(8)),
                            ),
                            prefixIcon: Icon(
                              Icons.person_outline,
                              color: Colors.black54,
                            ),
                            filled: true,
                            fillColor: Colors.grey[100],
                            hintText: "Name"

                        ),

                      ),

                          SizedBox(height: 20,),

                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        onSaved: (eee)=> email = eee,

                        controller: mailController,
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
                        keyboardType: TextInputType.phone,
                        onSaved: (eee)=> phone = eee,

                        controller: phoneController,
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(8)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(8)),
                            ),
                            prefixIcon: Icon(
                              Icons.phone,
                              color: Colors.black54,
                            ),
                            filled: true,
                            fillColor: Colors.grey[100],
                            hintText: "Phone"

                        ),

                      ),

                      SizedBox(height: 20,),



                      TextFormField(
                        onSaved: (e)=> password = e,
                        controller: passwordController,
                        obscureText: !_showPassword,
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(8)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(8)),
                            ),
                            prefixIcon: Icon(
                              Icons.vpn_key,
                              color: Colors.black54,
                            ),
                            suffixIcon: GestureDetector(
                              onTap: ()
                              {
                                setState(() {
                                  _showPassword = !_showPassword;
                                });
                              },
                              child: Icon(_showPassword ?  Icons.visibility :Icons.visibility_off ),
                            ),
                            filled: true,
                            fillColor: Colors.grey[100],
                            hintText: "Password"

                        ),

                      ),


                      SizedBox(height: 20,),


                      TextFormField(
                        onSaved: (e)=> password_confirmation = e,
                        controller: confirmpasswordController,
                        obscureText: !_showPassword,
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(8)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(8)),
                            ),
                            prefixIcon: Icon(
                              Icons.vpn_key,
                              color: Colors.black54,
                            ),
                            suffixIcon: GestureDetector(
                              onTap: ()
                              {
                                setState(() {
                                  _showPassword = !_showPassword;
                                });
                              },
                              child: Icon(_showPassword ?  Icons.visibility :Icons.visibility_off ),
                            ),
                            filled: true,
                            fillColor: Colors.grey[100],
                            hintText: "Password"

                        ),

                      ),



                Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: Container(
                    height: 45,
                    width: 230,
                    child:  RaisedButton(
                      onPressed:(){
                        handleSignUp();
                      },
                      color: Colors.deepPurple,
                      child: Text("SignUp",style: TextStyle(fontSize: 15,color: Colors.white),),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 30,),

                ]
                ),
              ),
                  ),
                );
          }


          List accountTypeList;


          String accountTypeUrl = 'http://uat.gagro.com.bd/api/get-account-type';
          Future getAccountList () async{

            await http.get(
                accountTypeUrl,
              headers: {"Accept" : "application/json"},



            ).then((response){
              var data = json.decode(response.body);
              setState(() {
                accountTypeList = data["data"];
              });
            });

          }

        }





