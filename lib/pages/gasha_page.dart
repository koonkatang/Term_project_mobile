import 'dart:math';
import 'package:project01/models/Detail.dart';
import 'package:project01/pages/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project01/repositories/detail_repository.dart';

class GaSha extends StatefulWidget {
  const GaSha({Key? key}) : super(key: key);
  @override
  _GaShaState createState() => _GaShaState();
}

class _GaShaState extends State<GaSha> {
  late Detail detail;
  void _showMaterialDialog(
    String title,
    String picture,
  ) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              'รางวัลอธิฐาน',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            content: Expanded(
              child: Column(children: [
                Expanded(
                  child: Image.asset(
                    '$picture',
                  ),
                ),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 22,
                  ),
                  textAlign: TextAlign.center,
                ),
              ]),
            ),
            actions: [
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(color: Colors.orange),
          ),
          SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Text(
                                'อธิฐานตัวละคร',
                                style: TextStyle(
                                    fontSize: 50, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        _buildHeader(),
                      ],
                    ),
                  ],
                ))
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [

          Container(
            //height: MediaQuery.of(context).size.height/2.5,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Image.asset(
                'assets/images/yoibanner.png',
                fit: BoxFit.cover,
              ),
            ),
          ),

        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            height: 50,
            child: FittedBox(
              child: Text(
                'การอธิษฐาน "ทะเลดาวแห่งเปลวเพลิง": โอกาสได้รับ "ประกายเพลิงเริงระบำ - Yoimiya',
              ),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: SizedBox(
                  child: ElevatedButton(
                    //padding: EdgeInsets.symmetric(vertical: 8, horizontal: 30),
                    onPressed: () {
                      String text;
                      String picture;
                      List<String> fourStar = [
                        'assets/images/Character_Sayu_Portrait.png',
                        'assets/images/Diona_Portrait.png',
                        'assets/images/Xinyan_Portrait.png',
                      ];
                      List<String> nameFourstar = ['Sayu', 'Diona', 'Xinyan'];
                      int _random = Random().nextInt(10) + 1;
                      int _random2 = Random().nextInt(3);
                      if (_random == 1) {
                        text = '5 ดาว\nYoimiya';
                        picture = ('assets/images/Character_Yoimiya_Portrait.png');
                        _showMaterialDialog(
                          text,
                          picture,
                        );
                      } else {
                        text = '4 ดาว\n ' + nameFourstar[_random2];
                        picture = fourStar[_random2];
                        _showMaterialDialog(text, picture);
                      }
                    },
                    //color: Colors.indigo,
                    //shape: RoundedRectangleBorder(
                    //borderRadius: BorderRadius.all(Radius.circular(30))),
                    style: ElevatedButton.styleFrom(primary: Colors.deepOrange),
                    child: Text(
                      'สุ่ม',
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: SizedBox(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HomePage()));
                    },
                    style: ElevatedButton.styleFrom(primary: Colors.deepOrange),
                    child: Text(
                      'กลับ',
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),

          ],
        ),
          SizedBox(
              child: ElevatedButton(
                onPressed: () {
                  openDialog();
                },
                style: ElevatedButton.styleFrom(primary: Colors.white24),
                child: Text(
                  'รายละเอียด',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
            ),
      ],
    );
  }
  void openDialog() => showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text('〓 แนะนำการอธิษฐาน 〓'),
      content: Text(
        'โอกาสได้รับ\n5 ดาว "ประกายเพลิงเริงระบำ - Yoimiya\n4 ดาว "นินจามูจิน่า - Sayu\n4 ดาว"เหมียวน้อยบาร์เทนเดอร์ - Diona\n4 ดาว"เมโลดี้อันร้อนแรง - Xinyan\nจากการอธิษฐานจะเพิ่มมากขึ้น!'
        ,style: TextStyle(fontSize: 25),),
      actions: [
        OutlinedButton(onPressed: Navigator.of(context).pop, child: Text('ปิด')),
      ],
    ),
  );
}
