import 'package:flutter/material.dart';

class MyNotes extends StatefulWidget {
  @override
  _MyNotesState createState() => _MyNotesState();
}
class _MyNotesState extends State<MyNotes> {

  List<String> _todoItemsTitle = [];
  List<String> _todoItemsDescription= [];




  final myTitle = TextEditingController();
  final mydescription = TextEditingController();


// this should be called  when + button is pressed
  // ignore: non_constant_identifier_names
  void _addTodoItem(String task,String Dtask ){
    // Only add the task if the user actually entered something
    if(task.length > 0) {
      setState(() {
        _todoItemsTitle.add(task);
        _todoItemsDescription.add(Dtask);
      });
    }
  }
  //now building whole list of to-do items
  Widget _buildTodoList() {
    return new ListView.builder(
      // ignore: missing_return
      itemBuilder: (context, index) {
        // itemBuilder will be automatically be called as many times as it takes for the
        // list to fill up its available space, which is most likely more than the
        // number of todo items we have. So, we need to check the index is OK.
        if(index < _todoItemsTitle.length) {
          // ignore: missing_return
          return _buildTodoItem(_todoItemsTitle[index],_todoItemsDescription[index]);
        }
      },
    );
  }


  // Build a single todo item
  // ignore: non_constant_identifier_names
  Widget _buildTodoItem(String todoText,String Dtask) {
    return new ListTile(
        title: new Text(todoText),
      subtitle: Text(Dtask),
      isThreeLine: true,
      trailing: IconButton(
        icon: Icon(Icons.delete),
        onPressed: (){

        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
       appBar: AppBar(
         title: Text('My Notes',style: TextStyle(letterSpacing: 2.0,fontWeight: FontWeight.bold,color: Colors.grey[300]),),
         centerTitle: true,
         backgroundColor:Colors.teal,
         actions: <Widget>[
          Icon(Icons.search),
           SizedBox(width: 15),
         ],
         elevation: 0,
       ),
      body: _buildTodoList(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.grey[400],
        child: Icon(Icons.add,color: Colors.teal[400],size: 30,),
        tooltip: 'add task',
        onPressed: (){
         _showMyDialog();
        },
      ),
    );
  }


  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(' My Note😊'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                TextField(
                  controller: myTitle,
                  decoration: InputDecoration(
                    hintText: 'Cusine Title 😋',
                  ),
                  maxLines: 1,
                ),
                TextField(
                  controller: mydescription,
                  decoration: InputDecoration(
                    hintText: 'Cusine description 😇',
                  ),
                  maxLines: null,
                ),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('save',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.teal[400]),),
              onPressed: (){
                _addTodoItem(myTitle.text,mydescription.text);
                print(myTitle.text);
                Navigator.of(context).pop();
                myTitle.clear();
                mydescription.clear();
              },
            ),
          ],
        );
      },
    );
  }


}
