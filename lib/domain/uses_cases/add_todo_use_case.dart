import '../entities/todo_model.dart';
import '../repositories/todo_repository.dart';

class AddTodoUseCase {
  final TodoRepository _repository;

  AddTodoUseCase(this._repository);

  void call(String title) {
    if (title.isNotEmpty) {
      final todo =
          TodoModel(id: DateTime.now().millisecondsSinceEpoch, title: title);
      List<TodoModel> todos = _repository.getTodos();
      todos.add(todo);
      _repository.saveTodos(todos);
    }
  }
}
