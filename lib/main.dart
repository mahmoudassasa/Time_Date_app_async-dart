// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import "dart:async";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: TimeDateApp(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class TimeDateApp extends StatefulWidget {
  const TimeDateApp({super.key});

  @override
  State<TimeDateApp> createState() => _TimeDateAppState();
}

class _TimeDateAppState extends State<TimeDateApp> {
  String year = "";
  String month = "";
  String monthDay = "";
  String weekDay = "";
  int hour = 0;
  String minute = "";
  String second = "";
  String ampm = "AM";

  changeEverySecond() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        year = DateTime.now().year.toString();
        month = DateTime.now().month.toString();
        monthDay = DateTime.now().day.toString();
        weekDay = DateTime.now().weekday.toString();
        hour = DateTime.now().hour;
        if (hour > 12) {
          hour = hour - 12;
          ampm = "PM";
        }

        minute = DateTime.now().minute.toString();
        second = DateTime.now().second.toString();
        switch (month) {
          case "1":
            month = "January";
            break;
          case "2":
            month = "February";
            break;
          case "3":
            month = "March";
            break;
          case "4":
            month = "April";
            break;
          case "5":
            month = "May";
            break;
          case "6":
            month = "June";
            break;
          case "7":
            month = "July";
            break;
          case "8":
            month = "August";
            break;
          case "9":
            month = "September";
            break;
          case "10":
            month = "October";
            break;
          case "11":
            month = "November";
            break;
          case "12":
            month = "December";
            break;

          default:
        }
        switch (weekDay) {
          case "1":
            weekDay = "Monday";
            break;
          case "2":
            weekDay = "Tuesday";
            break;
          case "3":
            weekDay = "Wednesday";
            break;
          case "4":
            weekDay = "Thursday";
            break;
          case "5":
            weekDay = "Friday";
            break;
          case "6":
            weekDay = "Saturday";
            break;
          case "7":
            weekDay = "Sunday";
            break;
          default:
        }
      });
    });
  }

  String sayWelcom = "";
  changeAfter7Second() {
    Timer(Duration(seconds: 7), () {
      setState(() {
        sayWelcom = "Welcome";
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    changeEverySecond();
    changeAfter7Second();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 33, 40, 43),
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Time & Date App",
          style: TextStyle(
              fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 57, 73, 80),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Today's Date Is : $weekDay",
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "$month $monthDay, $year",
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "${hour.toString().padLeft(2, "0")} : ${minute.padLeft(2, "0")} : ${second.padLeft(2, "0")} $ampm",
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              sayWelcom,
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
