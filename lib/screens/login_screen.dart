import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/curve_clipper.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery
              .of(context)
              .size
              .height,
          child: Column(
              children: [
          ClipPath(
            clipper: CurveClipper(),
            child: Image(
            image: AssetImage("assets/images/login_background.jpg"),
            height: MediaQuery
                .of(context)
                .size
                .height * 0.4,
            width: double.infinity,
            fit: BoxFit.cover,
        ),
          ),
        Text(
          'FRENZY',
          style: TextStyle(
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
            color: Theme
                .of(context)
                .primaryColor,
            letterSpacing: 1.0,
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.account_box,
                    size: 30.0,
                  ),
                  hintText: 'Username',
                  contentPadding: EdgeInsets.symmetric(vertical: 16.0),
                  fillColor: Colors.white,
                  filled: true,
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              TextFormField(
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.lock,
                    size: 30.0,
                  ),
                  hintText: 'Password',
                  contentPadding: EdgeInsets.symmetric(vertical: 16.0),
                ),
                obscureText: true,
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: ()async{
            await Future.delayed(Duration(seconds: 2));
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
          },
          child: Container(
            height: 50.0,
            margin: EdgeInsets.symmetric(
              horizontal: 50.0,
              vertical: 40,
            ),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Theme
                  .of(context)
                  .primaryColor,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Text(
              'Login',
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.white,
                fontWeight: FontWeight.w600,
                letterSpacing: 1.0,
              ),
            ),
          ),
        ),
        Expanded(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: GestureDetector(
              onTap: (){},
              child: Container(
                height: 80.0,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Theme
                      .of(context)
                      .primaryColor,
                ),
                child: RichText(
                  text: TextSpan(
                      text: 'Don\'t have an account? ',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                      children: [
                      TextSpan(
                        text:'Sign up',
                        style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                     ),
                   ),
                ],
              ),
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
