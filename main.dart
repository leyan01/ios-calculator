import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:swipe_to/swipe_to.dart';

void main() {
  runApp(
    MaterialApp(
      home: Myapp(),
    ),
  );
}

class Myapp extends StatefulWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  State<Myapp> createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  StringBuffer output = StringBuffer();

  double num1 = 0, num2 = 0, c = 0, temp = 0, a = 0;
  String sign = "";

  int num = 0;

  Color defallt = Colors.orange;
  Color clickcolor = Colors.white;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    output.write(0);
  }

  void op_fun(btnlable, Color colorhh) {
    temp = 0;
    if (output.isNotEmpty) {
      num1 = double.parse(output.toString());
    }
    if (btnlable == "+") {
      if (sign == "-") {
        minus();
        sign = "+";
      } else if (sign == "x") {
        mul();
        sign = "+";
        // num=1;
      } else if (sign == "/") {
        div();
        sign = "+";
        // num=1;
      } else {
        sign = "+";
        // num = 1;
        sum();
      }
      num = 1;
    } else if (btnlable == "-") {
      if (sign == "+") {
        sum();
        sign = "-";
      } else if (sign == "x") {
        mul();
        sign = "-";
        // num=1;
      } else if (sign == "/") {
        div();
        sign = "-";
        // num=1;
      } else {
        sign = "-";
        // num = 1;
        minus();
      }
      num = 1;
    } else if (btnlable == "x") {
      if (sign == "-") {
        minus();
        sign = "x";
      } else if (sign == "+") {
        sum();
        sign = "x";
        // num=1;
      } else if (sign == "/") {
        div();
        sign = "x";
        // num=1;
      } else {
        sign = "x";
        // num = 1;
        mul();
      }
      num = 1;
    } else if (btnlable == "/") {
      if (sign == "-") {
        minus();
        sign = "/";
      } else if (sign == "+") {
        sum();
        sign = "/";
        // num=1;
      } else if (sign == "x") {
        mul();
        sign = "/";
        // num=1;
      } else {
        sign = "/";
        // num = 1;
        div();
      }
      num = 1;
    } else if (btnlable == "AC") {
      num1 = 0;
      num2 = 0;
      num = 0;
      c = 0;
      temp = 0;

      output.clear();
      output.write("0");
      sign = "";
    } else if (btnlable == "+/-") {
      String s = output.toString();
      output.clear();
      if (s.contains("-")) {
        output.write(s.substring(1, s.length));
      } else {
        output.write("-$s");
      }
    }

    // if (btnlable == "AC") {
    // } else {
    //   output.clear();
    //   output.write(c);
    // }

    setState(() {
      // btnBuilder();
      // output;
    });
  }

  void equal_fun() {
    num2 = double.parse(output.toString());

    output.clear();

    if (sign == "+") {
      if (temp == 0) {
        output.write(c + num2);
        c = 0;
        a = num2;
      } else {
        output.write(num2 + a);
      }
    } else if (sign == "-") {
      if (temp == 0) {
        output.write(c - num2);
        c = 0;
        a = num2;
      } else {
        output.write(num2 - a);
      }
      // output.write(c - num2);
      // c = 0;
    } else if (sign == "x") {
      if (temp == 0) {
        output.write(c * num2);
        c = 0;
        a = num2;
      } else {
        output.write(num2 * a);
      }
      // output.write((c * num2));
      // c = 0;
    } else if (sign == "/") {
      if (temp == 0) {
        output.write(c / num2);
        c = 0;
        a = num2;
      } else {
        output.write(num2 / a);
      }
      // output.write((num1 / num2));
      // c = 0;
    }
    temp = 1;
    String s = output.toString();
    if (s.endsWith(".0")) {
      output.clear();
      output.write(s.substring(0, s.length - 2));
    }
    setState(() {});
  }

  void num_fun(btnlable) {
    if (temp == 1) {
      num1 = 0;
      num2 = 0;
      num = 0;
      c = 0;
      temp = 0;

      output.clear();
      output.write("0");
      sign = "";
    }

    // temp = 0;
    if (num == 1) {
      output.clear();
      num = 0;
    }
    if (btnlable == "0") {
      if (output.toString().startsWith("0") && output.length == 1) {
      } else {
        output.write(btnlable);
      }
    } else if (btnlable == ".") {
      if (output.toString().contains(".")) {
      } else if (output.toString().isEmpty) {
        output.write("0");
        output.write(btnlable);
      } else {
        output.write(btnlable);
      }
    } else {
      if (output.toString().length == 1 && output.toString().contains("0")) {
        output.clear();
        output.write(btnlable);
      } else {
        output.write(btnlable);
      }
    }
    // if(temp!=0||)
    setState(() {
      output;
    });
    print(output);
  }

  void o_remove() {
    String s = c.toString();
    if (s.endsWith(".0")) {
      output.clear();
      output.write(s.substring(0, s.length - 2));
    } else {
      output.clear();
      output.write(s);
    }
  }

  void sum() {
    c = c + num1;
    o_remove();
  }

  void minus() {
    if (c == 0) {
      c = (num1 - c);
    } else {
      c = (c - num1);
    }
    o_remove();
  }

  void mul() {
    if (c == 0) {
      c = (c + 1) * num1;
    } else {
      c = c * num1;
    }
    o_remove();
  }

  void div() {
    if (c == 0) {
      c = num1;
    } else {
      c = c / num1;
    }
    o_remove();
  }

  Widget btnBuilder(String btnlable, Color bgcolor, Color color) {
    return Expanded(
      flex: 1,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          child: Container(
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(37.5)),
                color: bgcolor),
            width: 75,
            height: 75,
            alignment: Alignment.center,
            child: Text(
              btnlable,
              style: TextStyle(
                  fontSize: 40, fontWeight: FontWeight.bold, color: color),
            ),
          ),
          onTap: () {
            num_fun(btnlable);
          },
        ),
      ),
    );
  }

  Widget fun_btnBuilder(String btnlable, Color bgcolor, Color color) {
    return Expanded(
      flex: 1,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          child: Container(
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(37.5)),
                color: bgcolor),
            width: 75,
            height: 75,
            alignment: Alignment.center,
            child: Text(
              btnlable,
              style: TextStyle(
                  fontSize: 40, fontWeight: FontWeight.bold, color: color),
            ),
          ),
          onTap: () {
            if (btnlable == "=") {
              equal_fun();
            } else {
              op_fun(btnlable, bgcolor);
            }
          },
        ),
      ),
    );
  }

  void drag() {
    if (output.length == 1) {
      output.clear();
      output.write("0");
    } else {
      if (output.length == 2) {
        if (output.toString().contains("-")) {
          output.clear();
          output.write("0");
        } else {
          String a = output.toString().substring(0, output.length - 1);
          output.clear();
          output.write(a);
        }
      } else {
        String a = output.toString().substring(0, output.length - 1);
        output.clear();
        output.write(a);
      }
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    print("======$sign");
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8, 8, 50, 0),
                child: SwipeTo(
                  onRightSwipe: () {
                    drag();
                  },
                  child: Container(
                    width: double.infinity,
                    color: Colors.black12,
                    alignment: Alignment.bottomRight,
                    child: InkWell(
                      onLongPress: () {
                        Clipboard.getData(Clipboard.kTextPlain).then((value){

                          // value
                          setState(() {
                           output.clear();
                           output.write(value==null?"0":value.text);
                          });

                        });
                      },
                      child: SelectableText(
                        "$output",
                        style: const TextStyle(
                            fontSize: 70, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          fun_btnBuilder("AC", Colors.grey, Colors.black),
                          fun_btnBuilder("+/-", Colors.grey, Colors.black),
                          fun_btnBuilder("%", Colors.grey, Colors.black),
                          fun_btnBuilder(
                              "/",
                              sign == "/" && num == 1 ? clickcolor : defallt,
                              sign == "/" && num == 1 ? defallt : clickcolor),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          btnBuilder("7", Colors.grey[850]!, Colors.white),
                          btnBuilder("8", Colors.grey[850]!, Colors.white),
                          btnBuilder("9", Colors.grey[850]!, Colors.white),
                          fun_btnBuilder(
                              "x",
                              sign == "x" && num == 1 ? clickcolor : defallt,
                              sign == "x" && num == 1 ? defallt : clickcolor),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          btnBuilder("4", Colors.grey[850]!, Colors.white),
                          btnBuilder("5", Colors.grey[850]!, Colors.white),
                          btnBuilder("6", Colors.grey[850]!, Colors.white),
                          fun_btnBuilder(
                              "-",
                              sign == "-" && num == 1 ? clickcolor : defallt,
                              sign == "-" && num == 1 ? defallt : clickcolor),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          btnBuilder("1", Colors.grey[850]!, Colors.white),
                          btnBuilder("2", Colors.grey[850]!, Colors.white),
                          btnBuilder("3", Colors.grey[850]!, Colors.white),
                          fun_btnBuilder(
                              "+",
                              sign == "+" && num == 1 ? clickcolor : defallt,
                              sign == "+" && num == 1 ? defallt : clickcolor),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Flexible(
                            fit: FlexFit.loose,
                            flex: 2,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: InkWell(
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(37.5)),
                                      color: Colors.grey[850]!),
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(20, 0, 0, 0),
                                    child: Text(
                                      "0",
                                      style: TextStyle(
                                          fontSize: 40,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                  ),
                                  width: 200,
                                  height: 75,
                                  alignment: Alignment.centerLeft,
                                ),
                                onTap: () {
                                  num_fun("0");
                                },
                              ),
                            ),
                          ),
                          btnBuilder(".", Colors.grey[850]!, Colors.white),
                          fun_btnBuilder("=", Colors.orange, Colors.white),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
