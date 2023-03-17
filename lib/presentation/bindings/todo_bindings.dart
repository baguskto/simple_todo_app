import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:simple_todo_app/domain/core/utils/snackbar.util.dart';
import 'package:simple_todo_app/presentation/controllers/loading.controller.dart';
import '../../domain/repositories/todo_repository.dart';
import '../../domain/uses_cases/add_todo_use_case.dart';
import '../../domain/uses_cases/get_todo_use_case.dart';
import '../../domain/uses_cases/save_todos_use_case.dart';
import '../../domain/uses_cases/toggle_complete_todo_use_case.dart';
import '../../infrastucture/data/data_sources/local/local_todo_data_source.dart';
import '../../infrastucture/data/repositories/todo_repository_impl.dart';
import '../controllers/todo.controller.dart';

class TodoBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LocalTodoDataSource>(
        () => LocalTodoDataSource(Get.find<GetStorage>()));
    Get.lazyPut<TodoRepository>(
        () => TodoRepositoryImpl(Get.find<LocalTodoDataSource>()));
    Get.lazyPut<GetTodosUseCase>(
        () => GetTodosUseCase(Get.find<TodoRepository>()));
    Get.lazyPut<SaveTodosUseCase>(
        () => SaveTodosUseCase(Get.find<TodoRepository>()));
    Get.lazyPut<AddTodoUseCase>(
        () => AddTodoUseCase(Get.find<TodoRepository>()));
    Get.lazyPut<ToggleCompleteTodoUseCase>(
        () => ToggleCompleteTodoUseCase(Get.find<TodoRepository>()));
    Get.lazyPut<TodoController>(() => TodoController(
        Get.find<GetTodosUseCase>(),
        Get.find<SaveTodosUseCase>(),
        Get.find<AddTodoUseCase>(),
        Get.find<ToggleCompleteTodoUseCase>(),
        Get.find<LoadingController>()));
    Get.lazyPut<LoadingController>(() => LoadingController());
  }
}
