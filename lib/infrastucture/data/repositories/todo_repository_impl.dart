import '../../../domain/entities/todo_model.dart';
import '../../../domain/repositories/todo_repository.dart';
import '../data_sources/local/local_todo_data_source.dart';

class TodoRepositoryImpl implements TodoRepository {
  final LocalTodoDataSource _localDataSource;

  TodoRepositoryImpl(this._localDataSource);

  @override
  List<TodoModel> getTodos() {
    return _localDataSource.getTodos();
  }

  @override
  Future<void> saveTodos(List<TodoModel> todos) {
    return _localDataSource.saveTodos(todos);
  }
}
