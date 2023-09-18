import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoTile extends StatelessWidget{
  
  final String nomeTarefa;
  final bool tarefaFeita;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;
  
  
  ToDoTile({
    super.key,
    required this.nomeTarefa,
    required this.tarefaFeita,
    required this.onChanged,
    required this.deleteFunction,
  });

  

  @override 
  Widget build(BuildContext context){
    return Padding(
      padding: const EdgeInsets.only(left:20.0, right:20.0, top:20.0),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children:[
            SlidableAction(onPressed: deleteFunction,
            icon: Icons.delete,
            backgroundColor: Colors.red,
            borderRadius: BorderRadius.circular(10),
            ),
          ],
        ),
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.yellow,
          ),
          child: Row(
            children: [
              //Checkbox
              Checkbox(
                value: tarefaFeita,
                onChanged: onChanged,
                activeColor: Colors.black,
              ),
              //Nome da Tarefa
              Text(
                nomeTarefa,
                style: TextStyle(decoration: tarefaFeita 
                ? TextDecoration.lineThrough 
                : TextDecoration.none,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}