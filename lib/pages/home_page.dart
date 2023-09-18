import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:teste/data/database.dart';
import 'package:teste/util/dialog_box.dart';
import 'package:teste/util/todo_tile.dart';

class HomePage extends StatefulWidget{
  
  
  
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{

  final _myBox = Hive.box('mybox');
  ToDoDataBase db = ToDoDataBase();

  final _controller = TextEditingController();

  @override
  void initState(){
    
    if(_myBox.get("LISTAAFAZER") == null){
      db.createInitialData();
    }else{
      db.loadData();
    }
    
    super.initState();
  }


  List listaAFazer = [
    ["Fazer o Café", false],
    ["Lavar Roupas", false],
    ["Estender Roupas", false],
    ["Dar ração para os gatos", false],
  ];

  void checkBoxChanged(bool? value, int index){
     setState((){
      db.listaAFazer[index][1] = !db.listaAFazer[index][1];
     });
     db.updateDataBase();
  }

  void saveNewTask(){
    setState(() {
      db.listaAFazer.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateDataBase();
  }



  void criarNovaTarefa(){
    showDialog(
      context: context,
      builder: (context){
        return DialogBox(
          controller: _controller,
          onSave: saveNewTask,
          onCancel: ()=> Navigator.of(context).pop(),
        );
      },
    );
  }

  void deleteTask(int index){
    setState(() {
      db.listaAFazer.removeAt(index);
    });
    db.updateDataBase();
  }

  @override 
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        title: Text('Personal Andressa Organizer'),
        elevation: 0,
      ),
      
      floatingActionButton: FloatingActionButton(
        onPressed: criarNovaTarefa,
        child: Icon(Icons.add),  
      ),
      
      body: ListView.builder(
        itemCount: db.listaAFazer.length,
        itemBuilder: (context, index){
          return ToDoTile(
            nomeTarefa: db.listaAFazer[index][0],
            tarefaFeita: db.listaAFazer[index][1],
            onChanged: (value) => checkBoxChanged(value, index),
            deleteFunction: (context) => deleteTask(index),
          );
        },
      ),
    );
  }
}