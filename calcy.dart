import 'package:flutter/material.dart';

class Myclacy extends StatefulWidget {
  const Myclacy({Key? key}) : super(key: key);

  @override
  State<Myclacy> createState() => _MyclacyState();
}

class _MyclacyState extends State<Myclacy> {
  String display = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            child: Text(
              display,
              style: TextStyle(fontSize: 50),
            ),
          ),
          Row(
            children: [
              Expanded(
                  child: ElevatedButton(
                      onPressed: () {
                        Getvalye("1");
                      },
                      child: Text("1"))),
              Expanded(
                  child: ElevatedButton(
                      onPressed: () {
                        Getvalye("2");
                      },
                      child: Text("2"))),
              Expanded(
                  child: ElevatedButton(
                      onPressed: () {
                        Oparatoerss("+");
                      },
                      child: Text("+"))),
              Expanded(
                  child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          seconf = double.parse(display);

                          display = "";

                          if (cntop == 1) {
                            display = "${first + seconf}";
                          }
                        });
                      },
                      child: Text("="))),
            ],
          ),
        ],
      ),
    );
  }

  void Getvalye(String s) {
    display = display + s;

    setState(() {});
  }

  void Oparatoerss(String s) {
    double temp = 0;

    temp = first;
    first = double.parse(display);

    if (cntop == 1) {
      first = temp + first;
    }

    display = "";
    if (s == "+") {
      cntop = 1;
    }
    setState(() {});
  }

  double first = 0;
  int cntop = 0;
  double seconf = 0;
}

//
