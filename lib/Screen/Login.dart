import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task1/Screen/home_screen.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _username =TextEditingController();
  TextEditingController _password =TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: ScreenUtil().setWidth(360),
              height: ScreenUtil().setHeight(200),
              child: Image.asset('assets/images/back.jpg'),
            ),
            Container(
              padding: EdgeInsets.all(8),
              margin: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black12,
                      offset: Offset(0, 15.0),
                      blurRadius: 15
                  ),
                  BoxShadow(
                      color: Colors.black12,
                      offset: Offset(0, -10.0),
                      blurRadius: 10
                  )
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 Text('Login',style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
                  SizedBox(height: ScreenUtil().setHeight(10),),
                  Text("Username",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                  TextFormField(
                    controller:_username ,
                    decoration: InputDecoration(
                      hintText: "username",

                    ),
                  ),
                  SizedBox(height: ScreenUtil().setHeight(10),),
                  Text("Password",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "password",
                    ),
                    controller: _password,
                  ),
              ]
            ),


              ),

            Container(
              width: ScreenUtil().setWidth(100),
              height: ScreenUtil().setHeight(40),
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(.3),
                        offset: Offset(0, 8.0),
                        blurRadius: 2
                    )
                  ],
                  gradient: LinearGradient(
                      colors: [Colors.blue, Colors.deepPurple]),
                  borderRadius: BorderRadius.circular(8)),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  child: Center(child: Text("Submit",style: TextStyle(color: Colors.white),)),
                    onTap:()  {
                    Navigator.push(context,MaterialPageRoute(builder: (context) => HomeScreen()),);

                    }
                ),
              ),
            ),
          ],
        ),

      ),

    );
  }
}
