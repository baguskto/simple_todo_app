import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mocktail/mocktail.dart';
import 'package:simple_todo_app/domain/uses_cases/add_todo_use_case.dart';
import 'package:simple_todo_app/domain/uses_cases/get_todo_use_case.dart';
import 'package:simple_todo_app/domain/uses_cases/save_todos_use_case.dart';
import 'package:simple_todo_app/domain/uses_cases/toggle_complete_todo_use_case.dart';
import 'package:simple_todo_app/presentation/controllers/loading.controller.dart';
import 'package:simple_todo_app/presentation/controllers/todo.controller.dart';

class MockGetTodosUseCase extends Mock implements GetTodosUseCase {}

class MockSaveTodosUseCase extends Mock implements SaveTodosUseCase {}

class MockAddTodoUseCase extends Mock implements AddTodoUseCase {}

class MockToggleCompleteTodoUseCase extends Mock
    implements ToggleCompleteTodoUseCase {}

class MockLoadingController extends Mock implements LoadingController {}

void main() {
  late TodoController todoController;
  late MockGetTodosUseCase mockGetTodosUseCase;
  late MockSaveTodosUseCase mockSaveTodosUseCase;
  late MockAddTodoUseCase mockAddTodoUseCase;
  late MockToggleCompleteTodoUseCase mockToggleCompleteTodoUseCase;
  late MockLoadingController mockLoadingController;

  setUp(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    mockGetTodosUseCase = MockGetTodosUseCase();
    mockSaveTodosUseCase = MockSaveTodosUseCase();
    mockAddTodoUseCase = MockAddTodoUseCase();
    mockToggleCompleteTodoUseCase = MockToggleCompleteTodoUseCase();
    mockLoadingController = MockLoadingController();

    todoController = TodoController(
      mockGetTodosUseCase,
      mockSaveTodosUseCase,
      mockAddTodoUseCase,
      mockToggleCompleteTodoUseCase,
      mockLoadingController
    );

    when(() => mockGetTodosUseCase.call()).thenReturn([]);
  });

  tearDown(() {
    Get.reset();
  });

  group('TodoController', () {
    test('Initial todos list is empty', () {
      expect(todoController.todos, isEmpty);
    });

    test('Adding a todo item', () {
      const newTodo = 'Test todo';
      todoController.addTodo(newTodo);

      verify(() => mockAddTodoUseCase.call(newTodo)).called(1);
      verify(() => mockGetTodosUseCase.call()).called(1);
    });

    // test('Toggle complete of a todo item', () {
    //   final todo = TodoModel(id: 1, title: 'Test Todo', isCompleted: false);
    //   todoController.todos.add(todo);
    //
    //   todoController.toggleComplete(id: todo.id, title: todo.title);
    //
    //   verify(() => mockToggleCompleteTodoUseCase.call(todo.id)).called(1);
    //   verify(() => mockGetTodosUseCase.call()).called(1);
    // });

    test('Empty validator returns an error message if the input is empty', () {
      const emptyInput = '';
      final result = todoController.emptyValidator(emptyInput);
      expect(result, 'Please fill the form');
    });

    test('Empty validator returns null if the input is not empty', () {
      const nonEmptyInput = 'Test todo';
      final result = todoController.emptyValidator(nonEmptyInput);
      expect(result, null);
    });

    test('Get initial returns the first character of the input capitalized', () {
      const input = 'test';
      final result = todoController.getInitial(input);
      expect(result, 'T');
    });
  });
}
