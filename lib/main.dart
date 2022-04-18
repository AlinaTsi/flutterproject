import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import './widgets/CalcButton.dart';

void main() {
  runApp(CalcApp());
}

class CalcApp extends StatefulWidget {
  const CalcApp({Key key}) : super(key: key);

  @override
  CalcAppState createState() => CalcAppState();
}

class CalcAppState extends State<CalcApp> {
  int firstNum;
  int secondNum;
  String textToDisplay = '';
  String history = '';
  String res;
  String operation;

  void btnOnClick(String btnVal)
  {
    if (btnVal == 'C'){
      textToDisplay = '';
      firstNum = 0;
      secondNum = 0;
      res = '';
    }
    else if (btnVal == 'AC'){
      textToDisplay = '';
      firstNum = 0;
      secondNum = 0;
      res = '';
      history = '';
    }
    else if (btnVal == '+' || btnVal == '-' || btnVal == '*' || btnVal == '/')
      {
        firstNum = int.parse(textToDisplay);
        res = '';
        operation = btnVal;
      }
    else if (btnVal == '='){
      secondNum = int.parse(textToDisplay);
      if (operation == '+'){
        res = (firstNum + secondNum).toString();
        history = firstNum.toString() + operation.toString() + secondNum.toString();
      }
      if (operation == '-'){
        res = (firstNum - secondNum).toString();
        history = firstNum.toString() + operation.toString() + secondNum.toString();
      }
      if (operation == '*'){
        res = (firstNum * secondNum).toString();
        history = firstNum.toString() + operation.toString() + secondNum.toString();
      }
      if (operation == '/'){
        res = (firstNum / secondNum).toString();
        history = firstNum.toString() + operation.toString() + secondNum.toString();
      }
    }
    else{
      res = int.parse(textToDisplay + btnVal).toString();
    }

    setState(() {
      textToDisplay = res;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      home: Scaffold(
        backgroundColor: Color(0xFF283637),
        body: Container(
          padding: EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                child: Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: Text(
                    history,
                    style: GoogleFonts.rubik(
                      textStyle: TextStyle(
                        fontSize: 24,
                        color: Color(0xFF545F61),
                      ),
                    ),
                  ),
                ),
                alignment: Alignment(1.0, 1.0),
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Text(
                    textToDisplay,
                    style: GoogleFonts.rubik(
                      textStyle: TextStyle(
                        fontSize: 48,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                alignment: Alignment(1.0, 1.0),
              ),
              SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CalcButton(
                    text: 'AC',
                    fillColor: 0xFF6C807F,
                    textSize: 20,
                    callback: btnOnClick,
                  ),
                  CalcButton(
                    text: 'C',
                    fillColor: 0xFF6C807F,
                    callback: btnOnClick,
                  ),
                  CalcButton(
                    text: '%',
                    fillColor: 0xFFFFFFFF,
                    textColor: 0xFF65BDAC,
                    callback: btnOnClick,
                  ),
                  CalcButton(
                    text: '/',
                    fillColor: 0xFFFFFFFF,
                    textColor: 0xFF65BDAC,
                    callback: btnOnClick,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CalcButton(
                    text: '7',
                    callback: btnOnClick,
                  ),
                  CalcButton(
                    text: '8',
                    callback: btnOnClick,
                  ),
                  CalcButton(
                    text: '9',
                    callback: btnOnClick,
                  ),
                  CalcButton(
                    text: '*',
                    fillColor: 0xFFFFFFFF,
                    textColor: 0xFF65BDAC,
                    textSize: 24,
                    callback: btnOnClick,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CalcButton(
                    text: '4',
                    callback: btnOnClick,
                  ),
                  CalcButton(
                    text: '5',
                    callback: btnOnClick,
                  ),
                  CalcButton(
                    text: '6',
                    callback: btnOnClick,
                  ),
                  CalcButton(
                    text: '-',
                    fillColor: 0xFFFFFFFF,
                    textColor: 0xFF65BDAC,
                    textSize: 38,
                    callback: btnOnClick,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CalcButton(
                    text: '1',
                    callback: btnOnClick,
                  ),
                  CalcButton(
                    text: '2',
                    callback: btnOnClick,
                  ),
                  CalcButton(
                    text: '3',
                    callback: btnOnClick,
                  ),
                  CalcButton(
                    text: '+',
                    fillColor: 0xFFFFFFFF,
                    textColor: 0xFF65BDAC,
                    textSize: 30,
                    callback: btnOnClick,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CalcButton(
                    text: '.',
                    callback: btnOnClick,
                  ),
                  CalcButton(
                    text: '0',
                    callback: btnOnClick,
                  ),
                  CalcButton(
                    text: '00',
                    callback: btnOnClick,
                    textSize: 26,
                  ),
                  CalcButton(
                    text: '=',
                    fillColor: 0xFFFFFFFF,
                    textColor: 0xFF65BDAC,
                    callback: btnOnClick,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
