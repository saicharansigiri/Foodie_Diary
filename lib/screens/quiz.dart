import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodie/quizbrain/quizbrain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

Quizbrain quizBrain = Quizbrain();
class MyQuizPage extends StatefulWidget {
  @override
  _MyQuizPageState createState() => _MyQuizPageState();
}

class _MyQuizPageState extends State<MyQuizPage> {

  int totalquestions=quizBrain.getquestionbanklength();
  int myresult=0;
  void resetmyresult(){
    myresult = 0;
  }
  void checkanswer(bool userpickedanswer){
    setState(() {
      if(quizBrain.checkfinished()){
        quizBrain.reset();
        Alert(context: context,title: 'Finished',desc: "Score:$myresult/$totalquestions").show();
        resetmyresult();
      }
      else {

        bool correctanswer = quizBrain.getanswer();
        if (  userpickedanswer == correctanswer) {
          myresult += 1;

        }
        quizBrain.nextquestion();
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Fun Food Facts Quiz',style: TextStyle(letterSpacing: 2.0,fontWeight:FontWeight.bold),),
        centerTitle: true,
      ),
      backgroundColor: Colors.black,
       body: Column(
         mainAxisAlignment: MainAxisAlignment.spaceBetween,
         crossAxisAlignment: CrossAxisAlignment.stretch,
         children: <Widget>[
           Expanded(
             flex: 5,
             child: Padding(
               padding: EdgeInsets.all(10),
               child: Center(
                 child: Text(
                   quizBrain.getquestion(),
                   textAlign: TextAlign.center,
                   style: TextStyle(color: Colors.white),
                 ),
               ),
             ),
           ),
           Expanded(
             child: Padding(
               padding: EdgeInsets.all(15.0),
               child: FlatButton(
                 textColor: Colors.white,
                 color: Colors.green,
                 child: Text(
                   'True',
                   style: TextStyle(
                     color: Colors.white,
                     fontSize: 20.0,
                   ),
                 ),
                 onPressed: () {
                  checkanswer(true);
                 },
               ),
             ),
           ),
           Expanded(
             child: Padding(
               padding: EdgeInsets.all(15.0),
               child: FlatButton(
                 color: Colors.red,
                 child: Text(
                   'False',
                   style: TextStyle(
                     fontSize: 20.0,
                     color: Colors.white,
                   ),
                 ),
                 onPressed: () {
                  checkanswer(false);
                 },
               ),
             ),
           ),
         ],
       ),
    );
  }
}
