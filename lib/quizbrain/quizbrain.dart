import 'package:foodie/quizbrain/questions.dart';
class Quizbrain{
 int  _questionnumber = 0;
  List<Questions> _questionbank = [
     Questions(questiontext:'Lemon juice removes garlic odour off your fingers',questionanswer: true),
     Questions(questiontext:'Yogurt can quell a fiery curry.',questionanswer: true),
     Questions(questiontext:'Adding salt to water makes the water boil quicker and at a lower temperature.',questionanswer: false),
    Questions(questiontext:'the national dish of Hungary is Goulash',questionanswer: true),
    Questions(questiontext:'Apples originate from Asia.',questionanswer: true),
    Questions(questiontext:'There are 200 seeds on an average strawberry.',questionanswer: true),
    Questions(questiontext:'Almonds grow on trees.',questionanswer: true),
    Questions(questiontext:'Pound cake got its name from John Oliver Pound, who invented the recipe.',questionanswer: false),
    Questions(questiontext:'Chocolate was once used as currency.',questionanswer: true),
    Questions(questiontext:'Radishes have more water content than watermelons.',questionanswer: true),
  ];
  void nextquestion(){
    if(_questionnumber < _questionbank.length-1){
      ++_questionnumber;
    }
  }
  String getquestion(){
    return  _questionbank[_questionnumber].questiontext;
  }
  bool getanswer(){
    return _questionbank[_questionnumber].questionanswer;
  }
  void reset(){
    _questionnumber = 0;
  }
  bool checkfinished(){
    if(_questionnumber==_questionbank.length-1)
      {
        return true;
      }
    else{
      return false;
    }
  }
  int getquestionbanklength(){
    return _questionbank.length;
  }

}