import '../entities/todo_model.dart';
import '../repositories/todo_repository.dart';

class GetTodosUseCase {
  final TodoRepository _repository;

  GetTodosUseCase(this._repository);

  List<TodoModel> call() {
    return _repository.getTodos();
  }
}
