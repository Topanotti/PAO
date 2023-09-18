import 'package:hive_flutter/hive_flutter.dart';

class ToDoDataBase{

  List listaAFazer = [];

  final _myBox = Hive.box('mybox');

  void createInitialData(){
    listaAFazer = [
      ["Fazer o Café", false],
      ["Dar Ração Para os Gatos", false],
      ["Colocar Roupa Para Lavar", false],
      ["Extender a Roupa Para Secar", false],
    ];
  }

  void loadData(){
    listaAFazer = _myBox.get("LISTAAFAZER");
  }

  void updateDataBase(){
    _myBox.put("LISTAAFAZER", listaAFazer);
  }



}