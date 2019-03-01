import 'package:flutter/material.dart';
import "appConfig.dart";

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.

        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Calculator App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  //fields in widget always final.
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  buttonPressed(String value) {
    if (value == "AC") {
      result = "0";
      num1 = 0;
      num2 = 0;
      operand = "";
    }
    else if (value == "+" || value == "-" || value == "x" || value == "/") {
        num1 = int.parse(displayRes);
        operand = value;
        result = "";
    }
    else if (value == "=") {
      num2 = int.parse(displayRes);
      if (operand == "+") result = (num1 + num2).toString();
      if (operand == "-") result = (num1 - num2).toString();
      if (operand == "/") result = (num1 / num2).toString();
      if (operand == "x") result = (num1 * num2).toString();

    }
    else {
      result = result + value;
    }

    setState(() {
      if (operand == "/" && value == "=")
        displayRes = double.parse(result).toStringAsFixed(3);
      else displayRes = int.parse(result).toString();

      if (value == "=") {
        num1 = 0;
        num2 = 0;
        operand = "";
      }
    });
  }

  Widget myButton(var value) {
    return Expanded(
        child: OutlineButton(
      padding: EdgeInsets.all(CAL_BUTTON_PADDING),
      child: Text(value,
          style:
              TextStyle(fontSize: CAL_TEXT_SIZE, fontWeight: FontWeight.bold)),
      onPressed: () => buttonPressed(value),
    ));
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done

    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(widget.title),
        ),
        body: Container(
            child: Column(children: <Widget>[
          //result go here
          Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.symmetric(vertical: 25.0, horizontal: 15.0),
              child: Text(
                displayRes,
                style: TextStyle(
                    fontSize: RESULT_TEXT_SIZE, fontWeight: FontWeight.bold),
              )),

          Expanded(child: Divider()),

          //Column contains all row and all button, each row contain buttons
          Column(
            children: <Widget>[
              //Row 1: number : 1 2 3
              Row(children: [
                myButton("AC"),
                myButton(""),
                myButton(""),
                myButton("/")
              ]),

              //Row 2
              Row(children: [
                myButton("7"),
                myButton("8"),
                myButton("9"),
                myButton("x")
              ]),

              Row(children: [
                myButton("4"),
                myButton("5"),
                myButton("6"),
                myButton("-")
              ]),

              Row(children: [
                myButton("1"),
                myButton("2"),
                myButton("3"),
                myButton("+")
              ]),

              Row(children: [myButton("0"), myButton("=")]),
            ],
          )
        ])));
  }
}
