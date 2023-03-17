import '../entities/todo_model.dart';
import '../repositories/todo_repository.dart';

class ToggleCompleteTodoUseCase {
  final TodoRepository _repository;

  ToggleCompleteTodoUseCase(this._repository);

  void call(int id) {
    List<TodoModel> todos = _repository.getTodos();
    int index = todos.indexWhere((todo) => todo.id == id);
    if (index != -1) {
      todos[index].isCompleted = !todos[index].isCompleted;
      _repository.saveTodos(todos);
    }
  }
}
