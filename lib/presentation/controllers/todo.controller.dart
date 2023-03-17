import 'package:flutter/material.dart';
import 'package:simple_todo_app/domain/core/utils/snackbar.util.dart';

import '../../domain/core/constants/constants.dart';
import '../../domain/entities/todo_model.dart';

import 'package:get/get.dart';

import '../../domain/uses_cases/add_todo_use_case.dart';
import '../../domain/uses_cases/get_todo_use_case.dart';
import '../../domain/uses_cases/save_todos_use_case.dart';
import '../../domain/uses_cases/toggle_complete_todo_use_case.dart';
import 'loading.controller.dart';

class TodoController extends GetxController {
  final todos = <TodoModel>[].obs;
  final TextEditingController titleController = TextEditingController();
  final GetTodosUseCase _getTodosUseCase;
  final SaveTodosUseCase _saveTodosUseCase;
  final AddTodoUseCase _addTodoUseCase;
  final ToggleCompleteTodoUseCase _toggleCompleteTodoUseCase;
  final titleKey = GlobalKey<FormState>();
  final LoadingController _loadingController;

  TodoController(
    this._getTodosUseCase,
    this._saveTodosUseCase,
    this._addTodoUseCase,
    this._toggleCompleteTodoUseCase,
    this._loadingController,
  );

  @override
  Future<void> onInit() async {
    super.onInit();
    readTodoStorage();
  }

  void readTodoStorage() {
    _loadingController.isLoading = true;
    todos.value = _getTodosUseCase.call();
    _loadingController.isLoading = false;
  }

  void addTodo(String title) {
    if (title.isNotEmpty) {
      _addTodoUseCase.call(title);
      readTodoStorage();
    }

    titleController.clear();
  }

  void toggleComplete({required int id, required String title}) {
    try {
      _toggleCompleteTodoUseCase.call(id);
      readTodoStorage();
      todos.refresh();
      SnackbarUtil.showSuccess(
          message: '$title ${SnackBarConstants.successDone}');
    } catch (e) {
      SnackbarUtil.showError(
          message: '$title ${SnackBarConstants.failedChangeStatus}');
    }
  }

  String? emptyValidator(String v) {
    if (v.isEmpty) {
      return ValidationConstants.cantEmpty;
    } else {
      return null;
    }
  }

  String getInitial(String item) {
    return item.capitalizeFirst!.substring(0, 1);
  }

  void onAddTask(String value) {
    try {
      if (titleKey.currentState!.validate()) {
        addTodo(value);
        Get.back();
        SnackbarUtil.showSuccess(
            message: '$value ${SnackBarConstants.successAdded}');
      }
    } catch (e) {
      SnackbarUtil.showError(
          message: '$value ${SnackBarConstants.failedAdded}');
    }
  }
}
