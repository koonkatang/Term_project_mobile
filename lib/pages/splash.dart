import 'dart:html';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:project01/pages/home_page.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);



  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState(){
    super.initState();
    _navigatetohome();
  }
_navigatetohome() async{
    await Future.delayed(Duration(milliseconds: 5000), () {});
    Navigator.push(context, MaterialPageRoute(builder: (context)=> HomePage()));
}


  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children:[
          Container(
            decoration: BoxDecoration(color: Colors.grey),
          ),
          Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(

                 child: Image.asset('assets/images/Genshin_Impact_logo.png',),

                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Text(
                    'ระบบทดสอบสุ่มตัวละคร',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold,color: Colors.black),
                  ),
                ),
              ),
            ],
          ),
        ),]
      ),
    );
  }
}
