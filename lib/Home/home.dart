//
//import 'dart:convert';
//import 'dart:developer';
//
//import 'package:carousel_pro/carousel_pro.dart';
//import 'package:flutter/material.dart';
//import 'package:gagro/Api/api.dart';
//import 'package:gagro/Login/login.dart';
//import 'package:shared_preferences/shared_preferences.dart';
//
//class HomePage extends StatefulWidget {
//  @override
//  _HomePageState createState() => _HomePageState();
//}
//
//class _HomePageState extends State<HomePage> {
//
//
//  var userData;
//  @override
//  void initState() {
//    _getUserInfo();
//    super.initState();
//  }
//
//  void _getUserInfo() async {
//    SharedPreferences localStorage = await SharedPreferences.getInstance();
//    var userJson = localStorage.getString('user');
//    var user = json.decode(userJson);
//    setState(() {
//      userData = user;
//    });
//
//  }
//
//  Widget imageCraousel = Container(
//    height: 200,
//    width: double.infinity,
//    child: Carousel(
//      boxFit: BoxFit.cover,
//      images: [
//        AssetImage("assets/logos/abcd.jpg"),
//        AssetImage("assets/logos/abcd.jpg"),
//        AssetImage("assets/logos/abcd.jpg"),
//      ],
//      autoplay: false,
//      animationCurve: Curves.fastOutSlowIn,
//    ),
//  );
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        backgroundColor: Colors.purple,
//        actions: <Widget>[
//          FlatButton(
//            child: Text("Logout",style: TextStyle(fontSize: 15,color: Colors.white),),
//            onPressed: logout,
//          ),
//        ],
//      ),
//      body: SingleChildScrollView(
//        child: Container(
//          padding: EdgeInsets.all(15),
//          child: Column(
//            crossAxisAlignment: CrossAxisAlignment.start,
//            children: <Widget>[
//              imageCraousel,
//              SizedBox(height: 20,),
//              Text("Categories",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
//              Container(
//                height: 80,
//                margin: EdgeInsets.symmetric(vertical: 20),
//                child: ListView(
//                  scrollDirection: Axis.horizontal,
//                  children: <Widget>[
//
//                    GestureDetector(
//                      onTap: (){
//
//                      },
//                      child:
//                      Container(
//                        width: 150,
//                        child: Card(
//                          child: Wrap(
//                            children: <Widget>[
//                              Image.asset("assets/logos/sobji.png"),
//                              Container(
//                                  padding: EdgeInsets.all(8),
//                                  alignment: Alignment.topCenter,
//                                  child: Text("সবজি",style: TextStyle(fontSize: 18),))
//
//                            ],
//                          ),
//                        ),
//                      ),
//                    ),
//
//
//
//
//                    GestureDetector(
//                      onTap: (){
//
//                      },
//                      child: Container(
//                        width: 150,
//                        child: Card(
//                          child: Wrap(
//                            children: <Widget>[
//                              Image.asset("assets/logos/fish.jpeg"),
//                              Container(
//                                  padding: EdgeInsets.all(8),
//                                  alignment: Alignment.topCenter,
//                                  child: Text("মাছ",style: TextStyle(fontSize: 18),))
//
//                            ],
//                          ),
//                        ),
//                      ),
//                    ),
//
//                    GestureDetector(
//                      onTap: (){
//
//                      },
//                      child: Container(
//                        width: 150,
//                        child: Card(
//                          child: Wrap(
//                            children: <Widget>[
//                              Image.asset("assets/logos/folmul.jpeg"),
//                              Container(
//                                  padding: EdgeInsets.all(8),
//                                  alignment: Alignment.topCenter,
//                                  child: Text("ফলমুল",style: TextStyle(fontSize: 18),))
//
//                            ],
//                          ),
//                        ),
//                      ),
//                    ),
//
//
//                    GestureDetector(
//                      onTap: (){
//
//                      },
//                      child: Container(
//                        width: 150,
//                        child: Card(
//                          child: Wrap(
//                            children: <Widget>[
//                              Image.asset("assets/logos/mosla.jpeg"),
//                              Container(
//                                  padding: EdgeInsets.all(8),
//                                  alignment: Alignment.topCenter,
//                                  child: Text("মসলা",style: TextStyle(fontSize: 18),))
//
//                            ],
//                          ),
//                        ),
//                      ),
//                    ),
//
//
//                    GestureDetector(
//                      onTap: (){
//
//                      },
//                      child: Container(
//                        width: 150,
//                        child: Card(
//                          child: Wrap(
//                            children: <Widget>[
//                              Image.asset("assets/logos/chaldal.jpeg"),
//                              Container(
//                                  padding: EdgeInsets.all(8),
//                                  alignment: Alignment.topCenter,
//                                  child: Text(" চাল ও ডাল",style: TextStyle(fontSize: 18),))
//
//                            ],
//                          ),
//                        ),
//                      ),
//                    ),
//
//
//
//
//
//                    GestureDetector(
//                      onTap: (){
//
//                      },
//                      child: Container(
//                        width: 150,
//                        child: Card(
//                          child: Wrap(
//                            children: <Widget>[
//                              Image.asset("assets/logos/dim.jpeg"),
//                              Container(
//                                  padding: EdgeInsets.all(8),
//                                  alignment: Alignment.topCenter,
//                                  child: Text(" ডিম",style: TextStyle(fontSize: 18),))
//
//                            ],
//                          ),
//                        ),
//                      ),
//                    ),
//
//                    GestureDetector(
//                      onTap: (){
//
//                      },
//                      child: Container(
//                        width: 150,
//                        child: Card(
//                          child: Wrap(
//                            children: <Widget>[
//                              Image.asset("assets/logos/sutki.jpeg"),
//                              Container(
//                                  padding: EdgeInsets.all(8),
//                                  alignment: Alignment.topCenter,
//                                  child: Text(" শুটকি",style: TextStyle(fontSize: 18),))
//
//                            ],
//                          ),
//                        ),
//                      ),
//                    ),
//
//
//
//
//                    GestureDetector(
//                      onTap: (){
//
//                      },
//                      child: Container(
//                        width: 150,
//                        child: Card(
//                          child: Wrap(
//                            children: <Widget>[
//                              Image.asset("assets/logos/modhu.jpeg"),
//                              Container(
//                                  padding: EdgeInsets.all(8),
//                                  alignment: Alignment.topCenter,
//                                  child: Text(" মধু",style: TextStyle(fontSize: 18),))
//
//                            ],
//                          ),
//                        ),
//                      ),
//                    ),
//                  ],
//                ),
//              ),
//            ],
//          ),
//        ),
//      ),
//
//    );
//  }
//
//  void logout() async{
//    // logout from the server ...
//    SharedPreferences localStorage = await SharedPreferences.getInstance();
//    var data = {
//      //'token' : 'kjkbkjbilblbljgliyvlk'
//    };
//    log('profile $data');
//    var res = await CallApi().postData(data,'/logout');
//    var body = json.decode(res.body);
//    log('logout $body');
//    if(body['message'] != null){
//      SharedPreferences localStorage = await SharedPreferences.getInstance();
//      localStorage.remove('name');
//      localStorage.remove('access_token');
//      Navigator.push(
//          context,
//          new MaterialPageRoute(
//              builder: (context) => Login()));
//    }
//  }
//  void profile() async{
//    // logout from the server ...
//    var res = await CallApi().getData('profile');
//    var body = json.decode(res.body);
//    log('profile $body');
//
//  }
//}



        import 'package:flutter/material.dart';

      class HomePage extends StatefulWidget {

       final VoidCallback  signOut;
       HomePage(this.signOut);

        @override
        _HomePageState createState() => _HomePageState();
      }

      class _HomePageState extends State<HomePage> {

        signOut(){

          setState(() {

            widget.signOut();

          });

        }


        @override
        Widget build(BuildContext context) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.purple,
              title: Text("Ecommerce"),
              actions: <Widget>[
                FlatButton(
                  child: Text("Logout",style: TextStyle(fontSize: 17,color: Colors.white),),
                //  color: Colors.white,
                  onPressed: (){
                    signOut();
                  },
                ),
              ],
            ),
          );
        }
      }



































































