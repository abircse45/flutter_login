
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:gagro/Api/api.dart';
import 'package:gagro/Home/home.dart';
import 'package:gagro/ResetRequ/rreset.dart';
import 'package:gagro/SignUp/signup.dart';
import 'package:http/http.dart'as http;
import 'package:shared_preferences/shared_preferences.dart';


class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

enum LoginStatus{
  notSignIn,
  signIn
}

class _LoginState extends State<Login> {
  LoginStatus _loginStatus = LoginStatus.notSignIn;
  TextEditingController vemail = TextEditingController();
  TextEditingController vpassword = TextEditingController();
  bool _showPassword = false;
  bool _rememberMe = false;


  final _key = GlobalKey<FormState>();
  bool isloading = false;
  String email, password;

  checkApiLogin()  async{
    final form = _key.currentState;
    if(form.validate()){
      form.save();
      login();
      //      print("$name  $password");
    }
  }
  login()  async{
    var reponse = await http.post(
      Baseurl.login,
      body:
      {
        "email" :email,
        "password" :password,
      },
    );

    final data = json.decode(reponse.body);
    //print(data);

    bool Success = data["Success"];
    String pMessage = data["message"];

    if(Success == true){

      setState(() {
        _loginStatus = LoginStatus.signIn;
        _savePrefence(Success);

      });


      print(pMessage);

    }

    else{

      print(pMessage);
    }

  }


  _savePrefence( bool Success) async{

    SharedPreferences _prefercene =  await SharedPreferences.getInstance();
    setState(() {
      _prefercene.setBool("user", Success);
      _prefercene.commit();
    });
  }


        bool Success;
          _getpreference()async{
            
            SharedPreferences _pref = await SharedPreferences.getInstance();

            setState(() {
              Success = _pref.getBool("user");

              _loginStatus = Success == true  ? LoginStatus.signIn : LoginStatus.notSignIn;

            });

          }


          signOut()async{

            SharedPreferences _prefer = await SharedPreferences.getInstance();
            setState(() {
              _prefer.setBool("user", null);
              _loginStatus = LoginStatus.notSignIn;
            });

          }




          @override
  void initState() {
    super.initState();
    _getpreference();
  }


  @override
  Widget build(BuildContext context) {
    switch(_loginStatus){
      case  LoginStatus.notSignIn :
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.purple,
            title: Text("Login"),
          ),
          body: Padding(
            padding: EdgeInsets.all(20),
            child: Form(
              key: _key,
              child: ListView(
                children: <Widget>[
                  TextFormField(
                    keyboardType: TextInputType.text,
                    onSaved: (e)=> email = e,
                    controller: vemail,
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
                    onSaved: (e)=> password = e,
                    controller: vpassword,
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

                  Row(
                    children: <Widget>[

                      Checkbox(

                        value: _rememberMe,
                        onChanged: (value){
                          setState(() {

                            _rememberMe = value;
                          });
                        },
                      ),

                      Text(
                        'Remember me',
                        style: TextStyle(fontSize: 15),
                      ),

                      Spacer(),



                      FlatButton(
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> ForgotPass()));
                        },
                        padding: EdgeInsets.only(right: 0.0),
                        child: Text(
                          'Forgot Password?',
                          style: TextStyle(fontSize: 15),
                        ),
                      ),


                    ],
                  ),


              //    SizedBox(height: 30,),


                //  SizedBox(height: 30,),


                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Container(
                      height: 45,
                      width: 230,
                      child: RaisedButton(
                        onPressed:(){
                          checkApiLogin();
                        },

                        color: Colors.deepPurple,
                        child: Text("Login",style: TextStyle(fontSize: 15,color: Colors.white),),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        " Don\'t have an Account ? ",
                        style: TextStyle(fontSize: 16,color: Colors.grey[700]),
                      ),

                      SizedBox(width: 5,),
                      GestureDetector(
                        onTap: () {

                          Navigator.push(context, MaterialPageRoute(builder: (context)=> SignUp()));

                        },
                        child: Container(
                          child: Text(
                            "SignUp",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),


                ],
              ),
            ),
          ),
        );
        break;
      case LoginStatus.signIn :
        return HomePage(signOut);
        break;
    }
  }
}
