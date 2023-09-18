import 'package:flutter/material.dart';
import 'package:teste/util/my_button.dart';

class DialogBox extends StatelessWidget{
  final controller;

  VoidCallback onSave;
  VoidCallback onCancel;

  
  DialogBox({
    super.key,
    required this.controller,
    required this.onCancel,
    required this.onSave,
   });

  @override
  Widget build(BuildContext context){
    return AlertDialog(
      backgroundColor: Colors.white,
      content: Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Adicionar uma Nova Tarefa",
              ),
            ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
            MyButton(text: "Salvar", onPressed: onSave),
            const SizedBox(width: 5),
            MyButton(text: "Cancelar", onPressed: onCancel),
          ],)
          ],
        ),
      ),
    );
  }
}