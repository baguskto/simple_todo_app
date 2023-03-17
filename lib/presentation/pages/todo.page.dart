import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../domain/core/constants/constants.dart';
import '../controllers/todo.controller.dart';
import '../widgets/loading/base.widget.dart';
import '../widgets/todo_list_item.dart';

class TodoPage extends GetView<TodoController> {
  const TodoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseWidget(
      child: Scaffold(
          appBar: AppBar(
            title: const Text(ContentConstants.toDoAppBar),
          ),
          body: _body(),
          floatingActionButton: _fab()),
    );
  }

  Widget _body() {
    return Obx(
      () => controller.todos.isNotEmpty
          ? ListView.builder(
              itemCount: controller.todos.length,
              itemBuilder: (context, index) {
                return TodoListItemWidget(index: index);
              },
            )
          : _emptyWidget(),
    );
  }

  Widget _emptyWidget() {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [Padding(
          padding: EdgeInsets.all(20.0),
          child: FlutterLogo(size: 62.0,),
        ), Text(ContentConstants.todoEmptyPage)],
      ),
    );
  }

  Widget _fab() {
    return FloatingActionButton(
      onPressed: () {
        _showAddTodoDialog();
      },
      child: const Icon(Icons.add),
    );
  }

  void _showAddTodoDialog() {
    Get.dialog(
      AlertDialog(
        title: const Text(ContentConstants.todoTitleFormAdd),
        content: Form(
          key: controller.titleKey,
          child: TextFormField(
            controller: controller.titleController,
            keyboardType: TextInputType.text,
            maxLines: 1,
            decoration:
                const InputDecoration(hintText: ContentConstants.todoHint),
            validator: (v) => controller.emptyValidator(v!),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () =>
                controller.onAddTask(controller.titleController.text),
            child: const Text(ButtonConstants.add),
          ),
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: const Text(ButtonConstants.cancel),
          ),
        ],
      ),
    );
  }
}
