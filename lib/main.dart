import 'dart:async';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  return runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  int sec = 0;
  int min = 0;
  int hour = 0;

  void initState() {
    // TODO: implement initState
    super.initState();
    timer();
  }

  void timer() {
    setState(() {
      Future.delayed(
        Duration(seconds: 1),
        () {
          timer();
          setState(() {
            DateTime dateTime = DateTime.now();
            min = dateTime.minute;
            sec = dateTime.second;
            hour = dateTime.hour;
          });
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: Text("Clock")),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: Colors.black26),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    //Seconds
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Transform.rotate(
                        angle: (pi / 30) * sec,
                        child: Column(
                          children: [
                            Expanded(
                                child: Container(
                              width: 2,
                              color: Colors.red,
                            )),
                            Container(
                              height: 5,
                              width: 5,
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(75)),
                            ),
                            Expanded(
                                child: Container(
                              width: 2,
                              color: Colors.transparent,
                            ))
                          ],
                        ),
                      ),
                    ),
                    //minutes
                    Padding(
                      padding: EdgeInsets.all(14),
                      child: Transform.rotate(
                        angle: (pi / 30) * min,
                        child: Column(
                          children: [
                            Expanded(
                                child: Container(
                              width: 2,
                              color: Colors.black54,
                            )),
                            Container(
                              height: 5,
                              width: 5,
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(75)),
                            ),
                            Expanded(
                                child: Container(
                              width: 2,
                              color: Colors.transparent,
                            ))
                          ],
                        ),
                      ),
                    ),
                    //hours
                    Padding(
                      padding: EdgeInsets.all(28),
                      child: Transform.rotate(
                        angle: (pi / 6) * hour,
                        child: Column(
                          children: [
                            Expanded(
                                child: Container(
                              width: 2,
                              color: Colors.black54,
                            )),
                            Container(
                              height: 5,
                              width: 5,
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(75)),
                            ),
                            Expanded(
                                child: Container(
                              width: 2,
                              color: Colors.transparent,
                            ))
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              "Time : $hour hour : $min Minute: $sec Second",
              style: TextStyle(fontSize:20),
            )
          ],
        ),
      ),
    );
  }
}
