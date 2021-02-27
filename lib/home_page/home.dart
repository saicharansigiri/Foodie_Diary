import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
class MyHomepage extends StatefulWidget {
  @override
  _MyHomepageState createState() => _MyHomepageState();
}

class _MyHomepageState extends State<MyHomepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.grey[200],
        child: ListView(
          children: <Widget>[
            Container(
              color: Colors.teal[200],
              padding: EdgeInsets.all(10),
              child: Row(
                children: <Widget>[
                  Text('Foodie Diary',style: TextStyle(fontSize: 20,letterSpacing: 1.5,fontWeight: FontWeight.bold)),
                  SizedBox(width: MediaQuery.of(context).size.width*0.4-10),
                  Icon(Icons.notifications),
                  SizedBox(width: 5),
                  InkWell(
                    child: CircleAvatar(
                      backgroundImage: NetworkImage('https://i.pinimg.com/originals/ca/76/0b/ca760b70976b52578da88e06973af542.jpg'),
                    ),
                  )
                ],
              ),
            ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.fromLTRB(15, 10, 15, 0),
              child: Text(
                "Good morning, Saicharan\nWhat's your mood today😊?",
                style: TextStyle(
                  color: Colors.grey[800],
                  fontSize: 20
                ),
              ),
            ),
          ),
            SizedBox(height: 5,),
            Container(
              child: SizedBox(
                      height: MediaQuery.of(context).size.height*0.68,
                      width: MediaQuery.of(context).size.width,
                      child: Carousel(
                        boxFit: BoxFit.cover,
                        autoplay: false,
                        animationCurve: Curves.fastOutSlowIn,
                        animationDuration: Duration(milliseconds: 100),
                        dotSize: 6.0,
                        dotIncreasedColor: Color(0xFFFF335C),
                        dotBgColor: Colors.transparent,
                        dotPosition: DotPosition.bottomCenter,
                        dotVerticalPadding: 10.0,
                        showIndicator: true,
                        indicatorBgPadding: 7.0,
                  images: [
                    ExactAssetImage('images/1.jpg'),
                    ExactAssetImage('images/2.jpg'),
                    ExactAssetImage('images/3.jpg'),
                    ExactAssetImage('images/4.jpg')
                  ],
                ),
              ),

            ),
            SizedBox(height: 5,),
            Text("“Health requires healthy food.” – Roger Williams",style: TextStyle(color: Colors.teal),),

          ],
        ),
      ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.grey[200],
          items: [
            BottomNavigationBarItem(
              icon: IconButton(
                icon: Icon(Icons.add_a_photo,color: Colors.grey,),
                tooltip: 'add new photos',
                onPressed: (){
                  Navigator.pushNamed(context, '/addphotos');
                },
              ),
              title: Text('add Photos',style: TextStyle(color:Colors.grey),),
            ),
            BottomNavigationBarItem(
              icon: IconButton(
                icon: Icon(Icons.assignment),
                tooltip: 'Take Quiz',
                onPressed: (){
                  Navigator.pushNamed(context, '/myquiz');
                },
              ),
              title: Text(' Take Quiz'),
            ),
            BottomNavigationBarItem(
              icon: IconButton(
                icon: Icon(Icons.note),
                tooltip: 'Add Notes',
                onPressed: (){
                  Navigator.pushNamed(context, '/mynotes');
                },
              ),
              title: Text('My Entries'),
            ),
          ],
        ),
    );
  }


}
