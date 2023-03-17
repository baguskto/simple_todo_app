import '../entities/todo_model.dart';

abstract class TodoRepository {
  List<TodoModel> getTodos();
  Future<void> saveTodos(List<TodoModel> todos);
}
