import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_todo_app/presentation/controllers/todo.controller.dart';

class TodoListItemWidget extends GetWidget<TodoController> {
  final int index;

  const TodoListItemWidget({required this.index, super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final todo = controller.todos[index];

      return ListTile(
        title: Text(
          todo.title,
          style: TextStyle(
            decoration: todo.isCompleted
                ? TextDecoration.lineThrough
                : TextDecoration.none,
          ),
        ),
        leading: CircleAvatar(
          child: Text(controller.getInitial(todo.title)),
        ),
        onTap: () {
          controller.toggleComplete(id: todo.id, title: todo.title);
        },
      );
    });
  }
}
