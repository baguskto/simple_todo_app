import 'package:get_storage/get_storage.dart';
import '../../../../core/constants/constants.dart';
import '../../../../domain/entities/todo_model.dart';

class LocalTodoDataSource {
  final GetStorage _box;

  LocalTodoDataSource(this._box);

  List<TodoModel> getTodos() {
    List<dynamic> storedTodos =
        _box.read<List<dynamic>>(StorageConstants.taskKey) ?? [];

    return storedTodos
        .map((e) => TodoModel.fromMap(e as Map<String, dynamic>))
        .toList();
  }

  Future<void> saveTodos(List<TodoModel> todos) async {
    await _box.write(
      StorageConstants.taskKey,
      todos.map((todo) => todo.toMap()).toList(),
    );
  }
}
