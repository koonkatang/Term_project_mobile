import 'dart:convert';
import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:project01/models/Detail.dart';
import 'package:project01/pages/gasha_page.dart';
import 'package:project01/pages/gasha_page2.dart';
import 'package:project01/repositories/detail_repository.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //@override
  // void initState() {
  //   super.initState();
  //   var data = DetailRepo.readJsonData('assets/data/detail.json');
  //   data.then(getResult);
  // }
  //
  // getResult(String result) {
  //   debugPrint(result);
  //   List list = jsonDecode(result);
  //   List<Detail> detailList = list.map((item) => Detail.fromJson(item)).toList();
  //
  // }
  List<Detail>? _details = [];
  var _isLoading = false;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    getDetails();
  }

  getDetails() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    await Future.delayed(Duration(seconds: 3));

    try {
      var details = await DetailRepo().getDetails();
      debugPrint('Number of detail: ${details.length}');

      setState(() {
        _details = details.cast<Detail>();
      });
    } catch (e) {
      setState(() {
        _errorMessage = e.toString();
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.orange,
        body: Center(
          child: Container(
            //height: MediaQuery.of(context).size.height / 2,
            padding: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: Colors.grey.withOpacity(0.1)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Container(
                        height: 50,
                        child: FittedBox(
                            child: Text(
                          "จำลองการอธิฐาน",
                        ))),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 40,
                        child: FittedBox(
                          child: Text(
                            'การอธิษฐาน "ทะเลดาวแห่งเปลวเพลิง": โอกาสได้รับ "ประกายเพลิงเริงระบำ - Yoimiya',
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => GaSha()));
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.height / 3,
                        child: Expanded(
                          child: Image.asset(
                            'assets/images/yoibanner.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 40,
                        child: FittedBox(
                          child: Text(
                            'การอธิษฐาน "ขับขานลำเนาธาร": โอกาสได้รับ "ระบำเดียวดายชั่วนิรันดร์ - Furina',
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => GaSha2()));
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.height / 3,
                        child: Image.asset(
                          'assets/images/FurinaBanner.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
