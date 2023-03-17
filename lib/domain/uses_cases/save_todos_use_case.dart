import '../entities/todo_model.dart';
import '../repositories/todo_repository.dart';

class SaveTodosUseCase {
  final TodoRepository _repository;

  SaveTodosUseCase(this._repository);

  Future<void> call(List<TodoModel> todos) {
    return _repository.saveTodos(todos);
  }
}
